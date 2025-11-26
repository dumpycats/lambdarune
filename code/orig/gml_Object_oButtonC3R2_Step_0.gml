if (place_meeting(x, y, oKrisPlayerC3) || place_meeting(x, y, oSusieC3))
{
    image_index = 1;
    timer++;
}
else
{
    image_index = 0;
    timer = 0;
}

if (timer == 1)
    audio_play_sound(snd_noise, 1, false);
