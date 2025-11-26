if (global.krishp <= 0)
    exit;

percent1 += (1/30);
position1 = animcurve_channel_evaluate(curve1, percent1);
var _start1 = xx;
var _end1 = xx + xoffset;
var _distance1 = _end1 - _start1;
x = _start1 + (_distance1 * position1);

if (percent1 == 0.5)
    instance_create_depth(xx, yy, -44, obj_smoke_c3);

if (percent1 > 1)
    image_alpha -= 0.03;

if (percent1 <= 0.1)
    image_alpha += 0.234;

if (image_alpha > 0.7)
    image_alpha = 0.7;
