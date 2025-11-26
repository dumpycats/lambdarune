image_xscale = scale;
image_yscale = scale;

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
    else
    {
        percent1++;
    }
}

var position1 = animcurve_channel_evaluate(curveslower, percent1 / 10);
var delta_scale = -0.10000000000000009;
scale = 1.1 + (delta_scale * position1);
