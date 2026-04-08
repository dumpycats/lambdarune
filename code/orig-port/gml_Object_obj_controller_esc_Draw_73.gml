var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
x = xx;
y = yy;
var _touch_x = -1;
var _touch_y = -1;
var _touch_active = false;

if (esc_touch_id != -1)
{
    if (device_mouse_check_button(esc_touch_id, mb_left))
    {
        _touch_x = device_mouse_x(esc_touch_id);
        _touch_y = device_mouse_y(esc_touch_id);
        _touch_active = true;
    }
    else
    {
        esc_touch_id = -1;
    }
}

if (esc_touch_id == -1)
{
    for (var i = 0; i < 4; i++)
    {
        if (device_mouse_check_button(i, mb_left))
        {
            var _current_touch_x = device_mouse_x(i);
            var _current_touch_y = device_mouse_y(i);
            
            if (point_in_rectangle(_current_touch_x, _current_touch_y, cx + bbox_left, cy + bbox_top, cx + bbox_right, cy + bbox_bottom))
            {
                esc_touch_id = i;
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
    if (point_in_rectangle(_touch_x, _touch_y, cx + bbox_left, cy + bbox_top, cx + bbox_right, cy + bbox_bottom))
    {
        touchtimer++;
        releasetimer = -1;
        image_index = 1;
    }
    else
    {
        touchtimer = -1;
        releasetimer++;
        image_index = 0;
        image_alpha -= 0.05;
        image_alpha = clamp(image_alpha, 0, 3);
    }
}
else
{
    touchtimer = -1;
    releasetimer++;
    image_index = 0;
    image_alpha -= 0.05;
    image_alpha = clamp(image_alpha, 0, 3);
}

if (touchtimer == 0)
{
    keyboard_key_press(vk_escape);
    image_alpha = 1.5;
}
else if (releasetimer == 0)
{
    keyboard_key_release(vk_escape);
}
