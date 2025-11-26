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

percent1++;

if (percent1 <= 15)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 15);
    y = lerp(yy, targety, position);
    var position2 = animcurve_channel_evaluate(curveslower2, percent1 / 15);
    x = lerp(xx, targetx, position2);
    image_alpha = lerp(0, 1, position2);
    image_angle = lerp(0, targetangle, position2);
}
else if (image_angle == 90)
{
    speed -= 0.4;
    speed = clamp(speed, -6, 0);
    
    if (x < (cx - 50))
        instance_destroy();
}
else if (image_angle == -90)
{
    speed += 0.4;
    speed = clamp(speed, 0, 6);
    
    if (x > (cx + 690))
        instance_destroy();
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
    image_xscale = 0.83 * xscalemultiplier;
    image_yscale = 0.83;
    image_blend = purplecolor;
}
