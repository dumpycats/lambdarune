draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, blackalpha);
image_blend = make_color_hsv(obj_fountainfloor_c3.hue, 255, 255);
draw_sprite_ext(spr_foanetv_static, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_self();
timer++;

if (timer == 8)
    audio_play_sound(snd_bell_bc, 1, false);

if (timer == 25)
    audio_play_sound(snd_cardrive, 1, false);

if (timer == 51)
{
}

if (timer >= 51 && timer < 110)
{
    percent1 += 0.02;
    percent1 = clamp(percent1, 0, 1);
    var position1 = animcurve_channel_evaluate(curveease, percent1);
    var view_w = lerp(640, 320, position1);
    var view_h = lerp(480, 240, position1);
    var a240150 = lerp(240, 150, position1);
    blackalpha = lerp(0, 1, position1);
    var center_x = 320;
    var center_y = a240150;
    var view_x = center_x - (view_w / 2);
    var view_y = center_y - (view_h / 2);
    camera_set_view_size(view_camera[0], view_w, view_h);
    camera_set_view_pos(view_camera[0], view_x, view_y);
    
    if (percent1 >= 0.8)
    {
        percent2 += 0.1;
        
        if (percent2 == 0.1)
        {
            instance_create_depth(320, 165, depth - 1, obj_foanetv_2);
            audio_sound_gain(mus_f_noise, 0, 0);
            audio_play_sound(mus_f_noise, 1, true);
        }
        else if (percent2 == 0.2)
        {
            audio_sound_gain(mus_f_noise, 0.5, 166);
        }
        
        if (percent2 <= 1)
        {
            var position2 = animcurve_channel_evaluate(curveease, percent2);
            image_alpha = lerp(1, 0, percent2);
            obj_foanetv_2.image_alpha = lerp(0, 1, percent2);
        }
    }
}
