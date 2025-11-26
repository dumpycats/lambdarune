if (flyup)
{
    percent1 += 0.1;
    
    if (percent1 <= 1)
    {
        var position1 = animcurve_channel_evaluate(curvefaster, percent1);
        var delta_y = yy - initialy;
        y = initialy + (delta_y * position1);
        
        if (percent1 == 0.7)
            obj_kris_plane.sprite_index = sKrisWalkDown;
        
        if (percent1 == 1)
        {
            audio_play_sound(snd_rudebuster_hit, 1, false);
            obj_kris_plane.flyup = true;
        }
    }
    else
    {
        y += 4;
        image_alpha -= 0.1;
    }
}
