var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (timer > 77 && timer <= 96)
{
    percent1 += 0.05263157894736842;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = cam_y + 140;
    var _end = cam_y + 220;
    var _distance = _end - _start;
    y = _start + (_distance * position);
}

if (timer > 177 && timer <= 212)
{
    percent2 += 0.02857142857142857;
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = cam_y + 220;
    var _end2 = cam_y + 251;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position2);
}

oFenceC3R7.y = y;
oFenceShadowC3R7.y = y;
