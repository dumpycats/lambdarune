var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
percent1++;

if (percent1 <= 20)
{
    var position = animcurve_channel_evaluate(curvefaster, percent1 / 20);
    y = lerp(yy, 280, position);
}

if (percent1 == 20)
{
    audio_play_sound(snd_impact, 1, false);
    sprite_index = spr_mike_land;
    image_speed = 0;
    image_index = 0;
    obj_sio_remote.image_index += 1;
    audio_play_sound(snd_glassbreak, 1, false);
}

if (percent1 == 21)
    obj_sio_remote.y += 6;

if (percent1 == 22)
    obj_sio_remote.y += 4;

if (percent1 == 23)
    obj_sio_remote.y += 2;

if (percent1 == 24)
    obj_sio_remote.y += 1;

if (percent1 == 25)
    obj_sio_remote.y += 1;

if (percent1 == 23)
{
    image_index = 1;
    obj_sio_text_postbattle.d28switch = true;
}

if (percent1 == 26)
    image_index = 2;

if (percent1 == 29)
    image_index = 3;

if (percent1 == 32)
    image_index = 4;
