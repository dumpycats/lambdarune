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

hurttimer++;

if (instance_exists(BULLETBOARD))
{
    if (place_meeting(x, y, SOUL) && image_alpha > 0.7 && hurttimer >= 30)
    {
        if (pull == 1)
        {
            SOUL.hurt = true;
            hurttimer = -1;
        }
        
        if (pull == 2)
        {
            SOUL.hurt = true;
            hurttimer = -1;
        }
    }
}

if (place_meeting(x, y, TP) && !SOUL.hurt && image_alpha > 0.7)
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
    image_xscale = 0.83 * xscalemultiplier;
    image_yscale = 0.83;
    image_blend = purplecolor;
}
