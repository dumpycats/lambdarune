if (instance_exists(obj_battle_sof))
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

if (pull == 1)
    depth = SOUL.depth - 2;
else
    depth = SOUL.depth - 1;

if (speed < 0)
{
    if (!vertical)
    {
        if (x <= (SOUL.x + 100))
        {
            if (pingtimer < 0)
                image_speed = 1;
        }
    }
    else if (y <= (SOUL.y + 100))
    {
        if (pingtimer < 0)
            image_speed = 1;
    }
}
else if (speed > 0)
{
    if (!vertical)
    {
        if (x >= (SOUL.x - 100))
        {
            if (pingtimer < 0)
                image_speed = 1;
        }
    }
    else if (y >= (SOUL.y - 100))
    {
        if (pingtimer < 0)
            image_speed = 1;
    }
}

if (image_index >= 3)
{
    pingtimer++;
    
    if (pingtimer == 0)
        audio_play_sound(snd_scissorbell, 1, false);
}

if (instance_exists(BULLETBOARD))
{
    if (place_meeting(x, y, SOUL) && image_alpha > 0.6 && !hit)
    {
        if (pull == 1 && SOUL.pullpercent <= 0.5)
        {
            SOUL.hurt = true;
            hit = true;
        }
        
        if (pull == 2 && SOUL.pullpercent > 0.5)
        {
            SOUL.hurt = true;
            hit = true;
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
    image_xscale = 0.83 * xscalemultiplier;
    image_yscale = 0.83;
    image_blend = purplecolor;
}
