if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        if (up)
        {
            y -= (9 * randommultiplier);
            image_angle = 90;
        }
        else
        {
            y += (9 * randommultiplier);
            image_angle = -90;
        }
        
        timer++;
    }
}

if (echoing && false)
{
    var s1 = instance_create_depth(x, y, depth + 2, obj_spike_c3_echo);
    s1.image_xscale = image_xscale;
    s1.image_yscale = image_yscale;
    s1.image_blend = image_blend;
    s1.image_angle = image_angle;
    s1.image_alpha = image_alpha / 3;
}

if (timer == 1)
    image_alpha = 1;

if (timer == 90)
    instance_destroy();

if (image_angle == 90)
{
    if (y <= -64)
        instance_destroy();
}
else if (image_angle == -90)
{
    if (y >= 544)
        instance_destroy();
}

if (sprite_index == spr_spike)
    randommultiplier += 0.01;
else
    randommultiplier += 0.02;

if (pull == 1)
    depth = SOUL.depth - 2;
else
    depth = SOUL.depth - 1;

if (!hit)
{
    if (instance_exists(obj_bulletboard_sof_end))
    {
        if (place_meeting(x, y, SOUL) && image_alpha > 0.6)
        {
            if (pull == 1 && SOUL.pullpercent <= 0.5)
            {
                SOUL.hurt = true;
                
                if (sprite_index == spr_spike)
                    instance_destroy();
                else
                    hit = true;
            }
            
            if (pull == 2 && SOUL.pullpercent >= 0.5)
            {
                SOUL.hurt = true;
                
                if (sprite_index == spr_spike)
                    instance_destroy();
                else
                    hit = true;
            }
        }
    }
}

if (place_meeting(x, y, obj_SOUL_TP_sof) && !SOUL.hurt && image_alpha > 0.6 && ((pull == 2 && SOUL.pullpercent > 0.5) || (pull == 1 && SOUL.pullpercent <= 0.5)))
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP_sof.add = true;
}

if (!stop)
{
    if (up)
    {
        if (y <= (SOUL.y + 100))
            image_speed = 1;
    }
    else if (y >= (SOUL.y - 100))
    {
        image_speed = 1;
    }
}

if (image_index == 3)
{
    pingtimer++;
    
    if (pingtimer == 0)
        audio_play_sound(snd_scissorbell, 1, false);
}
