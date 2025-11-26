if (sprite_index == spr_shadowwomantalk)
{
    if (!global.text_complete)
    {
        image_speed = 1;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
}
else
{
    image_speed = 0;
}
