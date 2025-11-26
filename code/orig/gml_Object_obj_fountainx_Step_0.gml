image_xscale = scale;
image_yscale = scale;
percent1 += 1;
var position1 = animcurve_channel_evaluate(curveslower, percent1 / 10);
var delta_scale = -0.10000000000000009;
scale = 1.1 + (delta_scale * position1);
randomize();
var xrange = irandom_range(225, 415);
var yrange = irandom_range(0, 255);

if (percent1 > 50 && (percent1 % 1) == 0 && percent1 <= 66)
{
    instance_create_depth(xrange, yrange, depth - 3, obj_fountainx_small);
    
    if ((percent1 % 2) == 1)
        audio_play_sound(snd_bell_bc, 1, false, 1, false, 0.95);
}

if (percent1 == 68)
    instance_create_depth(315, 120, depth - 600, obj_foanetv_1);
