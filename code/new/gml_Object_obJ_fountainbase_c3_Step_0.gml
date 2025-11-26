hue += 0.25;
hue %= 255;

if (hue >= 255)
    hue = 0;

image_blend = make_color_hsv(hue, 255, 255);
