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
image_alpha = timer / 10;
image_alpha = clamp(image_alpha, 0, 1);
y = round((sin((timer * pi) / 50) * 65) + (cy + 170));
image_angle = sin((timer * pi) / 40) * 2;
shoottimer++;

if ((shoottimer % 30) == 0)
{
    image_index = 1;
    image_speed = 1;
    audio_play_sound(snd_swing, 1, false, 1.5);
    var center_direction = 180;
    var count = 4;
    var step = 12;
    var i = -count;
    
    while (i <= count)
    {
        var elec = instance_create_depth(x, y, depth - 2, obj_elec_sio);
        elec.direction = center_direction + (i * step);
        i++;
    }
}
