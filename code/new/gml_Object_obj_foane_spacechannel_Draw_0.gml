var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
var foane_x = x;
var foane_y = y;

if (blackout)
{
    depth = oKrisPlayerC3.depth - 1;
    draw_sprite_ext(sBlackScreen, 0, cam_x + 320, cam_y + 240, 2, 2, 0, c_black, blackalpha);
}
