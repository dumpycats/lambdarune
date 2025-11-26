percent1++;

if (percent1 <= 50)
{
    var position2 = animcurve_channel_evaluate(curveslower, percent1 / 50);
    var position = animcurve_channel_evaluate(curvefaster, percent1 / 50);
    x = lerp(xx, 428, position2);
    y = lerp(yy, 260, position);
}

if (percent1 == 50)
{
    audio_play_sound(snd_noise, 1, false);
    image_index = 0;
    sprite_index = spr_remote_fall;
}

if (percent1 == 64)
    image_speed = 0;
