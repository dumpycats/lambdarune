image_speed = 0;
rush = false;
shake = false;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curveslowerer = animcurve_get_channel(Curve, "acSlower_speed");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = 0;
flashalpha = 0;
flashcolor = 16777215;
flashpercent = 0;
flashtrigger = false;
itemchoice = 0;
flashtriggertimer = 0;
ENGINE = obj_battle_sio;
ENEMY = obj_maximike_battle;
rudebuster = false;
specialrude = false;
bustertriggered = false;
rudetimer = -1;
bustertimer = -1;

if (room == rm_ch3_pathout)
{
    sprite_index = sSusieWalkUp;
    image_speed = 0;
}
