if (global.elevatortime)
{
    percent1 += 0.016666666666666666;
    position1 = animcurve_channel_evaluate(curve1, percent1);
    var _start1 = -20;
    var _end1 = 500;
    var _distance1 = _end1 - _start1;
    y = _start1 + (_distance1 * position1);
    
    if (percent1 == 0.5)
        instance_create_depth(320, -20, depth, obj_elevatorline);
}
