if (instance_exists(obj_battle_kf))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
}

if (x <= -120)
    instance_destroy();

var c_brown = 2897741;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale - 0.05, image_yscale - 0.05, 0, c_black, image_alpha);
