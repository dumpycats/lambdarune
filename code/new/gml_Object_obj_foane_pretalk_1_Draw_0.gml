var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_self();
d0timer++;

if (d0timer == 60)
{
    dialogue = 1;
    talking = true;
    reset_dialogue_normal();
}

if (d9trigger)
{
    d9timer++;
    
    if (d9timer == 0)
    {
        instance_create_depth(obj_SOUL_sof_prebattle.x, obj_SOUL_sof_prebattle.y, obj_SOUL_sof_prebattle.depth - 50, obj_soulcover_1);
        audio_stop_sound(snd_deep_noise);
    }
    
    if (d9timer >= 10 && instance_exists(obj_soulcover_1))
    {
        obj_soulcover_1.image_alpha -= 0.1;
        obj_soulcover_1.flashalpha -= 0.1;
    }
    
    if (d9timer == 26)
        instance_destroy(obj_soulcover_1);
    
    if (d9timer == 50)
        instance_create_depth(320, 264, 50, obj_holdwarning_c3);
}
