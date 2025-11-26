if (!oSOULChapter3Select.memoleave)
    image_alpha += 0.1;

if (image_alpha > 1)
    image_alpha = 1;

if (image_alpha < 0)
    image_alpha = 0;

if (!global.c3outskirtscompleted)
    sprite_index = sChapter3Memo2V3;
else if (global.c3kreidcompleted)
    sprite_index = sChapter3Memo2V1;
else
    sprite_index = sChapter3Memo2V2;
