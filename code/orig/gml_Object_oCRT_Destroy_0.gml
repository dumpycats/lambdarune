var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
application_surface_draw_enable(true);
shader_reset();
GUIDrag = -4;
instance_create_depth(cx + 320, cy + 240, -6667, obj_CRT_static);
