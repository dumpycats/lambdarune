if (instance_exists(obj_KreidKR2))
{
    if (obj_KreidKR2.d35trigger1 && global.dialogue == 35)
    {
        percent1 += 0.1;
        position1 = animcurve_channel_evaluate(curve1, percent1);
        var _start1 = 2746;
        var _end1 = 2826;
        var _distance1 = _end1 - _start1;
        x = _start1 + (_distance1 * position1);
    }
    
    if (percent1 >= 1)
    {
    }
}

if (instance_exists(obj_shadowmankr1))
{
    if (obj_shadowmankr1.percent9 >= 1)
    {
        percent3 += 0.1;
        position3 = animcurve_channel_evaluate(curve3, percent3);
        var _start3 = 2826;
        var _end3 = 2746;
        var _distance3 = _end3 - _start3;
        x = _start3 + (_distance3 * position3);
    }
}
