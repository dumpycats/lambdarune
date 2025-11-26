if (instance_exists(obj_battle_kf))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
timer++;
timer2++;

if (instance_exists(obj_SOUL_battle))
    depth = obj_SOUL_battle.depth - 1;

if (timer <= 20)
{
    if (!wide)
    {
        sprite_index = spr_crosshair;
    }
    else
    {
        scale = 1/3;
        sprite_index = spr_crosshair_wide;
    }
    
    image_xscale = 1;
    image_yscale = 1;
    image_blend = c_red;
    alpha2 = 0;
    alpha += (1/30);
    alpha = clamp(alpha, 0, 1/3);
    image_alpha = alpha;
}
else
{
    if (!wide)
        image_xscale = scale * 0.9;
    else
        image_xscale = widescale * 0.9;
    
    image_yscale = scale * 0.9;
    
    if (timer == 21)
    {
        sprite_index = spr_kreidcircle;
        
        if (audible)
        {
            if (!wide)
                audio_play_sound(snd_bulletshot, 1, false);
            else
                audio_play_sound(snd_bulletreverb, 1, false, 1.6);
        }
        
        scale += 0.2;
    }
    
    alpha = 0;
    timer2 = 0;
    image_alpha = 1 - alpha2;
    image_blend = c_white;
    scale -= 0.08;
    
    if (timer > 28)
    {
        alpha2 += 0.1;
        scaleoffset = clamp(scaleoffset, 0, 10);
        alpha2 = clamp(alpha2, 0, 1.1);
    }
    
    if (alpha2 >= 1.1)
    {
        randomize();
        randomplus = random_range(1, 2);
        instance_destroy();
    }
    
    image_xscale = clamp(image_xscale, 0, 7);
    image_yscale = clamp(image_yscale, 0, 0.9);
}

if (instance_exists(obj_bulletboard_kf))
{
    if (place_meeting(x, y, obj_SOUL_battle) && image_alpha > 0.6 && !hit)
    {
        obj_SOUL_battle.hurt = true;
        hit = true;
    }
}

if (hit)
{
    hittimer++;
    
    if (hittimer == 1)
        instance_destroy();
}

if (place_meeting(x, y, obj_SOUL_TP) && !obj_SOUL_battle.hurt && image_alpha > 0.6)
    tptrigger = true;

if (tptrigger)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP.add = true;
    
    if (tptimer == 31)
    {
        tptimer = 0;
        tptrigger = false;
    }
}
