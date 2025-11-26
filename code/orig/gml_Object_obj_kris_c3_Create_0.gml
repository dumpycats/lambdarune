image_speed = 0;
image_xscale = 2;
image_yscale = 2;
xspd = 0;
yspd = 0;
move_spd = 4;
boost_multiplier = 1.75;
multipler_multiplier = 1;
multipliertimer = -1;
xoffset = 0;
yoffset = 0;
follow_order = 0;
playeronlymove = false;
timer = -1;
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
flashalpha = 0;
flashcolor = 16777215;
flashpercent = 0;
flashtrigger = false;

if (room == rm_ch3_eggroom_tree)
    sprite_index = sKrisWalkUp;

if (room == rm_ch3_foanepath)
    sprite_index = sKrisWalkUp;

if (room == rm_ch3_cathodetower_final)
{
    sprite_index = sKrisWalkRight;
    texttimer = -1;
}

if (room == rm_ch3_cathodetower_aftermath)
    sprite_index = spr_kris_kreidaftermath;

if (room == rm_ch3_cathodetower_aftermath_1)
    sprite_index = sKrisWalkLeft;

if (room == rm_ch3_planegate)
    texttriggered = false;

if (room == rm_ch3_fountain)
{
    percent1 = 0;
    hue = 0;
}

battlestart = false;
backgroundalpha = 0;
manualoff = false;
enginetarget = 0;

if (room == rm_ch3_kreidfight || room == rm_ch3_kreidfight_skip)
{
    enginetarget = obj_battle_kf;
    
    if (room == rm_ch3_kreidfight)
    {
        fall = false;
        x = 700;
    }
    else
    {
        depth = 95;
        battlestart = true;
        obj_kreid_c3.battlestart = true;
    }
    
    xfinaloffset = 0;
    image_speed = 1;
    sprite_index = spr_krisroll;
    percent1 = 0;
    percent2 = 0;
    percent3 = 0;
    whitetimer = -1;
    whitealpha = 1.05;
}
