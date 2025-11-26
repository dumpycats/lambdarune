image_index = 23;
image_speed = 1;
hitnoise = false;
hitoffset = 0;
noiseoffset = 0;
flashalpha = 0;
flashcolor = 16777215;
flashpercent = 0;
rise = false;
percentrise = 0;
flashalphax = 1;
flashcolorx = 2236996;

if (room == rm_ch3_maximike)
{
    flashcolor = 0;
    flashalpha = 1;
}
else
{
    flashalphax = 0;
}

xx = x;
xoffset = 0;
test = false;
hit = false;
hittimer = -1;
shake = false;
shaketimer = -1;
flash = false;
flashtimer = -1;
flicker = false;
flickertimer = -1;
subimg2 = 0;
off = false;
eject = false;
subimgoff = 0;
pandown = false;
percentpan = 0;
resetindex = 30;
reset = false;
subimg = 0;
aura = false;
auratimer = -1;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percentreset = 0;
