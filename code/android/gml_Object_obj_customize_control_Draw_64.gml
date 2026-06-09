bg_anim_alpha = approach(bg_anim_alpha, 0.75, 0.05);
draw_set_color(c_black);
draw_set_alpha(bg_anim_alpha);
draw_rectangle(0, 0, 10000, 10000, 0);
draw_set_alpha(1);
draw_set_color(c_white);
var enable_brightness = true;
var enable_reset = true;
var doubletap = false;
var _delay = 0.3;

if (anim_scale > 0.8 && device_mouse_check_button_pressed(0, mb_any))
{
    var current = current_time / 1000;
    
    if (last_tap_time >= 0 && (current - last_tap_time) <= _delay)
    {
        doubletap = true;
        last_tap_time = -1;
    }
    else
    {
        last_tap_time = current;
    }
}

var prevh = display_get_gui_height();
var prevw = display_get_gui_width();
var _metrics = mobile_apply_gui_size();
var gui_offset_x = _metrics[2];
var gui_offset_y = _metrics[3];
var screen_cx = gui_offset_x + 170.75;
draw_set_color(c_white);
draw_set_font(fnt_customize);
var text_resize = translation_get_string("obj_customize_control_Draw_64_0");
var text_back = translation_get_string("obj_customize_control_Draw_64_1");
var text_reset = translation_get_string("obj_customize_control_Draw_64_2");
var text_opacity = translation_get_string("obj_customize_control_Draw_64_3");

if (enable_reset && timer_reset < 3)
    text_reset = translation_get_string("obj_customize_control_Draw_64_4") + string(max(1, ceil(timer_reset))) + "..";

if (potential_target == -1 && contextmenu == 0)
{
    if (doubletap)
    {
        var struc = json_encode(global.mobile_config);
        var buf = buffer_create(string_length(struc) + 1, buffer_fixed, 1);
        buffer_write(buf, buffer_string, struc);
        buffer_save(buf, "mobile_config.json");
        buffer_delete(buf);
        
        with (obj_mobilecontroller)
        {
            _keys = ds_map_find_first(global.mobile_config);
            create_step = 0;
        }
        
        with (obj_customize_menu)
            menu_state = 0;
        
        instance_destroy();
    }
    else
    {
        if (enable_brightness)
        {
            if (potential_target == -1)
            {
                var brightness = ds_map_find_value(global.mobile_config, "brightness");
                var mousex = device_mouse_x_to_gui(0);
                var mousey = device_mouse_y_to_gui(0);
                
                if (device_mouse_check_button(0, mb_any))
                {
                    if (brightness_firsty == -1)
                        brightness_firsty = mousey;
                    
                    var ydiff = brightness_firsty - mousey;
                    
                    if (anim_scale > 0.8 && abs(ydiff) > 5)
                        brightness_enabled = 1;
                    
                    if (brightness_enabled == 1)
                    {
                        newbrightness = (ydiff / 160) + brightness;
                        newbrightness = clamp(newbrightness, 0.05, 1);
                        draw_set_halign(fa_center);
                        draw_text_transformed(screen_cx, gui_offset_y + 64, string_hash_to_newline(translation_get_string("obj_customize_control_Draw_64_5") + string(newbrightness)), 0.5, 0.5, 0);
                    }
                }
                else
                {
                    ds_map_replace(global.mobile_config, "brightness", newbrightness);
                    brightness_enabled = 0;
                    brightness_firsty = -1;
                }
            }
        }
        
        if (enable_reset)
        {
            if (device_mouse_check_button(0, mb_any))
            {
                if (contextmenu == 0 && potential_target == -1 && !brightness_enabled)
                    timer_reset = max(0, timer_reset - (delta_time * 0.000001));
            }
            else if (timer_reset > 0)
            {
                timer_reset = 4;
            }
        }
        else
        {
            timer_reset = 4;
        }
    }
}

if (enable_reset)
{
    if (timer_reset <= 0)
    {
        file_delete("mobile_config.json");
        instance_create_depth(x, y, 0, obj_customize_control);
        instance_destroy();
        exit;
    }
}

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(anim_alpha);

