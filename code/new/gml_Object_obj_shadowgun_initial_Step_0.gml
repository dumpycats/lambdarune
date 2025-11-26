depth = obj_shadowman_initial.depth + 1;

if (obj_cameracontroller.percent3 == 0.8666666666666667)
    audio_play_sound(snd_bulletreverb, 1, false);

if (obj_cameracontroller.percent3 == 1.0333333333333334)
{
    obj_shadowman_initial.sprite_index = spr_shadowman_shoot;
    image_alpha = 1;
    image_index = 1;
    instance_create_depth(463, 1213, depth + 1, obj_shadowbullet_initial);
}

if (obj_cameracontroller.percent3 == 1.0666666666666667)
{
    x = 487;
    y = 1165;
}

if (obj_cameracontroller.percent3 == 1.1)
    image_index = 0;

if (global.dialogue == 7)
    image_alpha = 0;
