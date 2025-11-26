if (pull == 2)
{
    var time = current_time / 1000;
    scaleoffset = 1.4 + (sin(time * 6) * 0.05);
    image_xscale = 1.66;
    image_yscale = 0.83;
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, purplecolor, image_alpha);
}
