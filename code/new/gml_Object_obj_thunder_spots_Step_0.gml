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

if (timer < 25)
    image_alpha += 0.02;

if (image_alpha == 0.5 && !active)
{
    active = true;
    image_alpha = 1;
}

if (active)
{
    activetimer++;
    
    if (activetimer == 0)
    {
        if (image_index == 0)
        {
            spawn = instance_create_depth(x - 47, y - 47, depth - 1, obj_thunder);
        }
        else if (image_index == 1)
        {
            spawn = instance_create_depth(x, y - 47, depth - 1, obj_thunder);
        }
        else if (image_index == 2)
        {
            spawn = instance_create_depth(x + 47, y - 47, depth - 1, obj_thunder);
            spawn.image_xscale = -1;
        }
        else if (image_index == 3)
        {
            spawn = instance_create_depth(x - 47, y, depth - 1, obj_thunder);
            spawn.image_index = 1;
        }
        else if (image_index == 4)
        {
            spawn = instance_create_depth(x, y, depth - 1, obj_thunder);
            spawn.image_index = 1;
        }
        else if (image_index == 5)
        {
            spawn = instance_create_depth(x + 47, y, depth - 1, obj_thunder);
            spawn.image_index = 1;
            spawn.image_xscale = -1;
        }
        else if (image_index == 6)
        {
            spawn = instance_create_depth(x - 47, y + 47, depth - 1, obj_thunder);
            spawn.image_index = 2;
        }
        else if (image_index == 7)
        {
            spawn = instance_create_depth(x, y + 47, depth - 1, obj_thunder);
            spawn.image_index = 2;
        }
        else if (image_index == 8)
        {
            spawn = instance_create_depth(x + 47, y + 47, depth - 1, obj_thunder);
            spawn.image_index = 2;
            spawn.image_xscale = -1;
        }
    }
    
    if (activetimer > 0)
    {
        spawn.image_alpha = image_alpha;
        image_alpha -= (1/15);
    }
    
    if (image_alpha <= 0)
    {
        instance_destroy(spawn);
        instance_destroy();
    }
}

if (instance_exists(obj_bulletboard_sio))
{
    if (place_meeting(x, y, obj_SOUL_battle_sio) && image_alpha > 0.3 && !hit && active)
    {
        obj_SOUL_battle_sio.hurt = true;
        hit = true;
    }
}

if (hit)
{
    hittimer++;
    
    if (hittimer == 1)
    {
        instance_destroy();
        instance_destroy(spawn);
    }
}

if (place_meeting(x, y, obj_SOUL_TP_sio) && !obj_SOUL_battle_sio.hurt && image_alpha > 0.3 && active)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP_sio.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}
