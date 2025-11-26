var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (pull == 1)
{
    if (!surface_exists(surf2))
        surf2 = surface_create(142 + global.rightoffset + (global.leftoffset * -1), 142 + global.bottomoffset + (global.topoffset * -1));
    
    surface_resize(surf2, 142 + global.rightoffset + (global.leftoffset * -1), 142 + global.bottomoffset + (global.topoffset * -1));
    surface_set_target(surf2);
    draw_clear_alpha(c_black, 0);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    draw_set_color(c_white);
    draw_rectangle(0, 0, 142, 142, false);
    gpu_set_colorwriteenable(1, 1, 1, 1);
    var surf_x = x - (cx + 249 + global.leftoffset);
    var surf_y = y - (cy + 99 + global.topoffset);
    draw_sprite_ext(sprite_index, image_index, surf_x, surf_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    surface_reset_target();
    draw_surface(surf2, cx + 249 + global.leftoffset, cy + 99 + global.topoffset);
}
