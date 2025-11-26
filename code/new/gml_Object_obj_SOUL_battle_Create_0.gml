image_speed = 0;

if (instance_exists(obj_bulletboard_kf))
    depth = obj_bulletboard_kf.depth - 6;

image_alpha = 0;
hurt = false;
hurting = false;
hurttimer = -1;
hurtchoice = 1;
nohit = true;
gameovertimer = -1;

if (instance_exists(obj_battle_kf))
    enginetarget = obj_battle_kf;

xspd = 0;
yspd = 0;
move_spd = 4;
boost_multiplier = 0.5;
initialization = true;
ending = false;
moving = false;
xx = x;
yy = y;
curvelinear = animcurve_get_channel(Linear, "acLinear");
curveslower = animcurve_get_channel(Curve, "acSlower");
percentinitialx = 0;
percentinitialy = 0;
percentendingx = 0;
percentendingy = 0;
instance_create_depth(x, y, depth + 1, obj_SOUL_TP);
purple = false;
ystrings = false;
xstrings = false;
divider = 1;
darkpurplecolor = 7084650;
purplecolor = make_color_rgb(213 / divider, 53 / divider, 217 / divider);
scaleoffset = 1;
scale = 1;
initialtimer = 0;
alphapercent = 0;
stringalpha = 0;
stringoption = 1;
string0percent = 0;
string1percent = 0;
string2percent = 0;
string_start_x = 0;
string_target_x = 0;
string_start_y = 0;
string_target_y = 0;
pullpercent = 0;
stringx1 = 0;
stringx2 = 0;
stringx3 = 0;
