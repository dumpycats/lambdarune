if (sprite_index == spr_kris_fight && battlestart)
{
    image_index = 7;
    image_speed = 0;
}

if (sprite_index == spr_kris_act)
    sprite_index = spr_kris_idle;

if (sprite_index == spr_kris_item)
{
    sprite_index = spr_kris_idle;
    flashtrigger = true;
    audio_play_sound(snd_power, 1, false);
    
    if (instance_exists(obj_battle_kf))
    {
        obj_battle_kf.krisbattleicon = 0;
        global.krishp += obj_battle_kf.used_item;
        global.krishp = clamp(global.krishp, -999, 160);
        var greenhp = instance_create_depth(x - 6, y - 6, depth - 3, obj_krisdamage);
        greenhp.image_blend = c_lime;
        greenhp.value = obj_battle_kf.used_item;
        
        if (global.krishp >= global.krismaxhp)
            greenhp.maximum = true;
        
        var greenspark = instance_create_depth(x - 20, y, depth - 2, oSpareStar);
        greenspark.image_blend = c_lime;
        greenspark.image_angle = -90;
        var greenspark1 = instance_create_depth(x - 30, y - 10, depth - 2, oSpareStar);
        greenspark1.image_blend = c_lime;
        greenspark1.image_angle = -90;
        var greenspark2 = instance_create_depth(x + 10, y + 14, depth - 2, oSpareStar);
        greenspark2.image_blend = c_lime;
        greenspark2.image_angle = -90;
        var greenspark3 = instance_create_depth(x - 10, y + 20, depth - 2, oSpareStar);
        greenspark3.image_blend = c_lime;
        greenspark3.image_angle = -90;
        var greenspark4 = instance_create_depth(x + 10, y - 14, depth - 2, oSpareStar);
        greenspark4.image_blend = c_lime;
        greenspark4.image_angle = -90;
    }
}
