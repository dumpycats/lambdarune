var pos_x = camera_get_view_x(view_camera[0]) + 320 + global.cxoffset;
var pos_y = camera_get_view_y(view_camera[0]) + 240 + global.cyoffset;
draw_sprite_ext(sprite_index, image_index, pos_x, pos_y, image_xscale, image_yscale, 0, c_white, image_alpha);
