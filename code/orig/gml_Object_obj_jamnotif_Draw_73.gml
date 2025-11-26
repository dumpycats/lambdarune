timer++;

if (timer > 0)
    image_alpha -= 0.025;

depth = -5000;
draw_self();

if (image_alpha < 0)
    instance_destroy();
