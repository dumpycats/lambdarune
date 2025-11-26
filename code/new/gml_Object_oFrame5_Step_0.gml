timer += 1;

if (timer == 1)
    image_alpha = 0.25;

if (timer == 10)
    image_alpha = 0.5;

if (timer == 20)
    image_alpha = 0.75;

if (timer == 30)
    image_alpha = 1;

if (instance_exists(oFrame6))
{
    if (oFrame6.image_alpha == 1)
        instance_destroy();
}
