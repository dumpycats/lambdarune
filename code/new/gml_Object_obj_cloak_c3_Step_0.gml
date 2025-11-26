if (image_index > 6)
    image_speed = 0;

if (endtrigger)
    endtimer++;

if (endtimer == 30)
    image_index = 7;

if (endtimer == 36)
{
    image_alpha = 0;
    instance_destroy(obj_church_background);
    instance_destroy(obj_knight_eclipse);
    instance_destroy(obj_alvin_c3);
    instance_create_depth(320, 240, -100, obj_cloak_slash);
    audio_play_sound(snd_laz, 1, false, 1, false, 0.6);
}
