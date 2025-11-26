hue += 0.25;
hue %= 255;

if (hue >= 255)
    hue = 0;

image_blend = make_color_hsv(hue, 255, 255);
timer += 1;
image_alpha = (sin((timer * pi) / 50) * 0.135) + 0.195;
draw_self();
