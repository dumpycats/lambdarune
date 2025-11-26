if (!(sprite_index == spr_foane_ex_idle))
{
    generaltimer++;
    
    if ((sprite_index == spr_foane_ex_end || sprite_index == spr_foane_ex_end_1) && !off)
    {
        draw_sprite_ext(spr_foane_ex_sonic_effect, image_index_save + subimg, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha - alphaoffset);
        subimg += (0.16666666666666666 * image_speed);
        
        if ((generaltimer % 2) == 0)
            alphaoffset = random_range(0.2, 0.7);
    }
    else if (sprite_index == spr_foane_ex_laugh_3)
    {
        draw_sprite_ext(spr_foane_ex_cape, image_index_save + subimg, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_foane_ex_sonic_effect, image_index_save + subimg, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        subimg += ((1/3) * image_speed);
    }
}
else
{
    image_index_save = image_index;
    subimg = 0;
}

draw_self();

if (off && percent1 <= 100 && x == 492)
{
    var s1 = instance_create_depth(x, y, depth, obj_foane_sof_end_echo);
    s1.image_xscale = image_xscale;
    s1.image_yscale = image_yscale;
    s1.image_blend = image_blend;
    s1.image_angle = image_angle;
    s1.image_index = image_index;
    s1.image_alpha = image_alpha / 1.5;
}
