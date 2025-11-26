if (down)
{
    percent1++;
    
    if (percent1 <= 90)
    {
        var position = animcurve_channel_evaluate(curveslower, percent1 / 90);
        y = lerp(0, 720, position);
    }
    
    if (percent1 == 90)
    {
        audio_stop_sound(snd_chain_extend);
        audio_play_sound(snd_bell_bc, 1, false);
    }
}

depth = obj_tv_room_chains.depth - 10;
