if (pull == 1)
{
    draw_self();
    
    if (slash >= 1)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle + 0, c_white, image_alpha);
    
    if (slash >= 2)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle + 72, c_white, image_alpha);
    
    if (slash >= 3)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle + 144, c_white, image_alpha);
    
    if (slash >= 4)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle + 216, c_white, image_alpha);
    
    if (slash >= 5)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle + 288, c_white, image_alpha);
    
    if (instance_exists(obj_battle_sof))
    {
        if (global.alldown)
        {
            image_speed = 0;
            speed = 0;
        }
        else
        {
            image_angle += round(3 * anglemultiplier);
        }
    }
}
