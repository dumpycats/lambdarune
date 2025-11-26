var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (global.alldown)
    instance_destroy();

draw_sprite_ext(sprite_index, image_index, cx + 320, y, image_xscale, image_yscale, 0, c_white, image_alpha);
timer++;

if (timer > 0)
{
    image_yscale -= 0.1;
    
    if (image_yscale < 0)
        instance_destroy();
    
    switch (timer)
    {
        case 1:
            camera_set_view_pos(view_camera[0], 20, 26);
            break;
        case 2:
            camera_set_view_pos(view_camera[0], 20, 14);
            break;
        case 3:
            camera_set_view_pos(view_camera[0], 20, 23);
            break;
        case 4:
            camera_set_view_pos(view_camera[0], 20, 17);
            break;
        case 5:
            camera_set_view_pos(view_camera[0], 20, 22);
            break;
        case 6:
            camera_set_view_pos(view_camera[0], 20, 18);
            break;
        case 7:
            camera_set_view_pos(view_camera[0], 20, 21);
            break;
        case 8:
            camera_set_view_pos(view_camera[0], 20, 19);
            break;
        case 9:
            camera_set_view_pos(view_camera[0], 20, 20);
            break;
    }
}

if (instance_exists(obj_bulletboard_sio))
{
    if (place_meeting(x, y, obj_SOUL_battle_sio) && image_alpha > 0.6 && !hit)
    {
        obj_SOUL_battle_sio.hurt = true;
        hit = true;
    }
}

if (hit)
{
    hittimer++;
    
    if (hittimer == 0)
        instance_destroy();
}

if (place_meeting(x, y, obj_SOUL_TP_sio) && !obj_SOUL_battle_sio.hurt && image_alpha > 0.6)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP_sio.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}
