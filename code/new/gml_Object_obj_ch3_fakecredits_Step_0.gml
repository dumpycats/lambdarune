percent1++;
var position = animcurve_channel_evaluate(curvelinear, percent1 / 120);
y = lerp(20, -220, position);
image_alpha += 0.1;

if (percent1 == 60)
    obj_ralsei_sio.sprite_index = sRalseiWalkDown;

if (percent1 == 90)
{
    obj_tenna_sio_aftermath.sprite_index = spr_tenna_down;
    obj_tenna_sio_aftermath.image_index = 0;
}

if (percent1 == 120)
{
    obj_ralsei_sio.sprite_index = sRalseiWalkUp;
    obj_sio_text_postbattle.d51switch = true;
    instance_destroy();
    audio_stop_sound(mus_screen_theme);
}
