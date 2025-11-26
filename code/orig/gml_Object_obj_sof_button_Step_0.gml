var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (place_meeting(x, y, obj_kris_c3))
{
    if (advance_pressed)
        triggered = true;
}

if (triggered)
{
    triggertimer++;
    
    if (triggertimer == 0)
    {
        image_index += 1;
        global.playermove = false;
        obj_kris_c3.image_speed = 0;
        obj_kris_c3.image_index = 0;
        obj_susie_c3.image_speed = 0;
        obj_susie_c3.image_index = 0;
        obj_ralsei_c3.image_speed = 0;
        obj_ralsei_c3.image_index = 0;
        audio_play_sound(snd_noise, 1, false);
        audio_play_sound(snd_button, 1, false);
        initialcam = obj_kris_c3.y - 240;
    }
    
    if (triggertimer >= 30)
    {
        view_camera[0] = view_camera[1];
        percent1++;
        
        if (percent1 <= 90)
        {
            var position = animcurve_channel_evaluate(curveease, percent1 / 90);
            var ycam = lerp(initialcam, 0, position);
            camera_set_view_pos(view_camera[1], 0, ycam);
        }
        
        if (percent1 == 120)
        {
            obj_vault.turning = true;
            obj_vault_light.brighten = true;
        }
    }
}
