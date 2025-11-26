draw_self();

if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

if (image_yscale > 0)
    y = yy + yoffset;
else
    y = yy - yoffset;

if (instance_exists(obj_bulletboard_sio))
{
    if (place_meeting(x, y, obj_SOUL_battle_sio) && image_alpha > 0.6 && !hit)
    {
        obj_SOUL_battle_sio.hurt = true;
        hit = true;
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_SOUL_TP_sio) && !obj_SOUL_battle_sio.hurt && image_alpha > 0.6)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP_sio.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}

if (timer == 250)
    instance_destroy();

if (collision)
{
    percent1++;
    var position = animcurve_channel_evaluate(curveslower, percent1 / 15);
    yoffset = lerp(0, 81, position);
    
    if (percent1 == 1)
        image_index = 2;
    
    if (percent1 == 3)
        image_index = 1;
}
