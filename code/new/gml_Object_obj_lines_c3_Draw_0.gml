var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (instance_exists(obj_phoneup))
    draw_rectangle_color(cx + -640, cy + 420, cx + 640, cy + 420, c_gray, c_gray, c_gray, c_gray, 0);

depth = obj_bulletboard_sof_end.depth + 2;
