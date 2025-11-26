image_alpha += 0.2;

if (image_alpha == 7)
{
    audio_stop_sound(snd_stringpull);
    audio_stop_all();
}

if (image_alpha > 7)
    audio_stop_sound(snd_stringpull);

if (image_alpha == 9)
{
    audio_stop_sound(snd_stringpull);
    room_goto(rm_ch3_sof);
    audio_sound_gain(snd_deep_noise, 1, 0);
}
