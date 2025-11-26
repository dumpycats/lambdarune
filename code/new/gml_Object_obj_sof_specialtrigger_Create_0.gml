timer = -1;
alpha = 0;
triggered = false;
nohit = false;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = -10;
global.onetap = false;

if (instance_exists(obj_controller_r))
    obj_controller_r.image_alpha = 2;

if (instance_exists(obj_controller_n))
    obj_controller_n.image_alpha = 2;
