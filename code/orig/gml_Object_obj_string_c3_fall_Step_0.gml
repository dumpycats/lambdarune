timer += 1;
x = xx + (sin((timer / 80) * (2 * pi)) * 1 * randomxscale);

if (image_alpha < 0)
    instance_destroy();
