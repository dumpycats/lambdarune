if (finalout)
{
    depth = obj_SOUL_battle_sof.depth - 1;
    
    if (instance_exists(obj_battle_sof))
    {
        if (global.alldown)
        {
            image_speed = 0;
            speed = 0;
        }
        else
        {
            time = current_time / 1000;
        }
    }
    
    audio_stop_sound(snd_stringpull);
    obj_SOUL_battle_sof.stringstop = true;
    
    if (!global.alldown)
    {
        percent4 += 0.05;
        var position4 = animcurve_channel_evaluate(curve1, percent4);
        var size_offset = 150;
        scale = 10 + (size_offset * position4);
    }
    
    draw_sprite_ext(spr_specialboom, 0, obj_foane.x + 22, obj_foane.y - 258, 0.2 * scale, 0.2 * scale, 0, c_white, 1);
    
    if (percent4 > 0.45)
    {
        instance_destroy(obj_circleblast);
        instance_destroy(obj_spike_c3);
    }
    
    if (percent4 > 0.2)
    {
        if (instance_exists(obj_circleblast))
            obj_circleblast.deleteself = true;
    }
    
    if (percent4 > 2.25)
    {
        alpha += 0.0334;
        draw_sprite_ext(spr_specialboom, 0, 320, 240, 20, 20, 0, c_black, alpha);
    }
}
