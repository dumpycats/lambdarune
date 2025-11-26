y = yy + global.yoffset;
percentextfade++;
var position = animcurve_channel_evaluate(curvelinear, percentextfade / 10);
image_alpha = lerp(0, 0.95, position);
