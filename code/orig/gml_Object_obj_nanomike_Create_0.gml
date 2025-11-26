depth = obj_kris_sio.depth - 1;
image_alpha = 0;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = 0;
xposition = 0;
cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);
randomize();
leftright = irandom_range(0, 1);
randomminus = irandom_range(0, 10);
jump = false;
jumppercent = 0;
randomjumplength = irandom_range(-5, 10);

if (leftright == 0)
    xposition = irandom_range(cx + 125, cx + 225);
else
    xposition = irandom_range(cx + 414, cx + 514);
