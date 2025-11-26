if (image_alpha > 1)
    image_alpha = 1;

image_index = oChapter3MenuLogo1.image_index;
timer++;

if (timer <= 15)
    image_alpha += 0.06667;

if (timer >= 55)
    image_alpha -= 0.1;
