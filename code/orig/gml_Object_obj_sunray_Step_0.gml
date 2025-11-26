if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

if (reversed)
    image_angle += 1;
else
    image_angle -= 1;

if (image_angle == -270 || image_angle == 270)
    ending = true;

if (timer < 10)
{
    image_alpha += 0.1;
    image_alpha = clamp(image_alpha, 0, 1);
}

if (ending)
{
    image_alpha -= 0.1;
    
    if (image_alpha < 0)
        instance_destroy();
}

image_index = randomindex;

if (switchsprite == triggernumber)
    sprite_index = spr_sunray_full;
else
    sprite_index = spr_sunray;

if (switchsprite == 2)
    switchsprite = 0;

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
