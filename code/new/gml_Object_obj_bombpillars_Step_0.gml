if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

if (instance_exists(obj_bulletboard_sio))
{
    if (place_meeting(x, y, obj_SOUL_battle_sio) && image_alpha > 0.6 && !hit)
    {
        obj_SOUL_battle_sio.hurt = true;
        hit = true;
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_SOUL_TP_sio) && !obj_SOUL_battle_sio.hurt && image_alpha > 0.6)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP_sio.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}

timer++;

if (timer == 250)
    instance_destroy();

if (timer == 0)
{
    switch (randomindex)
    {
        case 0:
            y += 30;
            break;
        case 1:
            y += 15;
            break;
        case 2:
            break;
        case 3:
            y -= 15;
            break;
        case 4:
            y -= 30;
            break;
    }
}
