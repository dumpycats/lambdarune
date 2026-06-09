if (keyboard_check_pressed(vk_f1))
    game_restart();

dir++;
var ui_scale = 2;

if (!surface_exists(surf))
    surf = surface_create(room_width, room_height);

if (!surface_exists(surf1))
    surf1 = surface_create(room_width, room_height);

if (!surface_exists(surf_menu))
    surf_menu = surface_create(room_width * ui_scale, room_height * ui_scale);

surface_copy(surf1, 0, 0, surf);
surface_set_target(surf);
var col = merge_color(c_red, c_black, 0.96);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
gpu_set_blendmode(bm_subtract);
draw_set_alpha(0.1);
draw_rectangle_color(0, 0, room_width, room_height, col, col, col, col, 0);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
gpu_set_texfilter(1);
draw_surface_ext(surf1, 0, -1, 0.996, 1, 0, c_white, 0.99);
gpu_set_texfilter(0);
image_speed = 0.1;
draw_sprite_ext(spr_titan_fountain_loop, image_index, 128, 0, 0.5, 0.5, 0, c_white, 0.7);
surface_reset_target();
draw_surface(surf, 0, 0);
draw_set_font(fnt_customize);
surface_set_target(surf_menu);
draw_clear_alpha(c_black, 0);
i = 0;

repeat (array_length(menu_types))
{
    var el = ui_elements[i];
    var col2 = merge_color(c_white, c_gray, 0.5 + lengthdir_x(0.5, (dir * 2) - (i * 40)));
    col1 = col2;
    
    if (i == menu_sel)
    {
        col1 = merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, (dir * 2) - (i * 40)));
        col2 = 65535;
        el.xx = lerp(el.xx, el.base_xx + 16, 0.1);
    }
    else
    {
        el.xx = lerp(el.xx, el.base_xx, 0.1);
    }
    
    var xx = ui_elements[i].xx;
    var yy = ui_elements[i].yy;
    draw_text_transformed_color(xx, yy, menu_types[i], 1, 1, 0, col1, col1, col2, col2, 1);
    i++;
}

col = merge_color(c_white, c_gray, 0.5 + lengthdir_x(0.25, (dir * 2) - 120));
var col1 = 16777215;

if (menu_state == 3 || (input_mode == 1 && menu_sel == 4))
    col = 65535;

if (instance_exists(anim))
{
    draw_set_color(merge_color(col, c_black, 0.5));
    anim.draw();
}

draw_set_color(col);
draw_set_halign(fa_left);
col = merge_color(c_white, c_gray, 0.5 + lengthdir_x(0.25, (dir * 2) - 40));

if (menu_state == 1)
    col = 65535;

var bright_x = mobile_brightness * 78;
draw_sprite_ext(Sprite3, 0, 220 * ui_scale, 37 * ui_scale, 10 * ui_scale, 1 * ui_scale, 0, col, 1);
draw_sprite_ext(Sprite4, 0, (bright_x * ui_scale) + (220 * ui_scale), 40 * ui_scale, 1 * ui_scale, 1 * ui_scale, 0, col, 1);
surface_reset_target();

