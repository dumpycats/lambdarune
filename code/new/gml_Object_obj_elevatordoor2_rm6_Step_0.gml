if (global.dooropen)
{
    percent1 += 0.2;
    position1 = animcurve_channel_evaluate(curve1, percent1);
    var _start1 = 320;
    var _end1 = 390;
    var _distance1 = _end1 - _start1;
    x = _start1 + (_distance1 * position1);
}
