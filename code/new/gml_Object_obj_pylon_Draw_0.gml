var flashalpha = 0;
var flashcolor = 8421504;

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y + 2, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    draw_sprite_ext(sprite_index, image_index, x, y - 2, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    draw_sprite_ext(sprite_index, image_index, x - 2, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    draw_sprite_ext(sprite_index, image_index, x + 2, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

draw_self();

if (image_alpha < 1)
{
    if (kristrigger)
    {
        if (place_meeting(x, y, obj_kris_sof))
            image_alpha += 0.1;
    }
    
    if (susietrigger)
    {
        if (place_meeting(x, y, obj_susie_sof))
            image_alpha += 0.1;
    }
    
    if (ralseitrigger)
    {
        if (place_meeting(x, y, obj_ralsei_sof))
            image_alpha += 0.1;
    }
    
    if (foanetrigger)
    {
        if (place_meeting(x, y, obj_foane_ex_battle))
            image_alpha += 0.1;
    }
}
