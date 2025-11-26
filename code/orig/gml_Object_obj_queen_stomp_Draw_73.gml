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
}

timer++;

if (timer < 20)
{
    draw_sprite_ext(spr_queen_warning, timer / 1.5, x, cy + 260, 2, 2, 0, c_white, image_alpha);
}
else
{
    percent1++;
    
    if (percent1 <= 15)
    {
        var position = animcurve_channel_evaluate(curvefaster, percent1 / 15);
        y = lerp(global.topoffset + 119, 321, position);
    }
    else
    {
        percent2++;
        
        if (percent2 <= 15)
        {
            var position = animcurve_channel_evaluate(curvelinear, percent2 / 15);
            y = lerp(321, global.topoffset + 119, position);
        }
    }
}
