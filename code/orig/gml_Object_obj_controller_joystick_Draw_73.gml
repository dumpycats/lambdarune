var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!gamepad_is_connected(0) && false)
{
    if (!surface_exists(surf2))
        surf2 = surface_create(640, 480);
    
    surface_set_target(surf2);
    draw_clear_alpha(c_black, 0);
    draw_sprite_ext(spr_controller_joystick, 1, 110, 350, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_controller_joystick, 0, 110 + xoffset, 350 + yoffset, 2, 2, 0, c_white, 1);
    
    if (instance_exists(obj_controller_z))
        draw_sprite_ext(obj_controller_z.sprite_index, obj_controller_z.image_index, obj_controller_z.x, obj_controller_z.y, 2, 2, 0, c_white, 1);
    
    if (instance_exists(obj_controller_x))
        draw_sprite_ext(obj_controller_x.sprite_index, obj_controller_x.image_index, obj_controller_x.x, obj_controller_x.y, 2, 2, 0, c_white, 1);
    
    if (instance_exists(obj_controller_c))
        draw_sprite_ext(obj_controller_c.sprite_index, obj_controller_c.image_index, obj_controller_c.x, obj_controller_c.y, 2, 2, 0, c_white, 1);
    
    if (instance_exists(obj_controller_r))
        draw_sprite_ext(obj_controller_r.sprite_index, obj_controller_r.image_index, obj_controller_r.x, obj_controller_r.y, 2, 2, 0, c_white, obj_controller_r.image_alpha);
    
    if (instance_exists(obj_controller_n))
        draw_sprite_ext(obj_controller_n.sprite_index, obj_controller_n.image_index, obj_controller_n.x, obj_controller_n.y, 2, 2, 0, c_white, obj_controller_n.image_alpha);
    
    if (instance_exists(obj_controller_esc))
        draw_sprite_ext(obj_controller_esc.sprite_index, obj_controller_esc.image_index, obj_controller_esc.x, obj_controller_esc.y, 2, 2, 0, c_white, obj_controller_esc.image_alpha);
    
    surface_reset_target();
    x = cx + 110;
    y = cy + 330;
    var _radius = 72;
    var _center_x = cx + 110;
    var _center_y = cy + 330;
    var _deadzone = 0.5;
    var _touch_x = -1;
    var _touch_y = -1;
    var _touch_active = false;
    var _touch_id = -1;
    var _activation_radius;
    
    if (!activatedradius)
        _activation_radius = 200;
    else
        _activation_radius = 250;
    
    if (joystick_touch_id != -1)
    {
        if (device_mouse_check_button(joystick_touch_id, mb_left))
        {
            _touch_x = device_mouse_x(joystick_touch_id);
            _touch_y = device_mouse_y(joystick_touch_id);
            _touch_active = true;
        }
        else
        {
            joystick_touch_id = -1;
        }
    }
    
    if (joystick_touch_id == -1)
    {
        for (var i = 0; i < 4; i++)
        {
            if (device_mouse_check_button(i, mb_left))
            {
                var _current_touch_x = device_mouse_x(i);
                var _current_touch_y = device_mouse_y(i);
                var _dist_to_center = point_distance(_center_x, _center_y, _current_touch_x, _current_touch_y);
                
                if (_dist_to_center <= _activation_radius)
                {
                    joystick_touch_id = i;
                    _touch_x = _current_touch_x;
                    _touch_y = _current_touch_y;
                    _touch_active = true;
                    break;
                }
            }
        }
    }
    
    if (_touch_active)
    {
        activatedradius = true;
        var _dx = _touch_x - _center_x;
        var _dy = _touch_y - _center_y;
        var _dist = point_distance(_center_x, _center_y, _touch_x, _touch_y);
        var _angle = point_direction(_center_x, _center_y, _touch_x, _touch_y);
        
        if (_dist > _radius)
        {
            xoffset = lengthdir_x(_radius, _angle);
            yoffset = lengthdir_y(_radius, _angle);
        }
        else
        {
            xoffset = _dx;
            yoffset = _dy;
        }
        
        xinput = xoffset / _radius;
        yinput = yoffset / _radius;
    }
    else
    {
        activatedradius = false;
        var _spring_speed = 0.5;
        xoffset = lerp(xoffset, 0, _spring_speed);
        yoffset = lerp(yoffset, 0, _spring_speed);
        
        if (abs(xoffset) < 1)
            xoffset = 0;
        
        if (abs(yoffset) < 1)
            yoffset = 0;
        
        xinput = xoffset / _radius;
        yinput = yoffset / _radius;
    }
    
    var _left_down_now = keyboard_check(vk_left);
    
    if (xinput < -_deadzone)
    {
        if (!_left_down_now)
            keyboard_key_press(vk_left);
    }
    else if (_left_down_now)
    {
        keyboard_key_release(vk_left);
    }
    
    var _right_down_now = keyboard_check(vk_right);
    
    if (xinput > _deadzone)
    {
        if (!_right_down_now)
            keyboard_key_press(vk_right);
    }
    else if (_right_down_now)
    {
        keyboard_key_release(vk_right);
    }
    
    var _up_down_now = keyboard_check(vk_up);
    
    if (yinput < -_deadzone)
    {
        if (!_up_down_now)
            keyboard_key_press(vk_up);
    }
    else if (_up_down_now)
    {
        keyboard_key_release(vk_up);
    }
    
    var _down_down_now = keyboard_check(vk_down);
    
    if (yinput > _deadzone)
    {
        if (!_down_down_now)
            keyboard_key_press(vk_down);
    }
    else if (_down_down_now)
    {
        keyboard_key_release(vk_down);
    }
    
    draw_surface_ext(surf2, cx + 0, cy + 0, 1, 1, 0, c_white, 0.25);
}
