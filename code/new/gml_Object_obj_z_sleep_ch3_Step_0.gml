timer++;

if (timer >= 15)
    image_alpha -= 0.05;

if (image_alpha < 0)
    instance_destroy();

direction += 0.1;
