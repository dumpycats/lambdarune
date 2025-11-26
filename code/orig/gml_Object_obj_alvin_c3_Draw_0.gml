draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, blackalpha);

if (dialogue > 8)
    blackalpha -= 0.1;
else if (dialogue > 1)
    blackalpha -= 0.016666666666666666;

draw_self();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (!text_complete && !cloaktalk)
{
    image_speed = 1;
}
else
{
    image_speed = 0;
    image_index = 0;
}

timer++;

if (timer == 80)
    talking = true;
