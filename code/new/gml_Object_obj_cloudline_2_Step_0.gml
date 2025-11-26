if (instance_exists(obj_cloudline_1))
    depth = obj_cloudline_1.depth + 4;

if (down)
{
    percent1 += (1 / duration);
    var position1 = animcurve_channel_evaluate(curvelinear, percent1);
    var delta_y = bottom_y - top_y;
    y = top_y + (delta_y * position1);
}
else if (up)
{
    percent1 += (1 / duration);
    var position1 = animcurve_channel_evaluate(curvelinear, percent1);
    var delta_y = top_y - bottom_y;
    y = bottom_y + (delta_y * position1);
}

if (percent1 > 1)
    instance_destroy();
