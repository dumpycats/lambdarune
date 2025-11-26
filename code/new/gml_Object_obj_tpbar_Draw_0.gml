var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
percentin += 0.08333333333333333;
var position1 = animcurve_channel_evaluate(curveslower, percentin);
var delta_x = (cx + 36 + xoffset) - (cx - 35);
var pos_x = (cx - 35) + (delta_x * position1);
var pos_y = cy + 138;

if (global.tp >= 100)
    full = true;
else
    full = false;

if (room == rm_ch3_debug)
{
    var up = keyboard_check_pressed(vk_up);
    var down = keyboard_check_pressed(vk_down);
    var advance = keyboard_check_pressed(ord("Q"));
    var revert = keyboard_check_pressed(ord("W"));
    
    if (advance)
        global.tp += 16;
    
    if (up)
        global.tp += 2;
}

if (!global.enemyturn)
{
    if (global.tp != tp_target)
    {
        tp_start = tpvalue;
        tp_target = global.tp;
        tp_percent = 0;
    }
    
    if (tp_percent < 1)
    {
        tp_percent += 0.1;
        tp_percent = min(tp_percent, 1);
        var position = animcurve_channel_evaluate(curveslower, tp_percent);
        tpvalue = tp_start + ((tp_target - tp_start) * position);
    }
}
else
{
    tpvalue = global.tp;
}

draw_sprite_ext(spr_tpbar, full, pos_x, pos_y, 1, 1, 0, c_white, 1);

if (!full)
{
    if (!surface_exists(surf))
        surf = surface_create(sprite_width, sprite_height);
    
    surface_set_target(surf);
    draw_sprite(sprite_index, image_index, sprite_xoffset, sprite_yoffset);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    
    if (!global.enemyturn)
        draw_sprite(spr_tpbar, 4, sprite_xoffset, (sprite_yoffset + 189) - (189 * (global.tp / 100)));
    
    draw_sprite(spr_tpbar, 2, sprite_xoffset, (sprite_yoffset + 189) - (189 * (tpvalue / 100)));
    gpu_set_colorwriteenable(1, 1, 1, 1);
    surface_reset_target();
    draw_surface(surf, pos_x - sprite_xoffset, pos_y - sprite_yoffset);
}

draw_set_font(fDeterminationSans);
draw_set_halign(fa_left);

if (global.tp < 100)
{
    draw_text_with_tracking(pos_x - 28, pos_y - 24, string(global.tp), 16777215, 0, 0);
    draw_text_with_tracking(pos_x - 23, pos_y + 1, lang("obj_tpbar_Draw_0_0"), 16777215, 0, 0);
}

global.tp = clamp(global.tp, 0, 100);

if (leftout)
{
    xoffset -= 8;
    
    if (xoffset == -96)
        instance_destroy();
}
