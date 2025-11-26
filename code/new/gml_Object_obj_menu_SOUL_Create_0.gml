var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
pos_x = cam_x + 289;

if (room == rm_ch3_spacechannel_2)
    pos_y = cam_y + 387;
else if (room == rm_ch3_cathodetower_aftermath)
    pos_y = cam_y + 391;
else
    pos_y = cam_y + 83;

options = 0;
subimg = 0;
choiceprompt = 0;
