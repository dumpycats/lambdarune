percent0 = 320;
percent1 = 320;
percent2 = 320;
percent3 = 320;
percent4 = 320;
percent5 = 320;
percent6 = 320;
percent7 = 320;
percent8 = 320;
percent9 = 320;
percent10 = 320;
percent11 = 320;

if (room == rm_ch3_sof)
{
    percenty1 = 0;
    trigger = false;
    yoffset = 80;
}
else
{
    percenty1 = 40;
    trigger = true;
    yoffset = 0;
}

curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
multiplier = 0;

if (room == rm_ch3_sof)
    image_alpha = 0;
else
    image_alpha = 1;

if (room == rm_ch3_sof)
    alpha = 1;
else
    alpha = 0;

depth = -10;

if (room == rm_ch3_sof_skip)
    moving = true;
else
    moving = false;
