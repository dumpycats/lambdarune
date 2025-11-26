var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (room == rm_ch3_spacechannel_1)
    image_alpha = 1;
else
    image_alpha = 0;

if (!global.screen2dead)
{
    var time = current_time / 1000;
    y = yy + (sin(time * -0.39 * pi) * 4);
    image_angle = sin(time * -0.32 * pi) * 2;
}