if (brightness_enabled == 0)
{
    draw_set_alpha(anim_alpha * 0.6);
    
    if (enable_brightness)
    {
        draw_set_halign(fa_left);
        draw_text_transformed(gui_offset_x + 10, gui_offset_y + 10, string_hash_to_newline(text_opacity), 0.35, 0.35, 0);
    }
    
    if (enable_reset)
    {
        draw_set_halign(fa_right);
        draw_text_transformed((gui_offset_x + 341.5) - 10, gui_offset_y + 10, string_hash_to_newline(text_reset), 0.35, 0.35, 0);
    }
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
}

if (brightness_enabled == 0)
{
    draw_set_alpha(anim_alpha / 2);
    draw_text_transformed(screen_cx, (gui_offset_y + 192) - 26, string_hash_to_newline(text_back), 0.4, 0.4, 0);
    draw_text_transformed(screen_cx, (gui_offset_y + 192) - 36, string_hash_to_newline(text_resize), 0.4, 0.4, 0);
}

draw_set_alpha(1);

if (contextmenu == 1)
{
    if (contextmenu_target != -1)
    {
        anim_scale = lerp(anim_scale, 0.4, 0.05);
        anim_alpha = lerp(anim_alpha, 0, 0.4);
        menu_alpha = lerp(menu_alpha, 1, 0.15);
        menu_scale = lerp(menu_scale, 1, 0.3);
    }
    else
    {
        anim_scale = lerp(anim_scale, 1, 0.1);
        anim_alpha = lerp(anim_alpha, 1, 0.2);
        menu_alpha = lerp(menu_alpha, 0, 0.25);
        menu_scale = lerp(menu_scale, 0, 0.25);
        
        if (menu_alpha < 0.02)
            contextmenu = 0;
    }
}
else
{
    if (selected_name != "" && anim_scale > 0.99)
        selected_name = "";
    
    if (!start_anim && anim_scale < 0.4)
        anim_scale = 0.4;
    
    anim_scale = lerp(anim_scale, 1, 0.15);
    
    if (anim_scale < 0.4)
    {
        anim_alpha = 0;
    }
    else
    {
        anim_alpha += 0.1;
        anim_alpha = clamp(anim_alpha, 0, 1);
    }
}

var _phantom_t = clamp(anim_scale / 0.4, 0, 1);

if (_phantom_t < 1)
{
    var _phantom_alpha = (1 - _phantom_t) * newbrightness;
    var _phantom_scale = 1 - _phantom_t;
    var _p_key = ds_map_find_first(global.mobile_config);
    
    while (!is_undefined(_p_key))
    {
        if (_p_key == "brightness")
        {
            _p_key = ds_map_find_next(global.mobile_config, _p_key);
            continue;
        }
        
        var _pmap = ds_map_find_value(global.mobile_config, _p_key);
        
        if (!is_undefined(_pmap))
        {
            var _pspr_name = ds_map_find_value(_pmap, "sprite");
            var _pspr = asset_get_index(_pspr_name);
            
            if (sprite_exists(_pspr))
            {
                var _pxx = ds_map_find_value(_pmap, "xx");
                var _pyy = ds_map_find_value(_pmap, "yy");
                var _pxs = ds_map_find_value(_pmap, "xscale");
                var _pys = ds_map_find_value(_pmap, "yscale");
                var _pclamped = mobile_clamp_control_position(_pxx, _pyy, _pspr_name, _pxs, _pys);
                var _phantom_x = _pclamped[0] + gui_offset_x;
                var _phantom_y = _pclamped[1] + gui_offset_y;
                mobile_draw_sprite_centered(_pspr, 0, _phantom_x, _phantom_y, _pxs * _phantom_scale, _pys * _phantom_scale, 0, 16777215, _phantom_alpha);
            }
        }
        
        _p_key = ds_map_find_next(global.mobile_config, _p_key);
    }
}

