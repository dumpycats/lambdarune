if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

timer++;
x = (sin((timer / 80) * (2 * pi)) * 20) + xx;
randomize();
randomxoffset = irandom_range(-70, 70);

if ((timer % 7) == 0)
{
    if (spawnblue)
        instance_create_depth(x + randomxoffset, y + 6, depth + 1, obj_rain_sio_hit);
    else
        instance_create_depth(x + randomxoffset, y + 6, depth + 1, obj_rain_sio);
}
