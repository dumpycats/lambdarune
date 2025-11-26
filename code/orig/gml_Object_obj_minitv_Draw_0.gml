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

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

timer++;

if (timer == 25)
    change = true;

if (change)
{
    changetimer++;
    
    if (changetimer == 0)
    {
        image_speed = 1;
        audio_play_sound(snd_staticbrief, 1, false, 1, false, pitch);
    }
    
    if (image_index >= 4)
    {
        image_speed = 0;
        changed = true;
    }
}

if (!collided)
    speed = -8 + offset;

if (timer > 30)
    offset = sin(((timer - 30) / 90) * (2 * pi)) * 5;

image_angle = sin(((timer * rotatemultiplier) / 60) * (2 * pi)) * 4;

if (instance_exists(obj_bulletboard_sio))
{
    if (place_meeting(x, y, obj_SOUL_battle_sio) && image_alpha > 0.6 && !hit && !collided)
    {
        obj_SOUL_battle_sio.hurt = true;
        hit = true;
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_SOUL_TP_sio) && !obj_SOUL_battle_sio.hurt && image_alpha > 0.6 && !collided)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP_sio.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}

if (timer == 250)
    instance_destroy();

if (collided)
{
    collisiontimer++;
    
    if (collisiontimer == 0)
    {
        flashalpha = 1;
        speed = 0;
        audio_play_sound(snd_bomb, 1, false, 0.5);
    }
    
    if (collisiontimer > 0)
    {
        flashalpha = 0;
        image_xscale += 0.1;
        image_yscale += 0.1;
        image_alpha -= 0.1;
    }
    
    if (collisiontimer == 11)
        instance_destroy();
}
