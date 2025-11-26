if (global.c3outskirtscompleted)
{
    timer++;
    
    if (timer == 0)
        instance_create_depth(320, 240, depth - 1, oKRSOnPlatform);
    
    if (timer == 450)
        sprite_index = sBackgroundChapter3Menu2;
}

if (timer > 390)
{
    percent1 += 0.016666666666666666;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = 200;
    var _end = 240;
    var _distance = _end - _start;
    y = _start + (_distance * position);
    percent3 += 0.016666666666666666;
    position3 = animcurve_channel_evaluate(curve3, percent3);
    var _start3 = 280;
    var _end3 = 520;
    var _distance3 = _end3 - _start3;
    oKRSOnPlatform.y = _start3 + (_distance3 * position3);
}

if (timer > 225 && timer < 300)
{
    percent2 += 0.016666666666666666;
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = 180;
    var _end2 = 200;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position2);
    percent4 += 0.016666666666666666;
    position4 = animcurve_channel_evaluate(curve4, percent4);
    var _start4 = 240;
    var _end4 = 280;
    var _distance4 = _end4 - _start4;
    oKRSOnPlatform.y = _start4 + (_distance4 * position4);
}

if (timer == 420)
    instance_create_depth(320, 240, -32, oWhiteScreenC3Menu);

if (timer == 3135)
    instance_create_depth(320, 70, -31, oChapter3MenuLogo2);
