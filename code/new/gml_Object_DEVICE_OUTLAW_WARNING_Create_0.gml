PITCH = 1;
image_alpha = 0;
audio_play_sound(AUDIO_OUTLAW_WARNING, 1, true, 1, false, PITCH);

if (instance_exists(obj_kreid_c3))
    obj_kreid_c3.image_alpha = 0;

if (instance_exists(obj_kris_c3))
    obj_kris_c3.image_alpha = 0;

if (instance_exists(obj_c3_sky))
    obj_c3_sky.xmultiplier = 0;
