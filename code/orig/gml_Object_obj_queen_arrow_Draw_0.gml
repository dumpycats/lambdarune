var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (pull == 1)
{
    var time = current_time / 1000;
    
    if (!surface_exists(surf2))
        surf2 = surface_create(142 + global.rightoffset + (global.leftoffset * -1), 142 + global.bottomoffset + (global.topoffset * -1));
    
    surface_resize(surf2, 142 + global.rightoffset + (global.leftoffset * -1), 142 + global.bottomoffset + (global.topoffset * -1));
    surface_set_target(surf2);
    draw_clear_alpha(c_black, 0);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    draw_set_color(c_white);
    draw_rectangle(0, 0, 142, 142, false);
    gpu_set_colorwriteenable(1, 1, 1, 1);
    var surf_x = x - (cx + 249 + global.leftoffset);
    var surf_y = y - (cy + 99 + global.topoffset);
    draw_sprite_ext(sprite_index, image_index, surf_x, surf_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    surface_reset_target();
    draw_surface(surf2, cx + 249 + global.leftoffset, cy + 99 + global.topoffset);
    draw_sprite_ext(spr_queen_screen, 0, xx, yy, boxxscale * 2, boxyscale * 2, 0, c_white, 1);
    
    if (percent1 >= 15 && percent1 <= 30)
        draw_sprite_ext(spr_queen_ray, 1, x, y, 20, 1, image_angle, c_red, 0.25);
    
    draw_self();
}

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        timer++;
    }
}

angleoffset = point_direction(x, y, SOUL.x, SOUL.y);

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
    else
    {
        percent1++;
    }
}

if (percent1 <= 15)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 15);
    image_angle = lerp(720, angleoffset, position);
    image_xscale = lerp(0.1, 1.25, position);
    image_yscale = lerp(0.1, 1.25, position);
    direction = angleoffset;
}

if (percent1 >= 31)
{
    if (percent1 == 31)
    {
        var ray1 = instance_create_depth(x, y, depth - 20, obj_queen_ray);
        ray1.image_angle = image_angle;
        ray1.direction = direction;
    }
    
    speed -= 0.5;
    image_alpha -= (1/15);
    
    if (image_alpha < 0)
        instance_destroy();
    
    if (image_alpha < 0.25)
    {
        boxyscale -= 0.25;
        boxyscale = clamp(boxyscale, 0.16666666666666666, 2);
        boxxscale += 0.25;
        boxxscale = clamp(boxyscale, 1, 2);
    }
}

if (percent1 <= 4)
{
    var position1 = animcurve_channel_evaluate(curvefaster, percent1 / 4);
    boxxscale = lerp(1.5, 0.5, position1);
    boxyscale = lerp(0, 2, position1);
}
else
{
    percent2++;
    
    if (percent2 <= 4)
    {
        var position2 = animcurve_channel_evaluate(curveslower, percent2 / 4);
        boxxscale = lerp(0.5, 1, position2);
        boxyscale = lerp(2, 1, position2);
    }
}
