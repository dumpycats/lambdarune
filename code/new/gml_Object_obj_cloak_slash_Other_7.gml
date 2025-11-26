image_alpha = 0;

if (!hit)
{
    audio_play_sound(snd_scytheburst, 1, false, 1, false, 0.8);
    audio_play_sound(snd_rumble, 1, true);
    audio_stop_sound(snd_impending_cut);
    instance_create_depth(320, 360, -125, obj_SOUL_c3end);
    hit = true;
}
