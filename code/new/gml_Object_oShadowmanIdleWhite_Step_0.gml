var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (timer <= 3)
{
    image_alpha += 0.33333;
    
    if (image_alpha > 1)
        image_alpha = 1;
}

if (timer > 3)
{
    x -= 3.55555;
    image_alpha -= 0.05555;
}

if (timer == 60)
    instance_destroy();
