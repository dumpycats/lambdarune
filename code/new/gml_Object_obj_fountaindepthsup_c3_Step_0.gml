var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
percent1 += 0.004166666666666667;
var position1 = animcurve_channel_evaluate(curvelinear, percent1);
var delta_x = endx - startx;
var delta_y = endy - starty;
x = startx + (delta_x * position1);
y = starty + (delta_y * position1);

if (percent1 == 1)
    percent1 = 0;

hue += 0.25;
hue %= 255;

if (hue >= 255)
    hue = 0;

image_blend = make_color_hsv(hue, 255, 255);
