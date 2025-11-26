if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

if (trigger)
{
    triggertimer++;
    
    if (triggertimer == 0)
    {
        sprite_index = spr_bomb_invert;
        audio_play_sound(snd_bombfall, 1, false);
    }
    
    if (triggertimer == 4)
    {
        sprite_index = spr_bomb;
        audio_play_sound(snd_bombfall, 1, false);
    }
    
    if (triggertimer == 8)
    {
        sprite_index = spr_bomb_blast;
        audio_play_sound(snd_scytheburst, 1, false);
    }
    
    if (triggertimer >= 9)
        image_yscale -= 0.2;
    
    if (triggertimer == 19)
        instance_destroy();
}

if (instance_exists(obj_bulletboard_sio))
{
    if (place_meeting(x, y, obj_SOUL_battle_sio) && image_alpha > 0.6 && !hit && !(sprite_index == spr_bomb_blast && image_yscale == 2))
    {
        if (image_yscale > 0.2)
        {
            obj_SOUL_battle_sio.hurt = true;
            hit = true;
            trigger = true;
        }
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
