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
percent1++;

if (percent1 <= 15)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 15);
    y = lerp(cy + 246 + yoffset, cy + 196 + yoffset, position);
}

if (triggerup)
{
    percent2++;
    
    if (percent2 <= 50)
    {
        image_blend = purplecolor;
        var position = animcurve_channel_evaluate(curveease, percent2 / 50);
        y = lerp(cy + 196 + yoffset, cy + 100 + yoffset, position);
    }
}

speed = 2 * speedmultiplier;

if (x >= (cx + 320 + 142 + 71) || x <= ((cx + 320) - 142 - 71))
    x = (cx + 320) - 71;

hurttimer++;

if (instance_exists(BULLETBOARD))
{
    if (place_meeting(x, y, SOUL) && image_alpha > 0.6 && hurttimer >= 30)
    {
        if (pull == 1 && SOUL.pullpercent <= 0.5)
        {
            SOUL.hurt = true;
            hurttimer = 0;
        }
        
        if (pull == 2 && SOUL.pullpercent > 0.5 && hurttimer >= 30)
        {
            SOUL.hurt = true;
            hurttimer = 0;
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
