if (sprite_index == spr_kreid_drop)
{
    image_speed = 0;
    image_index = 3;
}

if (sprite_index == spr_kreid_hug || sprite_index == spr_kreid_nohitnoogie)
{
    walkout = true;
    audio_stop_sound(snd_deathsqueak);
    
    if (sprite_index == spr_kreid_nohitnoogie)
    {
        audio_play_sound(snd_hurt1, 1, false);
        instance_create_depth(obj_kris_c3.x, obj_kris_c3.y, obj_kris_c3.depth - 10, obj_damage);
        obj_damage.value = 1;
    }
    
    sprite_index = spr_kreid_walkleft;
    image_speed = 0;
    image_index = 0;
    obj_kris_c3.image_alpha = 1;
}
