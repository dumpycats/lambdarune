timer++;

if (timer == 8)
    audio_play_sound(snd_impending_cut, 1, false, 1, false, 0.9);

if (image_index >= 0)
{
    percent1++;
    
    if (percent1 <= 30)
        var position = animcurve_channel_evaluate(curveease, percent1 / 30);
}
