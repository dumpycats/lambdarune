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

if (percent1 <= 1)
{
    if (!exiting)
        percent1 += (1/30);
    
    var position1 = animcurve_channel_evaluate(curveslower, percent1);
    var delta_yscale = 1;
    var delta_alpha = 0.5;
    image_yscale = 0 + (delta_yscale * position1);
    image_alpha = 0.5 + (delta_alpha * position1);
}

if (exiting)
{
    percent2 += (1/15);
    var position1 = animcurve_channel_evaluate(curvefaster, percent2);
    var delta_yscale = -1;
    var delta_alpha = -0.5;
    image_yscale = 1 + (delta_yscale * position1);
    image_alpha = 1 + (delta_alpha * position1);
    
    if (percent2 == 1)
        instance_destroy();
}

if (percent1 > 1)
{
    timer2++;
    x = xx + (sin(timer2 / 24) * 60);
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
    tptrigger = true;

if (tptrigger)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP.add = true;
    
    if (tptimer == 31)
    {
        tptimer = 0;
        tptrigger = false;
    }
}
