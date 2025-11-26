percent1++;
var position = animcurve_channel_evaluate(curveslower, percent1 / 110);
scale = lerp(5, 1, position);
image_alpha = lerp(0, 1, position);
