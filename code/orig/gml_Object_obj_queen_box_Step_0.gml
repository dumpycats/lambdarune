if (!fall)
{
    yy = y;
}
else
{
    percent1++;
    
    if (percent1 <= 10)
    {
        var position = animcurve_channel_evaluate(curvefaster, percent1 / 10);
        y = lerp(yy, yy + 36, position);
    }
    
    if (percent1 == 9)
        audio_play_sound(snd_noise, 1, false);
}
