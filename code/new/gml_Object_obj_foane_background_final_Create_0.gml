percent0 = 320;
percent1 = 320;
backpercent2 = 320;
percent3 = 320;
backpercent4 = 320;
percent5 = 320;
backpercent6 = 320;
percent7 = 320;
backpercent9 = 320;
percent10 = 320;
backpercent12 = 320;
percent13 = 320;
backpercent14 = 320;

if (room == rm_ch3_sof_skip)
    flicker = 1;
else
    flicker = 0;

flickermod = 0;
percent10extra = 320;
SOULy = 189;
SOULx = 339;
subimg1 = 0;
subimg2 = 0;
subimg3 = 0;
subimgspeed = 1;
antialpha = 0;
surf2 = -1;
surf_game = surface_create(640, 480);
back = -1;
forward = 1;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
multiplier = 0;
endalpha = 0;

if (room == rm_ch3_sof)
{
    percenty1 = 0;
    trigger = false;
    yoffset = 80;
    image_alpha = 0;
}
else
{
    percenty1 = 40;
    trigger = true;
    yoffset = 0;
    image_alpha = 1;
    multiplier = 1/3;
}

depth = 50;

if (room == rm_ch3_sof_skip)
    moving = true;
else
    moving = false;