for (var i = 0; i < array_length(mew_names); i++)
{
    if (mew_names[i] == "brightness")
        continue;
    
    me = ds_map_find_value(global.mobile_config, mew_names[i]);
    var _clamped = mobile_clamp_control_map(me);
    var xx = _clamped[0];
    var yy = _clamped[1];
    var xs = ds_map_find_value(me, "xscale");
    var ys = ds_map_find_value(me, "yscale");
    
    if (selected_name == mew_names[i])
    {
        xs = lerp(xs, btn_target_scale, 0.25);
        ys = lerp(ys, btn_target_scale, 0.25);
        ds_map_replace(me, "xscale", xs);
        ds_map_replace(me, "yscale", ys);
    }
    
    var _is_selected = selected_name == mew_names[i];
    var left_x = 0;
    var right_x = 341.5;
    var pos_t = clamp((xx - left_x) / (right_x - left_x), 0, 1);
    var delay_scale = pos_t * 0.6;
    var _editor_t = clamp((anim_scale - 0.4) / 0.6, 0, 1);
    var local_scale = clamp((_editor_t - delay_scale) / (1 - delay_scale), 0, 1);
    local_scale = local_scale * local_scale * (3 - (2 * local_scale));
    var alpha;
    
    if (_is_selected)
    {
        if (contextmenu_target != -1)
            selected_scale = lerp(selected_scale, 1.2, 0.25);
        else
            selected_scale = lerp(selected_scale, 1, 0.3);
        
        selected_alpha = lerp(selected_alpha, 1, 0.3);
        xs *= selected_scale;
        ys *= selected_scale;
        alpha = selected_alpha;
    }
    else
    {
        xs *= local_scale;
        ys *= local_scale;
        alpha = anim_alpha;
    }
    
    var spr = ds_map_find_value(me, "sprite");
    var spr_index = asset_get_index(spr);
    var _name_parts = string_split(mew_names[i], "_");
    var _is_stick = _name_parts[0] == "leftthumb";
    var _draw_x = gui_offset_x + xx;
    var _draw_y = gui_offset_y + yy;
    var _draw_xs = xs;
    var _draw_ys = ys;
    var _draw_alpha = newbrightness * alpha;
    
    if (_is_stick)
        mobile_draw_sprite_centered(spr_joybase, 0, _draw_x, _draw_y, _draw_xs, _draw_ys, 0, 16777215, _draw_alpha);
    
    mobile_draw_sprite_centered(spr_index, 0, _draw_x, _draw_y, _draw_xs, _draw_ys, 0, 16777215, _draw_alpha);
    var _control_bounds_spr = spr_index;
    
    if (_is_stick)
        _control_bounds_spr = spr_joybase;
    
    var _bounds = mobile_control_bounds_centered(_control_bounds_spr, gui_offset_x + xx, gui_offset_y + yy, xs, ys);
    var xx1 = _bounds[0];
    var yy1 = _bounds[1];
    var xx2 = _bounds[2];
    var yy2 = _bounds[3];
    var mousex = device_mouse_x_to_gui(0);
    var mousey = device_mouse_y_to_gui(0);
    var pointinside = point_in_rectangle(mousex, mousey, xx1, yy1, xx2, yy2);
    
    if (device_mouse_check_button(0, mb_any))
    {
        if (contextmenu == 0)
        {
            if (target == -1 && !brightness_enabled)
            {
                if (potential_target == -1)
                {
                    if (pointinside)
                    {
                        first_mousex = mousex;
                        first_mousey = mousey;
                        mousex_diff = 0;
                        mousey_diff = 0;
                        potential_target = mew_names[i];
                    }
                }
                else if (potential_target == mew_names[i])
                {
                    mousex_diff = abs(first_mousex - mousex);
                    mousey_diff = abs(first_mousey - mousey);
                    
                    if (mousex_diff > 3 || mousey_diff > 3)
                    {
                        if (ds_map_exists(global.mobile_config, potential_target))
                        {
                            var drag_map = ds_map_find_value(global.mobile_config, potential_target);
                            
                            if (!is_undefined(drag_map))
                            {
                                target = potential_target;
                                drag_offset_x = mousex - (gui_offset_x + ds_map_find_value(drag_map, "xx"));
                                drag_offset_y = mousey - (gui_offset_y + ds_map_find_value(drag_map, "yy"));
                            }
                        }
                    }
                }
            }
            else if (target == mew_names[i])
            {
                if (ds_map_exists(global.mobile_config, target))
                {
                    var submap = ds_map_find_value(global.mobile_config, target);
                    
                    if (!is_undefined(submap))
                    {
                        var _drag_clamped = mobile_clamp_control_position(mousex - gui_offset_x - drag_offset_x, mousey - gui_offset_y - drag_offset_y, ds_map_find_value(submap, "sprite"), ds_map_find_value(submap, "xscale"), ds_map_find_value(submap, "yscale"));
                        ds_map_replace(submap, "xx", _drag_clamped[0]);
                        ds_map_replace(submap, "yy", _drag_clamped[1]);
                    }
                }
            }
        }
    }
    else if (anim_scale > 0.9 && device_mouse_check_button_released(0, mb_any))
    {
        if (potential_target == mew_names[i])
        {
            if (target == -1)
            {
                contextmenu_xx = gui_offset_x + xx;
                contextmenu_yy = gui_offset_y + yy;
                contextmenu = 1;
                contextmenu_target = potential_target;
                selected_name = potential_target;
                btn_target_scale = ds_map_find_value(me, "xscale");
                var _pos_t = clamp((xx - 0) / 341.5, 0, 1);
                var _delay_scale = _pos_t * 0.6;
                _editor_t = clamp((anim_scale - 0.4) / 0.6, 0, 1);
                selected_scale = clamp((_editor_t - _delay_scale) / (1 - _delay_scale), 0, 1);
                selected_scale = selected_scale * selected_scale * (3 - (2 * selected_scale));
                selected_alpha = anim_alpha;
            }
            
            mousex_diff = -1;
            mousey_diff = -1;
            potential_target = -1;
            target = -1;
            first_mousex = -1;
            first_mousey = -1;
            drag_offset_x = 0;
            drag_offset_y = 0;
        }
        else if (target == mew_names[i])
        {
            mousex_diff = -1;
            mousey_diff = -1;
            potential_target = -1;
            target = -1;
            first_mousex = -1;
            first_mousey = -1;
            drag_offset_x = 0;
            drag_offset_y = 0;
        }
    }
    else
    {
        potential_target = -1;
        
        if (timer_reset > 0)
            timer_reset = 4;
        
        target = -1;
        mousex_diff = -1;
        mousey_diff = -1;
        first_mousex = -1;
        first_mousey = -1;
        drag_offset_x = 0;
        drag_offset_y = 0;
    }
}

