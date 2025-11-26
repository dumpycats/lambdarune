var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (pull == 1)
{
    if (!surface_exists(surf2))
        surf2 = surface_create(142 + global.rightoffset + (global.leftoffset * -1), 280);
    
    surface_resize(surf2, 142 + global.rightoffset + (global.leftoffset * -1), 280);
    surface_set_target(surf2);
    draw_clear_alpha(c_black, 0);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    draw_set_color(c_white);
    draw_rectangle(0, 0, 142, 280, false);
    gpu_set_colorwriteenable(1, 1, 1, 1);
    var surf_x = x - (cx + 249 + global.leftoffset);
    var surf_y = (y - sprite_height) + 6;
    draw_sprite_ext(sprite_index, image_index, surf_x, surf_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    surface_reset_target();
    draw_surface(surf2, cx + 249 + global.leftoffset, cy + 0);
}

if (image_index == 4)
{
    var mask_left = bbox_left;
    var mask_top = bbox_top;
    var mask_right = bbox_right;
    var mask_bottom = bbox_bottom;
    draw_set_alpha(0.5);
    draw_set_color(c_red);
    draw_rectangle(mask_left, mask_top, mask_right, mask_bottom, false);
    draw_set_alpha(1);
}
