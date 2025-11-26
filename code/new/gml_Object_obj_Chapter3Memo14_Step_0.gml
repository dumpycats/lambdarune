if (!oSOULChapter3Select.memoleave && oSOULChapter3Select.memoview)
    image_alpha += 0.1;

if (image_alpha > 1)
    image_alpha = 1;

if (image_alpha < 0)
    image_alpha = 0;

if (global.c3maximikecompleted)
{
    if (global.c3signalcompleted)
        sprite_index = spr_Chapter3Memo14_complete;
    else
        sprite_index = spr_Chapter3Memo14_part;
}
else
{
    sprite_index = spr_Chapter3Memo14_none;
}

if (instance_exists(oDepthsDim))
{
    if (oDepthsDim.image_alpha <= 0)
        x = 960;
}
