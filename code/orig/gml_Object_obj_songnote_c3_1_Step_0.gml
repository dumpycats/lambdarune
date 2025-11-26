if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

speed = 3 * speedmultiplier;

if (trigger)
{
    if (speedmultiplier >= 0.7)
        positive = true;
    else if (speedmultiplier <= -0.7)
        negative = true;
    
    trigger = false;
    xscalesave = xscalemultiplier;
    speedsave = speedmultiplier;
}

if (positive || negative)
{
    percent1++;
    
    if (percent1 <= 50)
    {
        var position = animcurve_channel_evaluate(curveease, percent1 / 30);
        speedmultiplier = lerp(speedsave, speedsave * -0.9, position);
        xscalemultiplier = lerp(xscalesave, xscalesave * -1, position);
    }
    
    if (percent1 == 50)
    {
        trigger = false;
        positive = false;
        negative = false;
        percent1 = 0;
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
