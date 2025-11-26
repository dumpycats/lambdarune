if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

generaltimer++;

if (generaltimer == 110)
    instance_destroy();

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
