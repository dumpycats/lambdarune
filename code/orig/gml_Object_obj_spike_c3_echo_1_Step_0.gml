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

if (image_alpha < 0 || !place_meeting(x, y, obj_bigspike_1))
    instance_destroy();
