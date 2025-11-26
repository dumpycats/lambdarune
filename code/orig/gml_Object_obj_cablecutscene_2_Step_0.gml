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
    x = lerp(-20, 270, position);
}
