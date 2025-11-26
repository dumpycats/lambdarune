timer += 1;

if (timer == 55)
    image_alpha = 0.25;

if (timer == 70)
    image_alpha = 0.5;

if (timer == 85)
    image_alpha = 0.75;

if (timer == 100)
    image_alpha = 1;

if (timer == 120)
{
    if (instance_exists(oFrame7))
        instance_destroy(oFrame7);
    
    instance_destroy();
}
