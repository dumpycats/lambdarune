draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_gray, 1);
draw_self();

if (turning)
{
    percent1++;
    
    if (percent1 == 1)
    {
        global.vaultopen = true;
        audio_sound_gain(mus_wind, 0, 0);
        audio_play_sound(snd_dooropen, 1, false, 1, false, 0.5);
        audio_play_sound(mus_wind, 1, true, 0.5, false, 0.7);
    }
    
    if (percent1 == 2)
        audio_sound_gain(mus_wind, 1, 3000);
    
    if (percent1 <= 90)
    {
        var position = animcurve_channel_evaluate(curvefaster, percent1 / 90);
        image_angle = lerp(0, 180, position);
    }
    
    if (percent1 == 90)
    {
        audio_play_sound(snd_impact, 1, false, 1, false, 0.6);
        camera_set_view_pos(view_camera[1], 0, -6);
    }
    
    if (percent1 == 92)
        camera_set_view_pos(view_camera[1], 0, 6);
    
    if (percent1 == 94)
        camera_set_view_pos(view_camera[1], 0, -4);
    
    if (percent1 == 96)
        camera_set_view_pos(view_camera[1], 0, 4);
    
    if (percent1 == 98)
        camera_set_view_pos(view_camera[1], 0, -2);
    
    if (percent1 == 100)
        camera_set_view_pos(view_camera[1], 0, 2);
    
    if (percent1 == 102)
        camera_set_view_pos(view_camera[1], 0, 1);
    
    if (percent1 == 104)
        camera_set_view_pos(view_camera[1], 0, 0);
    
    if (percent1 >= 140)
    {
        percent2++;
        
        if (percent2 <= 90)
        {
            var position1 = animcurve_channel_evaluate(curveease, percent2 / 90);
            var camy = lerp(0, obj_sof_button.initialcam, position1);
            camera_set_view_pos(view_camera[1], 0, camy);
        }
        
        if (percent2 == 91)
        {
            view_camera[1] = view_camera[0];
            obj_vault_bridge.triggerup = true;
            global.playermove = true;
            turning = false;
            camera_set_view_target(view_camera[0], obj_kris_c3);
        }
    }
}
