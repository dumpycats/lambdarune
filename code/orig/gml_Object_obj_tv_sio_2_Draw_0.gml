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

timer++;

if (timer < 11)
    image_alpha = (timer + 31) / 10;

if (timer > 45)
{
    image_alpha -= 0.1;
    
    if (image_alpha < 0)
        instance_destroy();
}

image_alpha = clamp(image_alpha, 0, 1);
y = round((sin((timer * pi) / 50) * 65) + (cy + 170));
image_angle = sin((timer * pi) / 40) * 2;
shoottimer++;

if (shoottimer == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 240;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 36) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 230;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 2) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 220;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 35) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 210;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 4) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 200;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 34) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 190;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 6) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 180;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 33) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 170;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 8) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 160;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 32) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 150;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 10) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 140;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 31) == 0)
{
    image_index = 1;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 130;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}

if ((shoottimer - 12) == 0)
{
    image_index = 0;
    image_speed = 1;
    var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
    elec.direction = 120;
    audio_play_sound(snd_arrow, 1, false, 0.6);
}
