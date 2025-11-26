if (sprite_index == spr_foane_ex_laugh_glitch)
{
    sprite_index = spr_foane_ex_down;
    image_index = 2;
    image_speed = 0;
    xoffset = 2;
    audio_play_sound(snd_undynestep, 1, false, 1, false, 0.75);
    audio_stop_sound(snd_glitchbuffer);
    d10endtrigger = true;
}

if (sprite_index == spr_foane_ex_laugh_glitch_2)
{
    sprite_index = spr_foane_ex_down;
    image_index = 2;
    image_speed = 0;
    yoffset = 2;
    audio_play_sound(snd_undynestep, 1, false, 1, false, 0.6);
    audio_stop_sound(snd_glitchbuffer);
    d25endtrigger = true;
}
