var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

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
        sprite_index = spr_bomb_plus_invert;
        audio_play_sound(snd_bombfall, 1, false);
        spinstatic = false;
    }
    
    if (triggertimer == 4)
    {
        sprite_index = spr_bomb_plus;
        audio_play_sound(snd_bombfall, 1, false);
    }
    
    if (triggertimer == 8)
    {
        sprite_index = spr_bomb_plus_blast;
        image_index = 0;
        image_speed = 1;
        audio_play_sound(snd_scytheburst, 1, false);
    }
    
    if (triggertimer >= 9)
    {
    }
    
    if (triggertimer == 19)
    {
    }
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

if (timer == 300)
    instance_destroy();

if (spinstatic)
{
    var radius = 60;
    
    if (instance_exists(obj_SOUL_battle_sio))
    {
        var bx = obj_SOUL_battle_sio.x;
        var by = obj_SOUL_battle_sio.y;
        x = bx + lengthdir_x(radius, angle2);
        y = by + lengthdir_y(radius, angle2);
    }
    
    image_angle = 0;
    image_alpha = clamp(image_alpha + 0.1, 0, 1);
    angle2 += 5;
    angle2 %= 360;
}
