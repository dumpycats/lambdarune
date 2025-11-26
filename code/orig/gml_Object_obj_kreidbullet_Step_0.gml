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
image_alpha += 0.25;

if (follow)
{
    if (timer == 0)
    {
        y = obj_kreidgun.y;
        image_alpha = 1;
    }
    
    speed = 10;
}
else if (horizontal)
{
    var topbottomoffset;
    
    if (!(global.topoffset == 0))
        topbottomoffset = lerp(global.topoffset, global.bottomoffset, 0.5);
    else
        topbottomoffset = 0;
    
    x = cx + 320 + (sin(timer2 / 24) * (240 * multioffset));
    y = topbottomoffset + (cy + verticaloffset);
    
    if ((timer % 66) == 0 && timer > 1)
    {
        startangle = image_angle;
        endangle = startangle - 180;
        angletrigger = true;
    }
    
    if (angletrigger)
    {
        percent1 += 0.1;
        var position1 = animcurve_channel_evaluate(curveease, percent1);
        image_angle = startangle + ((endangle - startangle) * position1);
        
        if (percent1 > 1)
        {
            angletrigger = false;
            percent1 = 0;
        }
    }
}
else
{
    y = cy + 170 + (sin(timer2 / 20) * (130 * multioffset));
    
    if (followx && timer < xfollowstop)
        x = obj_SOUL_battle.x;
    
    if ((timer % 63) == 0 && timer > 1)
    {
        startangle = image_angle;
        endangle = startangle - 180;
        angletrigger = true;
    }
    
    if (angletrigger)
    {
        percent1 += 0.1;
        var position1 = animcurve_channel_evaluate(curveease, percent1);
        image_angle = startangle + ((endangle - startangle) * position1);
        
        if (percent1 > 1)
        {
            angletrigger = false;
            percent1 = 0;
        }
    }
}

if (instance_exists(obj_bulletboard_kf))
{
    if (place_meeting(x, y, obj_SOUL_battle) && image_alpha > 0.6 && !hit)
    {
        obj_SOUL_battle.hurt = true;
        hit = true;
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_SOUL_TP) && !obj_SOUL_battle.hurt && image_alpha > 0.6)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}
