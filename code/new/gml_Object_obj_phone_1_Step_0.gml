if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        timer++;
    }
}

image_alpha = timer / 10;

if (!paused)
    image_angle = sin((timer / 20) * (2 * pi)) * 8;

image_xscale = 1;
image_yscale = 1;
