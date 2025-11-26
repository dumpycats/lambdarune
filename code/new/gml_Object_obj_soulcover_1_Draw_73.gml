draw_sprite_ext(sprite_index, image_index, x, y, 1 + (timer / 5), 1 + (timer / 5), 0, targetflash, 1 - (timer / 20));
draw_sprite_ext(sprite_index, image_index, x, y, 1 + (timer / 10), 1 + (timer / 10), 0, targetflash, 1 - (timer / 10));
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, targetflash, 1);
image_blend = targetflash;
shader_set(shFlash);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
shader_reset();
timer++;

if (timer == 0)
    flashalpha = 0.3;

if (timer == 1)
    flashalpha = 0.5;

if (timer == 2)
    flashalpha = 0.75;

if (timer == 3)
    flashalpha = 0.9;

if (timer == 4)
{
    flashalpha = 1;
    
    if (instance_exists(obj_SOUL_sof_prebattle))
        obj_SOUL_sof_prebattle.purple = true;
}

if (timer == 5)
    flashalpha = 0.75;

if (timer == 6)
    flashalpha = 0.5;

if (timer == 7)
    flashalpha = 0.25;

if (timer == 8)
    flashalpha = 0;
