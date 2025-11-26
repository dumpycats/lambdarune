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

if (echoing)
{
    var s1 = instance_create_depth(x, y, depth, obj_spike_c3_echo_1);
    s1.image_xscale = image_xscale;
    s1.image_yscale = image_yscale;
    s1.image_blend = image_blend;
    s1.image_angle = image_angle;
    s1.image_alpha = image_alpha / 3;
}

if (left)
    x -= (7 * randommultiplier);
else
    x += (7 * randommultiplier);

randommultiplier += 0.01;

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
