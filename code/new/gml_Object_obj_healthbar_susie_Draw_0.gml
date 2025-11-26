var pos_x = camera_get_view_x(view_camera[0]) + 447 + global.cxoffset;
var pos_y = camera_get_view_y(view_camera[0]) + 445 + global.cyoffset;
draw_sprite_ext(sprite_index, image_index, pos_x, pos_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
image_xscale = global.susiehp / 190;
