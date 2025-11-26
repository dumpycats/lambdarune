draw_self();
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, alpha);

if (brighten)
    alpha += 0.011111111111111112;
else
    alpha -= 0.02;

alpha = clamp(alpha, 0, 1);
