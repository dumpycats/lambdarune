draw_self();

if (global.c3foanecompleted)
    draw_sprite_ext(sChapter3_Indicator, oSOULChapter3Select.column, 320, 240, 1, 1, 0, c_white, 1);
else
    draw_sprite_ext(sChapter3_Indicator, oSOULChapter3Select.column, 320, 240, 1, 1, 0, c_gray, 1);
