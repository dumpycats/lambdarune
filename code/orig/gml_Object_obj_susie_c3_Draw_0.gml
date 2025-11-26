draw_self();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (room == rm_ch3_fountain)
{
    flashalpha = 1;
    draw_sprite_ext(sprite_index, image_index, x, y + 4, image_xscale, image_yscale, 0, c_black, image_alpha);
    
    if (!(sprite_index == sSusieShockedFront2))
        draw_sprite_ext(sprite_index, image_index, x, (y - 2) + (sprite_yoffset * 3), image_xscale, image_yscale * -3, 0, c_black, image_alpha);
    else
        draw_sprite_ext(sprite_index, image_index, x, (y - 8) + (sprite_yoffset * 3), image_xscale, image_yscale * -3, 0, c_black, image_alpha);
}
