if (timer <= 30)
{
    if (instance_exists(obj_SOUL_battle))
        depth = obj_SOUL_battle.depth - 1;
    
    if (sprite_index == spr_kreidcircle)
        draw_sprite_ext(sprite_index, image_index, x, y, (image_xscale * 10) / 9, (image_yscale * 10) / 9, image_angle, c_white, image_alpha);
    else
        draw_self();
}
else
{
    if (instance_exists(obj_SOUL_battle))
        depth = obj_SOUL_battle.depth + 1;
    
    draw_self();
}