if (contextmenu == 1 && contextmenu_target != -1 && ds_map_exists(global.mobile_config, contextmenu_target))
{
    var _menu_map = ds_map_find_value(global.mobile_config, contextmenu_target);
    var _menu_xx = ds_map_find_value(_menu_map, "xx");
    var _menu_yy = ds_map_find_value(_menu_map, "yy");
    var _can_delete = is_duplicate(contextmenu_target);
    var _menu_w = 100;
    var _line_h = 22;
    var _menu_h = _line_h * (3 + (_can_delete ? 1 : 0));
    var _btn_x = gui_offset_x + _menu_xx;
    var _btn_y = gui_offset_y + _menu_yy;
    var _btn_xs = ds_map_find_value(_menu_map, "xscale") * selected_scale;
    var _target_mx = _btn_x + (20 * _btn_xs) + 10;
    var _target_my = _btn_y - (_menu_h / 2);
    
    if ((_target_mx + _menu_w) > ((gui_offset_x + 341.5) - 4))
        _target_mx = _btn_x - _menu_w - (20 * _btn_xs) - 10;
    
    if (_target_my < (gui_offset_y + 4))
        _target_my = gui_offset_y + 4;
    
    if ((_target_my + _menu_h) > ((gui_offset_y + 192) - 4))
        _target_my = (gui_offset_y + 192) - 4 - _menu_h;
    
    var _mx = lerp(_btn_x, _target_mx, menu_scale);
    var _my = lerp(_btn_y, _target_my, menu_scale);
    var _draw_w = _menu_w * menu_scale;
    var _draw_h = _menu_h * menu_scale;
    draw_set_alpha(0.75 * menu_alpha);
    draw_set_color(#282828);
    draw_roundrect_ext(_mx, _my, _mx + _draw_w, _my + _draw_h, 10, 10, false);
    draw_set_alpha(menu_alpha);
    draw_set_color(#3C3C3C);
    draw_line_width(_mx + 8, _my + _line_h, (_mx + _draw_w) - 8, _my + _line_h, 1);
    draw_line_width(_mx + 8, _my + (_line_h * 2), (_mx + _draw_w) - 8, _my + (_line_h * 2), 1);
    
    if (_can_delete)
        draw_line_width(_mx + 8, _my + (_line_h * 3), (_mx + _draw_w) - 8, _my + (_line_h * 3), 1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_customize);
    var _txt_scale = 0.3;
    draw_set_color(c_white);
    draw_text_transformed(_mx + (_draw_w / 2), _my + (_line_h * 0.5), translation_get_string("obj_customize_control_Draw_64_6"), _txt_scale, _txt_scale, 0);
    draw_set_color(c_white);
    var _cur_scale = ds_map_find_value(_menu_map, "xscale");
    draw_text_transformed(_mx + (_draw_w / 2), _my + (_line_h * 1.5), translation_get_string("obj_customize_control_Draw_64_7") + string_format(_cur_scale, 1, 1), _txt_scale, _txt_scale, 0);
    var _size_cx = _mx + (_draw_w / 2);
    var _size_cy = _my + (_line_h * 1.5);
    draw_sprite_ext(spr_mobile_min, btn_minus_pressed ? 1 : 0, _size_cx - 36, _size_cy, menu_scale, menu_scale, 0, c_white, menu_alpha);
    draw_sprite_ext(spr_mobile_add, btn_plus_pressed ? 1 : 0, _size_cx + 36, _size_cy, menu_scale, menu_scale, 0, c_white, menu_alpha);
    
    if (_can_delete)
    {
        draw_set_color(#FF4646);
        draw_text_transformed(_mx + (_draw_w / 2), _my + (_line_h * 2.5), translation_get_string("obj_customize_control_Draw_64_8"), _txt_scale, _txt_scale, 0);
    }
    
    draw_set_color(#B4B4B4);
    var _cancel_row = _can_delete ? 3.5 : 2.5;
    draw_text_transformed(_mx + (_draw_w / 2), _my + (_line_h * _cancel_row), translation_get_string("obj_customize_control_Draw_64_9"), _txt_scale, _txt_scale, 0);
    draw_set_alpha(1);
    draw_set_color(c_white);
    btn_minus_pressed = false;
    btn_plus_pressed = false;
    
    if (device_mouse_check_button(0, mb_any))
    {
        var _hold_mx = device_mouse_x_to_gui(0);
        var _hold_my = device_mouse_y_to_gui(0);
        var _hold_cx = _mx + (_draw_w / 2);
        var _hold_cy = _my + (_line_h * 1.5);
        
        if (point_in_rectangle(_hold_mx, _hold_my, _hold_cx - 46, _hold_cy - 10, _hold_cx - 26, _hold_cy + 10))
            btn_minus_pressed = true;
        else if (point_in_rectangle(_hold_mx, _hold_my, _hold_cx + 26, _hold_cy - 10, _hold_cx + 46, _hold_cy + 10))
            btn_plus_pressed = true;
    }
    
    if (device_mouse_check_button_pressed(0, mb_any))
    {
        var _mousex = device_mouse_x_to_gui(0);
        var _mousey = device_mouse_y_to_gui(0);
        
        if (point_in_rectangle(_mousex, _mousey, _mx, _my, _mx + _menu_w, _my + _menu_h))
        {
            var _row = floor((_mousey - _my) / _line_h);
            
            if (_row == 1)
            {
                _size_cx = _mx + (_menu_w / 2);
                _size_cy = _my + (_line_h * 1.5);
                
                if (point_in_rectangle(_mousex, _mousey, _size_cx - 46, _size_cy - 10, _size_cx - 26, _size_cy + 10))
                    btn_target_scale = max(0.3, btn_target_scale - 0.1);
                else if (point_in_rectangle(_mousex, _mousey, _size_cx + 26, _size_cy - 10, _size_cx + 46, _size_cy + 10))
                    btn_target_scale = min(2, btn_target_scale + 0.1);
            }
            else if (_row == 0)
            {
                var _dup = mobile_duplicate_control(contextmenu_target);
                
                if (_dup != -1)
                    contextmenu_target = -1;
            }
            else if (_can_delete && _row == 2)
            {
                if (mobile_delete_button(contextmenu_target))
                {
                    contextmenu_target = -1;
                    potential_target = -1;
                    target = -1;
                    drag_offset_x = 0;
                    drag_offset_y = 0;
                }
            }
            else if (_row == (_can_delete ? 3 : 2))
            {
                contextmenu_target = -1;
            }
        }
        else
        {
            contextmenu_target = -1;
        }
    }
}

display_set_gui_size(prevw, prevh);
