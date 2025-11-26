gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, image_blend, 0.25 * multiplier);
y = 300;
gpu_set_blendmode(bm_normal);
