if (checkonce)
{
    audio_group_load(AUDIO_DARKNESS);
    checkonce = false;
}

androidsavetimer++;

if (androidsavetimer == 1 && false)
{
    ini_open(working_directory + "/file0.ini");
    ini_write_real("PlayerData", "afterfirstopen", global.afterfirstopen);
    ini_write_real("PlayerData", "c3cutscenecompleted", global.c3cutscenecompleted);
    ini_write_real("PlayerData", "c3outskirtscompleted", global.c3outskirtscompleted);
    ini_write_real("PlayerData", "c3kreidcompleted", global.c3kreidcompleted);
    ini_write_real("PlayerData", "c3shadowshopcompleted", global.c3shadowshopcompleted);
    ini_write_real("PlayerData", "c3foanecompleted", global.c3foanecompleted);
    ini_write_real("PlayerData", "c3kreidfightcompleted", global.c3kreidfightcompleted);
    ini_write_real("PlayerData", "c3egg", global.c3egg);
    ini_write_real("PlayerData", "c3primcompleted", global.c3primcompleted);
    ini_write_real("PlayerData", "c3maximikecompleted", global.c3maximikecompleted);
    ini_write_real("PlayerData", "c3signalcompleted", global.c3signalcompleted);
    ini_write_real("PlayerData", "c3epiloguecompleted", global.c3epiloguecompleted);
    ini_write_real("PlayerData", "c3kreidnohit", global.c3kreidnohit);
    ini_write_real("PlayerData", "c3maximikenohit", global.c3maximikenohit);
    ini_write_real("PlayerData", "c3foanenohit", global.c3foanenohit);
    ini_close();
}

if (gamepad_is_connected(0))
{
    if (gamepad_button_check_pressed(0, gp_face2))
        keyboard_key_press(ord("Z"));
    else if (gamepad_button_check_released(0, gp_face2))
        keyboard_key_release(ord("Z"));
    
    if (gamepad_button_check_pressed(0, gp_face1))
        keyboard_key_press(ord("X"));
    else if (gamepad_button_check_released(0, gp_face1))
        keyboard_key_release(ord("X"));
    
    if (gamepad_button_check_pressed(0, gp_face4))
        keyboard_key_press(ord("C"));
    else if (gamepad_button_check_released(0, gp_face4))
        keyboard_key_release(ord("C"));
    
    var _deadzone = 0.5;
    var _h_axis = gamepad_axis_value(0, gp_axislh);
    var _v_axis = gamepad_axis_value(0, gp_axislv);
    var _left_down_now = keyboard_check(vk_left);
    
    if (_h_axis < -_deadzone)
    {
        if (!_left_down_now)
            keyboard_key_press(vk_left);
    }
    else if (_left_down_now)
    {
        keyboard_key_release(vk_left);
    }
    
    var _right_down_now = keyboard_check(vk_right);
    
    if (_h_axis > _deadzone)
    {
        if (!_right_down_now)
            keyboard_key_press(vk_right);
    }
    else if (_right_down_now)
    {
        keyboard_key_release(vk_right);
    }
    
    var _up_down_now = keyboard_check(vk_up);
    
    if (_v_axis < -_deadzone)
    {
        if (!_up_down_now)
            keyboard_key_press(vk_up);
    }
    else if (_up_down_now)
    {
        keyboard_key_release(vk_up);
    }
    
    var _down_down_now = keyboard_check(vk_down);
    
    if (_v_axis > _deadzone)
    {
        if (!_down_down_now)
            keyboard_key_press(vk_down);
    }
    else if (_down_down_now)
    {
        keyboard_key_release(vk_down);
    }
}
