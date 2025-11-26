if (down)
{
    percent1++;
    
    if (percent1 <= 90)
    {
        var position = animcurve_channel_evaluate(curveslower, percent1 / 90);
        y = lerp(0, 720, position);
    }
    else
    {
        if (percent1 == 100)
            audio_play_sound(snd_chain_extend, 1, true, 0.5);
        
        if (percent1 >= 100)
        {
            percent2++;
            
            if (percent2 <= 60)
            {
                var position2 = animcurve_channel_evaluate(curvefaster, percent2 / 60);
                y = lerp(720, 0, position2);
            }
            else if (percent2 == 61)
            {
                audio_play_sound(snd_jump_bc, 1, false, 0.6);
                obj_mike_e3.fall = true;
                audio_stop_sound(snd_chain_extend);
            }
        }
    }
}
