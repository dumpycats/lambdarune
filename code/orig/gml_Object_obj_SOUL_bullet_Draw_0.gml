var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
timer++;

if (timer == 60)
    instance_destroy();

prev_x = x;
prev_y = y;

if (collision)
{
    image_speed = 1;
    speed = 0;
}

if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
}

if (instance_exists(obj_battle_sio))
{
    if (place_meeting(x, y, obj_battle_sio))
        instance_destroy();
}

if (instance_exists(obj_sun))
{
    if (place_meeting(x, y, obj_sun) && !collision)
    {
        obj_sun.hittimer = -1;
        collision = true;
    }
}

if (instance_exists(obj_generator1_sio))
{
    if (place_meeting(x, y, obj_generator1_sio) && !collision && obj_generator1_sio.image_index < 2)
    {
        obj_generator1_sio.hittimer = -1;
        collision = true;
        
        if (instance_exists(obj_bulletboard_sio) && !(obj_bulletboard_sio.image_speed == 1))
        {
            if (!obj_battle_sio.susiejaminterrupt && obj_battle_sio.susiemagic && obj_battle_sio.susieactoptions == 1 && obj_generator1_sio.nevermind == false)
            {
            }
            else
            {
                global.generator1hp -= 1;
            }
        }
    }
}

if (instance_exists(obj_generator2_sio))
{
    if (place_meeting(x, y, obj_generator2_sio) && !collision && obj_generator2_sio.image_index < 2)
    {
        obj_generator2_sio.hittimer = -1;
        collision = true;
        
        if (instance_exists(obj_bulletboard_sio) && !(obj_bulletboard_sio.image_speed == 1))
        {
            if (!obj_battle_sio.susiejaminterrupt && obj_battle_sio.susiemagic && obj_battle_sio.susieactoptions == 1 && obj_generator2_sio.nevermind == false)
            {
            }
            else
            {
                global.generator2hp -= 1;
            }
        }
    }
}

if (instance_exists(obj_spikebarrier))
{
    if (place_meeting(x, y, obj_spikebarrier) && obj_spikebarrier.x < (cx + 396) && !collision)
    {
        obj_spikebarrier.percent1 = 0;
        obj_spikebarrier.image_index = 1;
        audio_play_sound(snd_bell, 1, false);
        collision = true;
    }
}

if (instance_exists(obj_spikebarrier_2))
{
    if (place_meeting(x, y, obj_spikebarrier_2) && obj_spikebarrier_2.x < (cx + 396) && !collision)
    {
        obj_spikebarrier_2.percent1 = 0;
        obj_spikebarrier_2.timer = 1;
        obj_spikebarrier_2.image_index = 1;
        audio_play_sound(snd_bell, 1, false);
        collision = true;
    }
}

if (instance_exists(obj_bomb))
{
    var hit = instance_place(x, y, obj_bomb);
    
    if (hit != -4 && !collision)
    {
        hit.trigger = true;
        collision = true;
    }
}

var list = ds_list_create();
collision_line_list(prev_x, prev_y - 5, x, y + 5, obj_minitv, false, true, list, true);

if (ds_list_size(list) > 0)
{
    for (var i = 0; i < ds_list_size(list); i++)
    {
        var inst = ds_list_find_value(list, i);
        
        if ((instance_exists(inst) && !inst.collided && inst.changed) && !collision)
        {
            inst.collided = true;
            collision = true;
            
            if (x > inst.x)
                x = inst.x;
        }
    }
}

ds_list_destroy(list);
var list2 = ds_list_create();
collision_line_list(prev_x - 5, prev_y, x + 5, y, obj_rain_sio_hit, false, true, list2, true);

if (ds_list_size(list2) > 0)
{
    for (var j = 0; j < ds_list_size(list2); j++)
    {
        var rain = ds_list_find_value(list2, j);
        
        if ((instance_exists(rain) && !rain.collided) && !collision)
        {
            rain.collided = true;
            collision = true;
            
            if (y < rain.y)
                y = rain.y;
        }
    }
}

ds_list_destroy(list2);
var list3 = ds_list_create();
collision_line_list(prev_x - 5, prev_y, x + 5, y, obj_minitv_wall, false, true, list3, true);

if (ds_list_size(list3) > 0)
{
    for (var j = 0; j < ds_list_size(list3); j++)
    {
        var tv1 = ds_list_find_value(list3, j);
        
        if ((instance_exists(tv1) && !tv1.collided) && !collision && tv1.changed)
        {
            tv1.collided = true;
            collision = true;
            
            if (x > tv1.x)
                x = tv1.x;
        }
        else if ((instance_exists(tv1) && !tv1.collided) && !collision)
        {
            collision = true;
            audio_play_sound(snd_bell, 1, false);
        }
    }
}

ds_list_destroy(list3);
var hit7 = collision_line(prev_x - 4, prev_y - 4, x + 4, y + 4, obj_minitv_wall_2, false, true);

if (hit7 != -4 && instance_exists(hit7) && !collision && !hit7.collided && hit7.changed)
{
    hit7.collided = true;
    collision = true;
    
    if (x > hit7)
        x = hit7.x;
}
else if (hit7 != -4 && instance_exists(hit7) && !collision && !hit7.collided)
{
    collision = true;
    
    if (x > hit7)
        x = hit7.x;
    
    audio_play_sound(snd_bell, 1, false);
}

var hit2 = collision_line(prev_x - 5, prev_y, x + 5, y + 5, obj_bomb_rotate, false, true);

if (hit2 != -4 && instance_exists(hit2) && !collision && !hit2.trigger && hit2.image_alpha >= 0.6)
{
    hit2.trigger = true;
    collision = true;
    
    if (x > hit2)
        x = hit2.x;
}

var hit4 = collision_line(prev_x, prev_y - 5, x, y + 5, obj_tvcable_stretch_a, false, true);

if (hit4 != -4 && instance_exists(hit4) && !collision && !hit4.collision)
{
    hit4.collision = true;
    collision = true;
    audio_play_sound(snd_bell, 1, false);
    
    if (x > hit4)
        x = hit4.x;
}

var hit5 = collision_line(prev_x, prev_y - 5, x, y + 5, obj_tvcable_stretch_b, false, true);

if (hit5 != -4 && instance_exists(hit5) && !collision)
{
    hit5.collision = true;
    collision = true;
    audio_play_sound(snd_bell_bc, 1, false);
    
    if (x > hit5)
        x = hit5.x;
}

var hit6 = collision_line(prev_x, prev_y - 5, x, y + 5, obj_elec_sio_hit, false, true);

if (hit6 != -4 && instance_exists(hit6) && !collision && !hit6.collided)
{
    hit6.collided = true;
    collision = true;
    
    if (x > hit6)
        x = hit6.x;
}
