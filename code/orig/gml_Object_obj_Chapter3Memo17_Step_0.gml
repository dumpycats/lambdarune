if (!oSOULChapter3Select.memoleave && oSOULChapter3Select.memoview)
    image_alpha += 0.1;

if (image_alpha > 1)
    image_alpha = 1;

if (image_alpha < 0)
    image_alpha = 0;

if (global.c3epiloguecompleted)
    sprite_index = spr_Chapter3Memo17_complete;
else
    sprite_index = spr_Chapter3Memo17_incomplete;

if (instance_exists(oDepthsDim))
{
    if (oDepthsDim.image_alpha <= 0)
        x = 960;
}
