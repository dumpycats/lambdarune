var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_self();

if (d9trigger)
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, d9alpha);

draw_sprite_ext(spr_staticfull, d37timer / 2, cx + 0, cy + 0, 4, 4, 0, c_white, (d37timer - 30) / 90);
