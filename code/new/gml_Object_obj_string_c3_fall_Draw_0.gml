draw_self();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (flashtrigger)
{
    flashpercent++;
    
    if (flashpercent <= 8)
        flashalpha += 0.125;
    else
        flashalpha -= 0.125;
    
    if (flashalpha == 1)
    {
        audio_play_sound(mus_sfx_eyeflash, 1, false, 0.2);
        sprite_index = spr_string_purple_start;
        image_speed = randomspeed;
    }
    
    flashalpha = clamp(flashalpha, 0, 1);
}