if (keyboard_check_pressed(ord("Z")) || _tap_z)
{
    _tap_z = false;
    
    if (menu_types[menu_sel] == translation_get_string("obj_customize_menu_Step_0_0"))
    {
        back = 1;
    }
    else if (menu_state == 3)
    {
        menu_state = 0;
    }
    else if (menu_state == 2)
    {
        if (menu_sel == 2)
        {
            if (reset_yes)
            {
                file_delete("mobile_config.json");
                load_default_config();
                ds_map_copy(global.mobile_config, default_config);
                
                with (obj_mobilecontroller)
                {
                    create_step = 0;
                    _keys = ds_map_find_first(global.mobile_config);
                    instance_destroy(obj_mobile_buttons);
                    instance_destroy(obj_mobile_stick);
                }
            }
            
            reset_yes = 0;
            menu_state = 0;
            menu_sel = 2;
        }
    }
    else if (menu_state == 1)
    {
        var struc = json_encode(global.mobile_config);
        var buf = buffer_create(string_length(struc) + 1, buffer_fixed, 1);
        buffer_write(buf, buffer_string, struc);
        buffer_save(buf, "mobile_config.json");
        buffer_delete(buf);
        menu_state = 0;
    }
    else if (menu_state == 0)
    {
        if (menu_sel == 1)
        {
            menu_state = 1;
        }
        else if (menu_sel == 0 || menu_sel == 2)
        {
            surface_set_target(surf1);
            draw_clear(c_black);
            draw_surface_ext(surf_menu, 0, 0, 1 / ui_scale, 1 / ui_scale, 0, c_white, 1);
            surface_reset_target();
            
            if (menu_sel == 0)
                instance_create_depth(0, 0, 0, obj_customize_control);
            
            menu_state = 2;
        }
        else if (menu_sel == 4)
        {
            menu_state = 3;
        }
    }
}

if (menu_state != 2)
{
    menu_alpha = approach(menu_alpha, 1, 0.05);
    menu_yy = lerp(menu_yy, 0, 0.1);
    draw_surface_ext(surf_menu, 0, menu_yy, 1 / ui_scale, 1 / ui_scale, 0, c_white, menu_alpha);
}
else
{
    menu_yy = lerp(menu_yy, -10, 0.1);
    menu_alpha = 0;
}

if (menu_state == 2)
{
    state1_alpha = approach(state1_alpha, 1, 0.05);
    state1_yy = lerp(state1_yy, 8, 0.1);
    draw_set_alpha(0.25);
    surface_set_target(surf1);
    gpu_set_blendmode(bm_subtract);
    draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, 0);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    draw_set_alpha(state1_alpha / 3);
    draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, 0);
    draw_set_alpha(state1_alpha);
    
    if (menu_sel == 2)
    {
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_text_transformed(160, 84 + state1_yy,translation_get_string("obj_customize_menu_Step_0_1"), 0.5, 0.5, 0);
        var _col = 16777215;
        
        if (reset_yes)
            _col = 65535;
        
        draw_set_color(_col);
        draw_text_transformed(140, 104 + state1_yy, translation_get_string("obj_customize_menu_Step_0_2"), 0.5, 0.5, 0);
        _col = 16777215;
        
        if (!reset_yes)
            _col = 65535;
        
        draw_set_color(_col);
        draw_text_transformed(180, 104 + state1_yy, translation_get_string("obj_customize_menu_Step_0_3"), 0.5, 0.5, 0);
    }
    
    draw_set_alpha(1);
}
else
{
    state1_alpha = approach(state1_alpha, 0, 0.05);
}

gpu_set_blendmode(bm_subtract);
i = 0;

repeat (blackalpha * 12)
{
    draw_set_alpha(blackalpha);
    draw_rectangle(0, 0, room_width, i * 40, 0);
    i++;
}

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

if (back)
{
    blackalpha = lerp(blackalpha, 1.1, 0.03);
    audio_sound_gain(mus, abs(blackalpha - 0.8), 0);
    
    if (blackalpha > 0.9)
    {
        var struc = json_encode(global.mobile_config);
        var buf = buffer_create(string_length(struc) + 1, buffer_fixed, 1);
        buffer_write(buf, buffer_string, struc);
        buffer_save(buf, "mobile_config.json");
        buffer_delete(buf);
        audio_stop_all();
        room_goto(rChapterSelect);
    }
}
else
{
    blackalpha = lerp(blackalpha, 0, 0.05);
}

if (menu_state == 0 && !back)
{
    draw_set_color(c_white);
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_text_transformed(room_width - 10, room_height - 30, translation_get_string("obj_customize_menu_Step_0_4"), 0.5, 0.5, 0);
}