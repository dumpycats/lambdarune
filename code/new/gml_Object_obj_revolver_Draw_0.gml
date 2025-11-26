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

shoottimer++;

if (instance_exists(obj_SOUL_battle_sio))
{
    if (shoottimer >= waitvalue && (y <= obj_SOUL_battle_sio.y && y >= (obj_SOUL_battle_sio.y - 16)))
    {
        if (image_xscale == 2)
        {
            var a = instance_create_depth(x, y2, depth + 1, obj_revolver_bullet);
            a.direction = 180;
            a.image_xscale = image_xscale;
        }
        else
        {
            var a = instance_create_depth(x, y2, depth + 1, obj_revolver_bullet);
            a.direction = 0;
            a.image_xscale = image_xscale;
        }
        
        audio_play_sound(snd_bulletshot, 1, false);
        shoottimer = -1;
        image_index = 1;
    }
}

if (shoottimer == 3)
    image_index = 0;

timer += (1 * timermultiplier);
timerahead += (1 * timermultiplier);
y = round((sin((timer * pi) / 25) * 75) + (cy + 210));
y2 = round((sin((timerahead * pi) / 25) * 75) + (cy + 210));
