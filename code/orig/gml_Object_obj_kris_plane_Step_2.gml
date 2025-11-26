var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
depth = -y - 3;

if (!obj_kreid_plane.begone)
{
    y = yy + global.yoffset;
}
else if (obj_kreid_plane.begone)
{
}

if (obj_plane_text.dialogue == 19 || obj_plane_text.dialogue == 20)
{
    percent1 += 0.05;
    var position1 = animcurve_channel_evaluate(curvelinear, percent1);
    
    if (percent1 < 2)
    {
        var delta_y = (cy + 330) - (cy + 408);
        y = cy + 408 + (delta_y * position1);
    }
    
    if (percent1 == 0)
    {
        image_speed = 1;
    }
    else if (percent1 == 1.05)
    {
        image_speed = 0;
        image_index = 0;
    }
}

if (walkup2)
{
    percent2 += 0.1;
    var position1 = animcurve_channel_evaluate(curvelinear, percent2);
    
    if (percent2 < 2)
    {
        var delta_y = (cy + 280) - (cy + 330);
        y = cy + 330 + (delta_y * position1);
    }
    
    if (percent2 == 0)
    {
        sprite_index = sKrisWalkUp;
        image_speed = 1.5;
    }
    else if (percent2 == 1.1)
    {
        sprite_index = sKrisWalkLeft;
        image_speed = 0;
        image_index = 0;
    }
}

if (flyup)
{
    percent3 += 0.05;
    
    if (percent3 == 0.05)
        instance_create_depth(obj_ch3_plane_interior.x, obj_ch3_plane_interior.y, -1000, obj_ch3_plane_exterior);
    
    image_speed = 1;
    sprite_index = spr_krisroll;
    var position1 = animcurve_channel_evaluate(curveslower, percent3);
    var delta_y = cy - 60 - (cy + 280);
    y = cy + 280 + (delta_y * position1);
}

if (y < (cy + 70))
{
    endtimer++;
    
    if (endtimer == 0)
    {
        audio_play_sound(snd_scytheburst_bc, 1, false);
        audio_play_sound(snd_glassbreak, 1, false, 1.5);
        obj_ch3_plane_exterior.image_index = 1;
        instance_create_depth(obj_ch3_plane_exterior.x, obj_ch3_plane_exterior.y, depth + 15, obj_ch3_plane_overlay);
    }
    
    switch (endtimer)
    {
        case 1:
            camera_set_view_pos(view_camera[0], 0, -6);
            break;
        case 2:
            camera_set_view_pos(view_camera[0], 0, 6);
            break;
        case 3:
            camera_set_view_pos(view_camera[0], 0, -3);
            break;
        case 4:
            camera_set_view_pos(view_camera[0], 0, 3);
            break;
        case 5:
            camera_set_view_pos(view_camera[0], 0, -1);
            break;
        case 6:
            camera_set_view_pos(view_camera[0], 0, 1);
            break;
        case 7:
            camera_set_view_pos(view_camera[0], 0, 0);
            break;
        default:
            break;
    }
    
    if (endtimer == 30)
    {
        instance_destroy(obj_ch3_plane_exterior);
        instance_create_depth(320, 240, -1000, obj_blackscreen_stagnant);
    }
    
    if (endtimer == 60)
        room_goto(rm_ch3_kreidfight);
}
