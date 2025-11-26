var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
x -= 8;
image_alpha -= 0.1;
timer++;

if (timer == 60)
    instance_destroy();
