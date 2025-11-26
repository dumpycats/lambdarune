draw_sprite_ext(sprite_index, image_index, x - 2, y, image_xscale, image_yscale, 0, c_black, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + 2, y, image_xscale, image_yscale, 0, c_black, image_alpha);
draw_self();

if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}
