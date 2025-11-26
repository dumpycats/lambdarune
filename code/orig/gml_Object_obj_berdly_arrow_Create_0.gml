pull = 1;
purplecolor = 14235093;
image_xscale = 1;
image_yscale = 1;

if (instance_exists(obj_bulletboard_sof))
    obj_bulletboard_sof.percent7 = -1;

curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curveslower2 = animcurve_get_channel(Bezier, "acShopMenu2");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = 0;
TP = obj_SOUL_TP_sof;
SOUL = obj_SOUL_battle_sof;
BULLETBOARD = obj_bulletboard_sof;
hit = false;
tptimer = 0;
timer = -1;
xscalemultiplier = 1;
yy = y;
xx = x;
targety = 0;
targetx = 0;
targetangle = 0;
frequency = 0;
amplitude = 0;
y_offset = 0;
pullspeed = 16;
xx = x;
image_alpha = 1;
