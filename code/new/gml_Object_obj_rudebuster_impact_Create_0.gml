audio_play_sound(snd_rudebuster_hit, 1, false);
timer = -1;
damage = 0;

if (instance_exists(oGlobalC3RoomMikeFight))
{
    if (!instance_exists(obj_bulletboard_sio))
    {
        ENEMY = obj_maximike_battle;
        ENEMY.flash = true;
        ENEMY.shake = true;
        ENEMY.hitnoise = true;
        ENEMY.hitoffset = -0.4;
        ENEMY.noiseoffset = 0.5;
    }
}

if (instance_exists(oGlobalC3RoomSOFPath))
{
    if (!instance_exists(obj_bulletboard_sof))
    {
        ENEMY = obj_foane_ex_battle;
        ENEMY.flash = true;
        ENEMY.shake = true;
        obj_foane_ex_battle.sprite_index = spr_foane_ex_hit;
    }
}
