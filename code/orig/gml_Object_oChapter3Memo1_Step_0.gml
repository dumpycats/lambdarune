if (!oSOULChapter3Select.memoleave)
    image_alpha += 0.1;

if (image_alpha > 1)
    image_alpha = 1;

if (image_alpha < 0)
    image_alpha = 0;

if (global.c3outskirtscompleted)
    sprite_index = sChapter3Memo1V1;
else
    sprite_index = sChapter3Memo1V2;
