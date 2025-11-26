depth = 30;

if (global.buyitems < 5)
{
    percent1 += 0.0625;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = y;
    var _end = 138;
    var _distance = _end - _start;
    y = _start + (_distance * position);
    percent2 = 0;
}

if (global.buyitems == 5)
{
    percent2 += 0.2;
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = y;
    var _end2 = 316;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position2);
    percent1 = 0;
}
