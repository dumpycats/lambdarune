if (instance_exists(obj_KreidKR2))
{
    if (obj_KreidKR2.d35trigger1 && global.dialogue == 35)
    {
        percent1 += 0.1;
        position1 = animcurve_channel_evaluate(curve1, percent1);
        var _start1 = 2346;
        var _end1 = 2266;
        var _distance1 = _end1 - _start1;
        x = _start1 + (_distance1 * position1);
    }
    
    if (percent1 == 1)
    {
        depth = -5;
        obj_sewercover2.depth = -5;
        obj_sewercoverborder.depth = -5;
        instance_create_depth(2346, 343, obj_sewercoverborder.depth + 1, obj_shadowmankr1);
        instance_create_depth(2746, 343, obj_sewercoverborder.depth + 1, obj_shadowmankr2);
        obj_shadowmankr1.depth = -4;
        obj_shadowmankr2.depth = -4;
    }
    
    if (percent1 > 1.4)
        shocktrigger = true;
}

if (instance_exists(obj_shadowmankr1))
{
    if (obj_shadowmankr1.percent9 >= 1)
    {
        if (percent3 == 0.1)
            audio_play_sound(snd_paperrise, 1, false);
        
        percent3 += 0.1;
        position3 = animcurve_channel_evaluate(curve3, percent3);
        var _start3 = 2266;
        var _end3 = 2346;
        var _distance3 = _end3 - _start3;
        x = _start3 + (_distance3 * position3);
    }
}
