image_speed = 0;

if (instance_exists(obj_bulletboard_sio))
    depth = obj_bulletboard_sio.depth - 6;

if (instance_exists(obj_bulletboard_sof))
    depth = obj_bulletboard_sof.depth - 6;

image_alpha = 0;
hurt = false;
hurting = false;
hurttimer = -1;
randomize();
downupdate = false;
nohit = true;
down = false;
up = false;
inputtimer = -3;
special = false;
specialangle = 90;
gameovertimer = -1;

if (instance_exists(obj_battle_sio))
{
    ENGINETARGET = obj_battle_sio;
    KRIS = obj_kris_sio;
    SUSIE = obj_susie_sio;
    RALSEI = obj_ralsei_sio;
}
else if (instance_exists(obj_battle_sof))
{
    ENGINETARGET = obj_battle_sof;
    KRIS = obj_kris_sof;
    SUSIE = obj_susie_sof;
    RALSEI = obj_ralsei_sof;
}

valid_targets = [];

if (!ENGINETARGET.krisdown)
    array_push(valid_targets, 1);

if (!ENGINETARGET.susiedown)
    array_push(valid_targets, 2);

if (!ENGINETARGET.ralseidown)
    array_push(valid_targets, 3);

if (array_length(valid_targets) > 0)
    hurtchoice = valid_targets[irandom(array_length(valid_targets) - 1)];
else
    hurtchoice = 1;

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
instance_create_depth(x, y, depth + 1, obj_SOUL_TP_sio);
yellow = false;
yellowcolor = 4259839;
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
