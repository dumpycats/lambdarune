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

var c_brown = 464420;
var c_darkgray = 2368548;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_darkgray, image_alpha);
