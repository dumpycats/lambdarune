if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

image_alpha -= 0.1;
timer++;

if (image_alpha < 0)
    instance_destroy();
