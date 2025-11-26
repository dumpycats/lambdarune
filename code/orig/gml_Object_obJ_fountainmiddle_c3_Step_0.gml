var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
percent1 += 0.008771929824561403;
var position1 = animcurve_channel_evaluate(curvelinear, percent1);
var delta_y = (cy + 0) - (cy + 280);
pos_y = cy + 280 + (delta_y * position1);

if (percent1 == 1)
    percent1 = 0;
