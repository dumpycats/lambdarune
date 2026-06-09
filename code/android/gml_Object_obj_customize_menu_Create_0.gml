android_game_set_speed(58);
audio_stop_all();
mus = audio_play_sound(hip_shop, 0, 1);
surf = -1;
surf1 = -1;
dir = 0;
menu_alpha = 0;
menu_yy = -10;
menu_state = 0;
menu_sel = 0;
menu_types = [translation_get_string("obj_customize_menu_Create_0_0"), translation_get_string("obj_customize_menu_Create_0_1"), translation_get_string("obj_customize_menu_Create_0_2"), "", translation_get_string("obj_customize_menu_Create_0_3")];
ui_elements = [];

for (var i = 0; i < array_length(menu_types); i++)
{
    ui_elements[i] = 
    {
        xx: 48,
        yy: 48 + (i * 24)
    };
    ui_elements[i].base_xx = ui_elements[i].xx;
    ui_elements[i].base_yy = ui_elements[i].yy;
}

surf_menu = -1;
state1_yy = 0;
state1_alpha = 0;
state1_index = 0;
reset_yes = 0;
mobile_brightness = ds_map_find_value(global.mobile_config, "brightness");
border_types = ["Dynamic", "Simple", "Sides", "Blurred", "None"];
var _saved_border = meow_border_get("Dynamic");
border_sel = 0;

for (var i = 0; i < array_length(border_types); i++)
{
    if (border_types[i] == _saved_border)
    {
        border_sel = i;
        break;
    }
}

anim = -4;

switch_anim = function(arg0, arg1, arg2, arg3) constructor
{
    _x = arg0;
    _y = arg1;
    spd = arg3;
    str = arg2;
    alpha = 1;
    
    function draw()
    {
        alpha -= 0.025;
        spd = lerpp(spd, 0, 0.05);
        _x += (spd / 2);
        draw_set_alpha(self.alpha);
        draw_text(self._x, self._y, self.str);
        draw_set_alpha(1);
        
        if (alpha < 0)
            obj_customize_menu.anim = undefined;
    }
};

blackalpha = 1;
back = 0;
_tap_z = false;
input_mode = 0;
brightness_drag = false;
brightness_drag_x = 0;
brightness_drag_val = 1;
menu_cooldown = 0;
prev_menu_state = 0;
