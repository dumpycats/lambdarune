if (instance_exists(obj_battle_kf))
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
timer++;

if (x < -100 && leftright == 0)
    instance_destroy();
else if (x > 740 && leftright == 1)
    instance_destroy();

if (leftright == 0)
{
    if (timer == 0)
    {
        x = cx + 217;
        y = cy + 99;
        image_xscale = -2;
        image_yscale = -2;
        speed = 4 * speedmultiplier;
    }
}
else if (leftright == 1)
{
    if (timer == 0)
    {
        if (!exception)
        {
            x = cx + 423;
            y = cy + 241;
            speed = -4 * speedmultiplier;
        }
        else
        {
            image_xscale = -2;
            x = cx + 217;
            y = cy + 241;
            speed = 4 * speedmultiplier;
        }
    }
}

if (instance_exists(obj_bulletboard_kf))
{
    if (place_meeting(x, y, obj_SOUL_battle) && image_alpha > 0.6 && !hit)
    {
        obj_SOUL_battle.hurt = true;
        hit = true;
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_SOUL_TP) && !obj_SOUL_battle.hurt && image_alpha > 0.6)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}
