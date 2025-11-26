var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (move)
{
    percent1 += 0.025;
    
    if (percent1 < 1)
    {
        var position1 = animcurve_channel_evaluate(curvelinear, percent1);
        var delta_y = (cy + 294) - (cy + 334);
        obj_kris_c3.y = cy + 334 + (delta_y * position1);
        obj_kris_c3.sprite_index = sKrisWalkUp;
        obj_kris_c3.image_speed = 0.625;
    }
    else if (percent1 == 1)
    {
        obj_kris_c3.y = cy + 294;
        obj_kris_c3.image_index = 0;
        obj_kris_c3.image_speed = 0;
    }
    else if (percent1 == 1.75)
    {
        dialogue = 9;
        reset_dialogue_normal();
        talking = true;
    }
}

if (interrupt)
{
    percent2 += 0.015151515151515152;
    
    if (percent2 == 1)
    {
        instance_create_depth(cx + 320, cy + 175, depth - 70, obj_fountainx);
        shock = true;
    }
}

if (shock)
{
    percent3 += 0.1;
    
    if (percent3 <= 1)
    {
        var position1 = animcurve_channel_evaluate(curvelinear, percent3);
        var delta_y = (cy + 334) - (cy + 294);
        obj_kris_c3.y = cy + 294 + (delta_y * position1);
        obj_kris_c3.sprite_index = sKrisWalkUp;
        obj_kris_c3.image_speed = 1;
    }
    
    if (percent3 <= 2)
    {
        var position2 = animcurve_channel_evaluate(curvevibrate, percent3 / 2);
        var delta_x = (cx + 246) - (cy + 242);
        obj_susie_c3.x = cx + 242 + (delta_x * position2);
        obj_susie_c3.sprite_index = sSusieShockedFront2;
    }
    
    if (percent3 == 1.1)
    {
        obj_kris_c3.image_index = 0;
        obj_kris_c3.image_speed = 0;
    }
}
