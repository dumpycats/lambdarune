if (room == rChapter3Menu)
    trigger = true;
else
    image_alpha = 0;

if (trigger)
{
    timer++;
    
    if (timer == 0)
        image_alpha = 1;
    
    if (timer > 105)
        image_alpha -= 0.03334;
    
    if (image_alpha < 0)
        instance_destroy(self);
}

x = 320;
y = 70;

if (instance_exists(oLambdaruneBlackLogo))
    depth = oLambdaruneBlackLogo.depth - 1;
