if (triggerup)
{
    percent1++;
    
    if (percent1 <= 30)
    {
        if (percent1 == 1)
            audio_play_sound(snd_chain_extend, 1, true, 0.8, false, 0.8);
        
        if (percent1 == 20)
        {
            audio_stop_sound(snd_chain_extend);
            audio_play_sound(snd_impact_bc, 1, false, 1, false, 0.8);
            depth = obj_vault.depth - 2;
        }
        
        var position = animcurve_channel_evaluate(curvefaster, percent1 / 20);
        image_alpha = lerp(0, 1, position);
        y = lerp(starty, finaly, position);
    }
}
