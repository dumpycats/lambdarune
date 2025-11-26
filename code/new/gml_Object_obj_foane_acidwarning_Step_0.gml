if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
    else
    {
    }
}

audio_play_sound(snd_sfx_a_target, 1, false);
