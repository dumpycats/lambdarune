image_xscale = scale;
image_yscale = scale;
percent1 += 0.0625;
var position1 = animcurve_channel_evaluate(curvelinear, percent1);
var delta_scale = 1.7;
scale = 0.1 + (delta_scale * position1);

if (percent1 == 0.1875)
    audio_play_sound(snd_explosion, 1, false);

if (percent1 == 5)
    audio_play_sound(snd_grab, 1, false);

if (percent1 == 6.25)
{
    room_goto(rm_ch3_cathodetower_aftermath);
    audio_sound_gain(mus_wind, 0.2, 1500);
}
