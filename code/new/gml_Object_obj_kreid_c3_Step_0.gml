var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (instance_exists(obj_battle_kf))
{
    if (global.alldown)
    {
        image_speed = 0;
        exit;
    }
}

if (fall)
{
    if (percent1 <= 1)
    {
        percent1 += 0.1;
        var position1 = animcurve_channel_evaluate(curvelinear, percent1);
        var delta_x = (cx + 480) - (cx + 660);
        var delta_y = (cy + 320) - (cy + 224);
        x = cx + 660 + (delta_x * position1);
        y = cy + 224 + (delta_y * position1);
    }
    
    if (percent1 >= 1)
        percent2 += 0.05;
    
    if (percent1 >= 1 && percent2 <= 3)
    {
        if (percent2 <= 0.3)
            image_index = 0;
        else
            image_index = 1;
        
        var position1 = animcurve_channel_evaluate(curveslower, percent2);
        var delta_x = (cx + 440) - (cx + 480);
        var delta_y = (cy + 284) - (cy + 284);
        x = cx + 480 + (delta_x * position1);
        y = cy + 284 + (delta_y * position1);
    }
    
    if (percent2 == 0.05)
    {
        sprite_index = spr_kreid_land;
        image_speed = 0;
        audio_play_sound(snd_impact, 1, false);
    }
    
    if (percent2 == 3)
    {
        obj_kris_c3.sprite_index = spr_kris_landrightidle;
        obj_kris_c3.image_speed = 1;
        sprite_index = spr_kreid_leftidle;
        image_speed = 1;
    }
    
    if (percent2 == 4.5)
    {
        talking = true;
        depth -= 2;
    }
}

if (battlestart)
{
    percent3 += 0.1;
    
    if (percent3 == 0.1)
    {
        image_speed = 0;
        sprite_index = spr_kreid_idle;
        image_index = 1;
        depth = 96;
    }
    
    if (percent3 <= 1)
        instance_create_depth(x, y, depth + 1, obj_kreid_echo);
    
    var position1 = animcurve_channel_evaluate(curvelinear, percent3);
    var delta_x = (cx + 520) - (cx + 440);
    var delta_y = (cy + 198) - (cy + 284);
    x = cx + 440 + (delta_x * position1);
    y = cy + 284 + (delta_y * position1);
    
    if (percent3 == 1)
    {
    }
}

if (instance_exists(obj_battle_kf) || global.endofbattle)
{
    xx = cx + 520;
    yy = cy + 198;
    x = xx + xoffset + xoffsetfinal;
    y = yy + yoffset;
    
    if (instance_exists(obj_kreid_smoke) && global.endofbattle)
    {
        obj_kreid_smoke.image_alpha -= 1/30;
        obj_kreid_smoke_black.image_alpha -= 1/30;
        obj_c3_sky.blackalpha += 0.016666666666666666;
        obj_c3_sky.blackalpha = clamp(obj_c3_sky.blackalpha, 0, 0.5);
    }
}
