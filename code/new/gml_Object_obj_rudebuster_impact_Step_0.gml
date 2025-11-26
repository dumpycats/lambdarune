timer++;

if (timer == 0)
{
    if (instance_exists(oGlobalC3RoomMikeFight))
    {
        if (!instance_exists(obj_bulletboard_sio))
        {
        }
        else if (obj_battle_sio.jammed)
        {
            if (instance_exists(obj_generator1_sio))
            {
                if (obj_generator1_sio.image_index < 2)
                {
                    global.generator1hp -= 14;
                    
                    if (!obj_battle_sio.susiejaminterrupt)
                        global.generator1hp -= 19;
                    
                    obj_generator1_sio.hittimer = -1;
                }
            }
            
            if (instance_exists(obj_generator2_sio))
            {
                if (obj_generator2_sio.image_index < 2)
                {
                    global.generator2hp -= 14;
                    
                    if (!obj_battle_sio.susiejaminterrupt)
                        global.generator2hp -= 25;
                    
                    obj_generator2_sio.hittimer = -1;
                }
            }
            
            obj_susie_sio.specialrude = false;
            obj_battle_sio.susiejaminterrupt = true;
        }
    }
}

if (timer == 4)
{
    if (instance_exists(oGlobalC3RoomMikeFight))
    {
        if (!instance_exists(obj_bulletboard_sio))
        {
            var rudedamage = instance_create_depth(570, 190, ENEMY.depth - 50, obj_damage);
            rudedamage.value = round(damage);
            rudedamage.image_blend = #CC99CC;
            global.enemyhp -= round(damage);
        }
    }
}

if (timer == 4)
{
    if (instance_exists(oGlobalC3RoomSOFPath))
    {
        if (!instance_exists(obj_bulletboard_sof))
        {
            var rudedamage = instance_create_depth(ENEMY.x, ENEMY.y - 30, ENEMY.depth - 50, obj_damage);
            rudedamage.value = round(damage);
            rudedamage.image_blend = #CC99CC;
            global.enemyhp -= round(damage);
        }
    }
}
