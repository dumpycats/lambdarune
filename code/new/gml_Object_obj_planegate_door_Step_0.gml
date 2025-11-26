if (image_speed == 1)
{
    timer++;
    
    if (timer == 0)
        audio_play_sound(snd_elecdoor_open, 1, false);
}

depth = obj_kris_c3.depth + 15;
