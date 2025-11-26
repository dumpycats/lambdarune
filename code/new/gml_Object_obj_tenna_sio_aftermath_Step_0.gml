var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
percent1++;

if (percent1 <= 20)
{
    var position = animcurve_channel_evaluate(curvefaster, percent1 / 20);
    y = lerp(yy, 280, position);
}

if (percent1 == 17)
    instance_create_depth(x, y - 100, depth + 10, obj_sio_remote);

if (percent1 == 17)
{
    sprite_index = spr_tenna_land;
    image_speed = 0;
    image_index = 0;
}

if (percent1 == 23)
{
    audio_play_sound(snd_impact, 1, false);
    image_index = 1;
}

if (percent1 == 26)
    image_index = 2;

if (percent1 == 29)
    image_index = 3;

if (percent1 == 32)
    image_index = 4;

if (sleep)
{
    sleeptimer++;
    
    if ((sleeptimer % 10) == 0)
        randomize();
    
    if ((sleeptimer % (25 + randomoffset)) == 0)
        instance_create_depth(x, y - 96, depth + 6, obj_z_sleep_ch3);
}
