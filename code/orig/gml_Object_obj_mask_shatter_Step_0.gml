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

if (!paused)
    y = yy + (sin((timer / 100) * (2 * pi)) * 4);

if (image_index >= 4)
    image_speed = 0;
