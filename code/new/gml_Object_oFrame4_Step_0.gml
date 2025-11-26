timer += 1;

if (timer == 40)
{
    image_index = 1;
    image_xscale = 2.16;
    image_yscale = 2.16;
}

if (timer == 55)
{
    image_alpha = 0.75;
    image_index = 2;
    image_xscale = 2.35;
    image_yscale = 2.35;
}

if (timer == 70)
{
    image_alpha = 0.5;
    image_index = 3;
    image_xscale = 2.66;
    image_yscale = 2.66;
}

if (timer == 85)
{
    image_alpha = 0.25;
    image_index = 4;
    image_xscale = 3;
    image_yscale = 3;
}

if (timer == 100)
    instance_destroy();
