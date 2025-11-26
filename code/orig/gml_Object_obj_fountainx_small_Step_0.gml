image_xscale = scale;
image_yscale = scale;
percent1 += 0.1;
var position1 = animcurve_channel_evaluate(curveslower, percent1);
var delta_scale = -0.10000000000000009;
scale = 1.1 + (delta_scale * position1);
