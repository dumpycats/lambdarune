if (sprite_index == spr_spike)
{
    image_xscale = 1;
    image_yscale = 0.6;
}
else
{
    image_xscale = 1;
    image_yscale = 1;
}

if (pull == 2)
{
    var time = current_time / 1000;
    scaleoffset = 1.4 + (sin(time * 6) * 0.05);
    
    if (sprite_index == spr_spike)
    {
        image_xscale = 0.83;
        image_yscale = 0.49799999999999994;
    }
    else
    {
        image_xscale = 0.83;
        image_yscale = 0.83;
    }
    
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, purplecolor, image_alpha);
}
