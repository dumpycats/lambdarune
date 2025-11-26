if (shaking && !breaking)
{
    randomize();
    randomx = irandom_range(-2, 2);
    randomy = irandom_range(-1, 1);
}
else
{
    randomx = 0;
    randomy = 0;
}

shader_set(shader_Distort);
var tmultiplier = 0.2;
var xmultiplier = 4;
var ymultiplier = 4;

if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
        tmultiplier = 0;
}

if (instance_exists(obj_battle_sio) && global.alldown)
{
    shader_set_uniform_f(uniTime, currenttimefroze * tmultiplier);
}
else
{
    shader_set_uniform_f(uniTime, current_time * tmultiplier);
    currenttimefroze = current_time;
}

var tex_sprite = sprite_get_texture(spr_sio_clouds, image_index);
shader_set_uniform_f(uniTexel, texture_get_texel_width(tex_sprite) * xmultiplier, texture_get_texel_height(tex_sprite) * ymultiplier);
draw_sprite_ext(spr_sio_clouds, image_index, 270, 280, image_xscale, image_yscale, 0, c_white, 1);
shader_reset();
var time = current_time / 1000;
draw_sprite_ext(spr_maximike_background_new, 0, x, y, 2, 2, 0, c_white, 1);
draw_set_color(c_black);
draw_rectangle(218, 100, 462, 256, 0);
var c_pink = 6488319;
var c_ltblue = 16773120;

if (audio_is_playing(mus_tennasiblings_boss))
{
    var frame_duration = 33.333333333333336;
    frame_accumulator += (delta_time / 1000);
    
    while (frame_accumulator >= frame_duration)
    {
        frame_accumulator -= frame_duration;
        audio_frame++;
        fade_up += 0.16666666666666666;
        fade_up = clamp(fade_up, 0, 1);
        
        if (audio_frame >= 3446)
            audio_frame = 1;
    }
}
else
{
    frame_accumulator = 0;
    audio_frame = 0;
}

draw_set_alpha(image_alpha);

if (instance_exists(obj_battle_sio))
{
    if (global.enemyturn)
        image_alpha -= 0.1;
    else
        image_alpha += 0.1;
}

image_alpha = clamp(image_alpha, 0.2, 1);
audio_frame = clamp(audio_frame, 0, array_length(frequency_data) - 1);
var num_bars = 30;
var bar_width = 237 / num_bars;
var ax = 221;
var ay = 240;
var row = frequency_data[audio_frame];
var bar_colors = [c_pink, 65280, c_ltblue, c_pink, c_ltblue, 65280, c_ltblue, c_pink, c_ltblue, c_ltblue, c_pink, c_ltblue, 65280, c_ltblue, c_pink, c_ltblue, 65280, c_pink, 65280, c_ltblue, c_pink, c_ltblue, 65280, c_ltblue, c_pink, c_ltblue, c_ltblue, c_pink, c_ltblue, 65280];

for (var i = 0; i < num_bars; i++)
{
    var skew = 0.25;
    var mid = round(num_bars * skew);
    var mirrored_index = abs(i - mid);
    var value = row[mirrored_index];
    var bar_height;
    
    if (audio_is_playing(mus_tennasiblings_boss))
        bar_height = clamp(((value + 80) / 80) * 182, 0, 182) * audio_sound_get_gain(mus_tennasiblings_boss) * fade_up;
    else
        bar_height = clamp(((value + 80) / 80) * 1, 0, 1) * audio_sound_get_gain(mus_tennasiblings_boss) * fade_up;
    
    var bar_x = ax + (i * bar_width);
    var bar_color = bar_colors[i];
    draw_rectangle_color(bar_x + 2, ay - bar_height, (bar_x + bar_width) - 2, ay + bar_height, bar_color, bar_color, bar_color, bar_color, false);
}

draw_set_alpha(1);
draw_sprite_ext(spr_maximike_background_new, 1, x, y, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_maximike_background_new, 2, pos_bx + randomx, pos_by + randomy, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_maximike_background_new, 2, pos_rx, y, 2, 2, 0, c_white, 1);

if (breaking)
{
    breakingpercent++;
    
    if (breakingpercent <= 80)
    {
        var position1 = animcurve_channel_evaluate(curvefaster, breakingpercent / 55);
        var position2 = animcurve_channel_evaluate(curveslower, breakingpercent / 55);
        pos_by = lerp(240, 600, position1);
        pos_bx = lerp(340, 460, position2);
    }
}

if (reattach)
{
    percent1++;
    var position = animcurve_channel_evaluate(curveslower, percent1 / 30);
    pos_rx = lerp(680, x, position);
}

draw_sprite_ext(spr_maximike_background_new, 3, 340, y, 2, 2, 0, c_white, 1);
