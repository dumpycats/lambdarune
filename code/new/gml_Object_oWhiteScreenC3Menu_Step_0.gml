timer++;

if (timer <= 30)
    image_alpha += 0.03334;

if (timer > 30)
    image_alpha -= 0.06666;

if (timer > 30 && image_alpha == 0)
    instance_destroy();

if (timer == 30)
    instance_create_depth(320, 70, -30, oChapter3MenuLogo1);
