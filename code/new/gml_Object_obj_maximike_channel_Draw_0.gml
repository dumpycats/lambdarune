draw_sprite_ext(sprite_index, image_index, pos_x, obj_maximike_battle.y, image_xscale, image_yscale, 0, c_white, image_alpha);
timer++;
pos_x = obj_maximike_battle.x;

if (timer > 0)
    image_alpha -= (1/30);

if (timer == 35)
    instance_destroy();
