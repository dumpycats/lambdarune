var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
timer++;

if (timer <= 10)
{
    alpha += 0.1;
    alpha = clamp(alpha, 0, 1);
}

draw_set_alpha(alpha);
draw_rectangle_color(x + cx + 640, y, (x + cx) - 640, y, c_gray, c_gray, c_gray, c_gray, 0);
draw_set_alpha(1);

if (alpha <= -0.1)
    instance_destroy();
