if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

if (pull == 1)
    depth = SOUL.depth - 2;
else
    depth = SOUL.depth - 1;

if (instance_exists(BULLETBOARD))
{
    if (place_meeting(x, y, SOUL) && image_alpha > 0.6)
    {
        if (pull == 1 && SOUL.pullpercent <= 0.5)
        {
            SOUL.hurt = true;
            instance_destroy();
        }
        
        if (pull == 2 && SOUL.pullpercent > 0.5)
        {
            SOUL.hurt = true;
            instance_destroy();
        }
    }
}

if (place_meeting(x, y, TP) && !SOUL.hurt && image_alpha > 0.6 && ((pull == 2 && SOUL.pullpercent > 0.2) || (pull == 1 && SOUL.pullpercent <= 0.8)))
{
    tptimer++;
    
    if (tptimer == 1)
        TP.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}

if (pull == 2)
{
    var time = current_time / 1000;
    image_xscale = 0.83;
    image_yscale = 0.83;
    image_blend = purplecolor;
}

percent1++;

if (percent1 <= 15)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 10);
    image_yscale = lerp(0, 1, position);
    image_alpha = lerp(0, 1, position);
}

if (bounce)
{
    direction = image_angle + 90;
    
    if (y <= 119)
    {
        image_angle = -120;
        speed += (1/3);
    }
    else if (y >= 260)
    {
        image_angle = -60;
        speed += (1/3);
    }
}
