var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (instance_exists(ENGINE))
{
    if (global.alldown)
    {
        image_speed = 0;
        exit;
    }
}

depth = -y;

if (battlepercent == 0)
{
    xx = x;
    yy = y;
    xxs = obj_susie_sio.x;
    yys = obj_susie_sio.y;
    xxr = obj_ralsei_sio.x;
    yyr = obj_ralsei_sio.y;
}

if (battlestart)
{
    battlepercent += 0.1;
    var battleposition = animcurve_channel_evaluate(curvelinear, battlepercent);
    
    if (battlepercent == 0.1)
    {
        sprite_index = spr_kris_flyup;
        obj_maximike_foreground.image_index = 1;
    }
    
    if (battlepercent <= 1)
    {
        x = lerp(xx, cx + 132, battleposition);
        y = lerp(yy, cy + 178, battleposition);
        instance_create_depth(x, y, depth + 6, obj_kris_sio_echo);
        obj_susie_sio.x = lerp(xxs, cx + 118, battleposition);
        obj_susie_sio.y = lerp(yys, cy + 214, battleposition);
        instance_create_depth(obj_susie_sio.x, obj_susie_sio.y, obj_susie_sio.depth + 6, obj_susie_sio_echo);
        obj_ralsei_sio.x = lerp(xxr, cx + 140, battleposition);
        obj_ralsei_sio.y = lerp(yyr, cy + 288, battleposition);
        instance_create_depth(obj_ralsei_sio.x, obj_ralsei_sio.y, obj_ralsei_sio.depth + 6, obj_ralsei_sio_echo);
    }
    
    if (battlepercent == 1)
    {
        image_index = 1;
        sprite_index = spr_kris_fight;
        obj_ralsei_sio.image_speed = 1;
        obj_ralsei_sio.image_index = 0;
        obj_ralsei_sio.sprite_index = spr_ralsei_begin;
        obj_susie_sio.image_speed = 1;
        obj_susie_sio.image_index = 0;
        obj_susie_sio.sprite_index = spr_susie_attack;
        audio_play_sound(snd_weaponpull_fast, 1, false);
    }
    
    if (battlepercent == 2.3)
    {
        obj_susie_sio.image_index = 2;
        image_speed = 0;
    }
    
    if (battlepercent == 2.5)
    {
        sprite_index = spr_kris_idle;
        image_speed = 1;
        global.battle = true;
        battlestart = false;
        obj_maximike_battle.image_speed = 1;
        instance_create_depth(cx + 320, cy + 240, -480, obj_battle_sio);
    }
}

if (room == rm_ch3_pathout)
{
    if (x >= 340)
        triggertext = true;
    
    if (triggertext)
    {
        triggertimer++;
        
        if (triggertimer == 0)
        {
            instance_create_depth(320, 240, -400, obj_sio_text_pathout);
            image_speed = 0;
            speed = 0;
            x = 340;
        }
    }
}
