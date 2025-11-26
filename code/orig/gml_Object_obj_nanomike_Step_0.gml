cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);
percent1++;

if (percent1 == 10)
    audio_play_sound(snd_arrow, 1, false, 0.5);

if (percent1 >= 10 && percent1 < 30)
{
    image_alpha += 0.1;
    image_alpha = clamp(image_alpha, 0, 1);
}

if (percent1 <= 60)
{
    var position2 = animcurve_channel_evaluate(curveslower, percent1 / 70);
    x = lerp(obj_maximike_battle.x, xposition, position2);
}

if (percent1 <= 30)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 30);
    y = lerp(obj_maximike_battle.y, cy + 38, position);
}
else
{
    depth = obj_bulletboard_sio.depth - 200;
    var position3 = animcurve_channel_evaluate(curvefaster, (percent1 - 30) / 30);
    
    if (percent1 < 65)
        y = lerp(cy + 38, cy + 244, position3);
}

if (percent1 == 60)
{
    image_index = 1;
}
else if (percent1 == 62)
{
    image_index = 2;
}
else if (percent1 == 64)
{
    image_speed = 1;
    sprite_index = spr_nanomike_jig;
}

if (percent1 == (90 + randomminus))
{
    sprite_index = spr_nanomike;
    image_speed = 0;
    image_index = 1;
}
else if (percent1 == (94 + randomminus))
{
    image_index = 0;
    audio_play_sound(snd_jump_bc, 1, false, 0.5);
    jump = true;
}

if (jump)
{
    jumppercent++;
    var jumpposition = animcurve_channel_evaluate(curvefaster, jumppercent / (30 + randomjumplength));
    direction = 90;
    speed = lerp(5, 0, jumpposition);
    
    if (jumppercent == (30 + randomjumplength))
    {
        var a = instance_create_depth(x, y, depth - 1, obj_explosion);
        a.image_xscale = 0.8;
        a.image_yscale = 0.8;
        audio_play_sound(snd_badexplosion, 1, false);
        randomize();
        var angleoffset = irandom_range(-3, 3);
        var x1 = instance_create_depth(x, y, depth - 5, obj_elec_sio_hit);
        x1.direction = 0 + angleoffset;
        x1.speed = 6;
        var x2 = instance_create_depth(x, y, depth - 5, obj_elec_sio_hit);
        x2.direction = 135 + angleoffset;
        x2.speed = 6;
        var x3 = instance_create_depth(x, y, depth - 5, obj_elec_sio_hit);
        x3.direction = 225 + angleoffset;
        x3.speed = 6;
        instance_destroy();
    }
}
