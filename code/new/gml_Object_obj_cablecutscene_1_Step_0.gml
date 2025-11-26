if (pull == 1)
    depth = obj_SOUL_sof_prebattle.depth - 2;
else
    depth = obj_SOUL_sof_prebattle.depth - 1;

if (place_meeting(x, y, obj_SOUL_sof_prebattle) && image_alpha > 0.6)
{
    if (pull == 1 && obj_SOUL_sof_prebattle.pullpercent <= 0.5)
    {
        obj_SOUL_sof_prebattle.hurt = true;
        instance_destroy();
    }
    
    if (pull == 2 && obj_SOUL_sof_prebattle.pullpercent > 0.5)
    {
        obj_SOUL_sof_prebattle.hurt = true;
        instance_destroy();
    }
}

if (pull == 2)
{
    var time = current_time / 1000;
    image_xscale = 1.66;
    image_yscale = 0.83;
    image_blend = purplecolor;
}

percent1++;

if (percent1 <= 30)
{
    var position = animcurve_channel_evaluate(curvefaster, percent1 / 30);
    x = lerp(660, 370, position);
}

if (percent1 == 30)
{
    audio_play_sound(snd_noise, 1, false);
    audio_play_sound(snd_deep_noise, 1, true);
    instance_create_depth(320, 240, 110, obj_redpurple_flare);
    obj_redpurple_flare.image_index = 0;
}

if (percent1 == 60)
{
    with (obj_foane_pretalk_1)
    {
        dialogue = 8;
        talking = true;
        reset_dialogue_normal();
    }
}

if (percent1 >= 70 && instance_exists(obj_soulcover_1))
{
}

if (percent1 == 86)
{
}
