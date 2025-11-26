var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!surface_exists(surf2))
    surf2 = surface_create(142, 142);

surface_set_target(surf2);
draw_clear_alpha(c_black, 0);
gpu_set_colorwriteenable(1, 1, 1, 0);
draw_set_color(c_white);
draw_rectangle(0, 0, 142, 142, false);
gpu_set_colorwriteenable(1, 1, 1, 1);
var surf_x = x - (cx + 249 + global.leftoffset);
var surf_y = y - (cy + 99 + global.topoffset);
draw_sprite_ext(sprite_index, image_index, surf_x, surf_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
surface_reset_target();
draw_surface(surf2, cx + 249 + global.leftoffset, cy + 99 + global.topoffset);

if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

percent1++;
timer++;
push = 2 + (timer / 30);
var position = animcurve_channel_evaluate(curvefaster, percent1 / 30);
speed = lerp(2 - (timer / 120), -push, position);

if (percent1 == 3)
    image_index = 0;

if (instance_exists(obj_bulletboard_sio))
{
    if (place_meeting(x, y, obj_SOUL_battle_sio) && image_alpha > 0.6 && !hit)
    {
        obj_SOUL_battle_sio.hurt = true;
        hit = true;
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_SOUL_TP_sio) && !obj_SOUL_battle_sio.hurt && image_alpha > 0.6)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP_sio.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}
