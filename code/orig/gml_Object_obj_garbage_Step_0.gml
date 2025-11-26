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

if (randompick == 0)
{
}
else
{
}

image_alpha += 0.16666666666666666;
image_alpha = clamp(image_alpha, 0, 1);
percent1++;

if (percent1 <= 38)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 38);
    x = lerp(xx, xxend, position);
    direction = -90;
    speed += (1/3);
}

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
