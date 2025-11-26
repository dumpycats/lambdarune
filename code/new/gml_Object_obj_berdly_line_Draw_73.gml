var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!surface_exists(surf2))
    surf2 = surface_create(640, height);

surface_resize(surf2, 640, height);

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        percent1++;
    }
}

if (percent1 <= 30)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 30);
    height = lerp(1, 480, position);
}

if (percent1 >= 30 && (percent1 % 2) == 0 && image_alpha >= 1)
{
    var b1 = instance_create_depth(x, cy + 0, depth + 1, obj_berdly_arrow);
    b1.pull = 2;
    b1.frequency = frequency;
    b1.amplitude = amplitude;
}

if (percent1 >= 82)
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}

surface_set_target(surf2);
draw_clear_alpha(c_black, 0);
gpu_set_colorwriteenable(1, 1, 1, 0);
draw_set_color(c_white);
draw_rectangle(cx + 0, cy + 0, cx + 640, height, false);
gpu_set_colorwriteenable(1, 1, 1, 1);
var surf_x = cx + 0;
var surf_y = cy + 0;
y1 = 0;
x1 = x + (sin(y1 * frequency) * amplitude);
draw_set_alpha(image_alpha);

for (var i = 1; i <= 500; i++)
{
    y2 = i;
    x2 = x + (sin(y2 * frequency) * amplitude);
    draw_line_color(x1, cy + y1, x2, cy + y2, c_red, c_red);
    y1 = y2;
    x1 = x2;
}

draw_set_alpha(1);
surface_reset_target();
draw_surface(surf2, 0, 0);
