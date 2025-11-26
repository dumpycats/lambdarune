timer++;
image_angle = direction + 90;

if (global.krishp <= 0)
    speed = 0;

if (timer == 100)
    instance_destroy();

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
