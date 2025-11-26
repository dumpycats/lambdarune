if (!surface_exists(surf))
    surf = surface_create(sprite_width, sprite_height);

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(spr_fountainmask, image_index, sprite_xoffset, pos_y, image_xscale, image_yscale, 0, image_blend, 1);
gpu_set_colorwriteenable(1, 1, 1, 0);
draw_sprite_ext(obj_fountaindepthsup_c3.sprite_index, 0, obj_fountaindepthsup_c3.x - 240, obj_fountaindepthsup_c3.y - 20, obj_fountaindepthsup_c3.image_xscale, obj_fountaindepthsup_c3.image_yscale, 0, image_blend, 0.5);
draw_sprite_ext(obj_fountaindepthsdown_c3.sprite_index, 0, obj_fountaindepthsdown_c3.x - 240, obj_fountaindepthsdown_c3.y - 20, obj_fountaindepthsdown_c3.image_xscale, obj_fountaindepthsdown_c3.image_yscale, 0, image_blend, 0.5);
gpu_set_colorwriteenable(1, 1, 1, 1);
surface_reset_target();
draw_surface(surf, x - sprite_xoffset, y - sprite_yoffset);
timer++;
xoffset = sin((timer * pi) / 50) * 12;
hue += 0.25;
hue %= 255;

if (hue >= 255)
    hue = 0;

image_blend = make_color_hsv(hue, 255, 255);
draw_sprite_ext(sprite_index, image_index, 320, pos_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, 320 + xoffset, pos_y, image_xscale, image_yscale, 0, image_blend, 0.5);
draw_sprite_ext(sprite_index, image_index, 320 - xoffset, pos_y, image_xscale, image_yscale, 0, image_blend, 0.5);
