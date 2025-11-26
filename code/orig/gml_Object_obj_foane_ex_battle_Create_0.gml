flashalpha = 0;
flashcolor = 16777215;
flashpercent = 0;
MAINSPRITE = spr_foane_ex_idle;

if (room == rm_ch3_sof)
{
}

trigger = false;
floattimer = -1;
floatmultiplier = 1;
yy = y;
subimg = 0;
image_index_save = image_index;
xx = x;
xoffset = 0;
backgroundalpha = 0;
hit = false;
hittimer = 30;
smallshake = false;
smallshaketimer = 30;
shake = false;
shaketimer = -1;
flash = false;
flashtimer = -1;
flicker = false;
flickertimer = -1;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percentreset = 0;
