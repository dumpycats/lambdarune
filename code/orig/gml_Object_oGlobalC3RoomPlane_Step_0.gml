var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
timer++;
percent1 += 0.006666666666666667;
var position1 = animcurve_channel_evaluate(curveease, percent1 - (1/3));
var delta_y = -490;
global.yoffset = round(490 + (delta_y * position1));
