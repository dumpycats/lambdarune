var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (!(global.dialogue == 15))
{
    percent1 += 0.0026246719160104987;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = cam_x + -305;
    var _end = cam_x + 119;
    var _distance = _end - _start;
    x = _start + (_distance * position);
}

if (global.dialogue < 15)
{
    xx = x;
    yy = y;
}

if (global.dialogue >= 15 && global.dialogue < 16)
{
    dialogue15timer++;
    percent2 += (1/30);
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = xx;
    var _end2 = cam_x + 152;
    var _distance2 = _end2 - _start2;
    x = _start2 + (_distance2 * position2);
    percent3 += (1/30);
    position3 = animcurve_channel_evaluate(curve3, percent3);
    var _start3 = yy;
    var _end3 = yy - 33;
    var _distance3 = _end3 - _start3;
    y = _start3 + (_distance3 * position3);
}

if (dialogue15timer > 30)
{
    image_speed = 0;
    image_index = 2;
}

if (global.dialogue >= 16)
{
    x = cam_x + 152;
    y = yy - 33;
}

if (global.dialogue == 25)
{
    dialogue15timer = 0;
    image_speed = 1;
}
