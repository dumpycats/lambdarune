var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (!(global.dialogue == 15))
{
    percent1 += 0.0026246719160104987;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = cam_x + -212;
    var _end = cam_x + 212;
    var _distance = _end - _start;
    x = _start + (_distance * position);
}

if (global.dialogue < 15)
{
    xx = x;
    yy = y;
}

if (global.dialogue == 15)
{
    dialogue15timer++;
    percent2 += (1/30);
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = xx;
    var _end2 = cam_x + 245;
    var _distance2 = _end2 - _start2;
    x = _start2 + (_distance2 * position2);
    percent3 += (1/30);
    position3 = animcurve_channel_evaluate(curve3, percent3);
    var _start3 = yy;
    var _end3 = yy - 33;
    var _distance3 = _end3 - _start3;
    y = _start3 + (_distance3 * position3);
}

if (dialogue15timer == 30)
    instance_create_depth(x, y, depth - 4, oZ);

if (dialogue15timer > 30)
{
    image_speed = 0;
    image_index = 2;
}

if (dialogue15timer == 42)
    instance_create_depth(x, y, depth - 5, oShadowmanIdleWhite);

if (dialogue15timer == 43)
{
    instance_create_depth(x + 63, y - 57, depth - 6, oSpareStar);
    instance_create_depth(x + 23, y + 12, depth - 6, oSpareStar);
    instance_create_depth(x - 15, y - 55, depth - 6, oSpareStar);
    instance_create_depth(x - 30, y - 57, depth - 6, oSpareStar);
    instance_create_depth(x - 43, y + 33, depth - 6, oSpareStar);
}

if (dialogue15timer == 45)
{
    instance_create_depth(x + 42, y - 47, depth - 6, oSpareStar);
    instance_create_depth(x - 1, y - 53, depth - 6, oSpareStar);
    instance_create_depth(x - 4, y - 21, depth - 6, oSpareStar);
    instance_create_depth(x - 51, y - 47, depth - 6, oSpareStar);
    instance_create_depth(x - 63, y - 30, depth - 6, oSpareStar);
    instance_create_depth(x - 53, y + 12, depth - 6, oSpareStar);
    instance_create_depth(x + 19, y - 1, depth - 6, oSpareStar);
    instance_create_depth(x, y, depth - 5, oShadowmanIdleWhite2);
    instance_destroy();
}
