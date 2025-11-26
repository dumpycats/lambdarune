shader_set(sh_wavewarp_anchor);
var tex = sprite_get_texture(sprite_index, image_index);
var uvs = sprite_get_uvs(sprite_index, image_index);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_time"), current_time / 1000);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_amplitude"), 0.001);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_frequency"), 300);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_speed"), 0.5);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_rainbow_speed"), 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_saturation"), 1);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_uv_top_left"), uvs[0], uvs[1]);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_uv_bottom_right"), uvs[2], uvs[3]);
var anchor_screen_y = 376;
var uv_anchor_y = lerp(uvs[1], uvs[3], 1);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_anchor_y"), uv_anchor_y);
texture_set_stage(0, tex);
shader_set_uniform_i(shader_get_uniform(sh_wavewarp_anchor, "u_texture"), 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp_anchor, "u_flat_color_mode"), 0.45);
var purpleoverlay = 1376277;
texture_set_stage(0, tex);
shader_set_uniform_i(shader_get_uniform(sh_wavewarp_anchor, "u_texture"), 0);

if (on)
    draw_sprite_ext(sprite_index, image_index, x, y - 64, image_xscale, image_yscale * -1, 0, purpleoverlay, image_alpha - flashalpha);

shader_reset();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x + xoffset2, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha / 2);
    shader_reset();
}

xoffset2 = xoffset1 * 2;

if (on)
    draw_self();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x + xoffset1, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (flashtrigger)
{
    audio_stop_sound(mus_broadcast_error);
    audio_sound_gain(mus_broadcast_error, 1, 0);
    flashalpha += 0.2;
    
    if (flashalpha > 1)
    {
        var yoffset1 = -54;
        on = false;
        outtrigger = true;
        flashtrigger = false;
        instance_create_depth(x, y - 80, depth - 50, obj_recruit_ch3);
        image_alpha = 0;
        audio_play_sound(snd_spare, 1, false);
        instance_create_depth(x, (y - 14) + yoffset1, depth - 30, oSpareStar);
        instance_create_depth(x - 32, y + yoffset1, depth - 30, oSpareStar);
        instance_create_depth(x + 22, y + 16 + yoffset1, depth - 30, oSpareStar);
        instance_create_depth(x + 12, y + 28 + yoffset1, depth - 30, oSpareStar);
        instance_create_depth(x - 10, (y - 24) + yoffset1, depth - 30, oSpareStar);
        instance_create_depth(x + 36, (y - 30) + yoffset1, depth - 30, oSpareStar);
        oSpareStar.image_xscale = -1;
    }
}

if (outtrigger)
{
    xoffset1 += 3;
    flashalpha -= 0.05;
    image_alpha = 0;
    timer++;
    
    if (timer >= 70)
    {
        percent1++;
        
        if (percent1 <= 60)
        {
            var position = animcurve_channel_evaluate(curvelinear, percent1 / 60);
            var change = lerp(0, -64, position);
            camera_set_view_pos(view_camera[0], change, 0);
        }
        
        if (percent1 >= 60)
        {
            var left = keyboard_check_pressed(vk_left);
            var right = keyboard_check_pressed(vk_right);
            var up = keyboard_check_pressed(vk_up);
            var down = keyboard_check_pressed(vk_down);
            
            if ((left || right || up || down) && endtrigger == false)
            {
                if (up)
                    obj_kris_sof_end.sprite_index = sKrisWalkUp;
                else if (down)
                    obj_kris_sof_end.sprite_index = sKrisWalkDown;
                else if (left)
                    obj_kris_sof_end.sprite_index = sKrisWalkLeft;
                
                obj_kris_sof_end.image_index = 1;
                endtrigger = true;
            }
            
            if (endtrigger)
            {
                endtimer++;
                
                if (endtimer == 2)
                {
                    audio_play_sound(snd_step1, 1, false);
                    
                    with (obj_ch3_foaneend_text)
                    {
                        talking = true;
                        dialogue = 53;
                        reset_dialogue_normal();
                    }
                }
                
                if (endtimer == 4)
                    obj_kris_sof_end.image_index = 0;
            }
        }
    }
}
