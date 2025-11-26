if (!oSOULChapter3Select.memoleave && oSOULChapter3Select.memoview)
    image_alpha += 0.1;

if (image_alpha > 1)
    image_alpha = 1;

if (image_alpha < 0)
    image_alpha = 0;

if (global.c3kreidcompleted)
    sprite_index = sChapter3Memo3V1;
else
    sprite_index = sChapter3Memo3V2;

if (instance_exists(oDepthsDim))
{
    if (oDepthsDim.image_alpha <= 0)
        x = 960;
}
