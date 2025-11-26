battlestart = false;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
battlepercent = 0;
xx = x;
yy = y;
xxs = 0;
yys = 0;
xxr = 0;
yyr = 0;
backgroundalpha = 0;
manualoff = false;
flashalpha = 0;
flashcolor = 16777215;
flashpercent = 0;
flashtrigger = false;
itemchoice = 0;
flashtriggertimer = 0;
ENGINE = obj_battle_sio;

if (room == rm_ch3_pathout)
{
    sprite_index = sKrisWalkRight;
    image_speed = 1;
    speed = 4;
    triggertext = false;
    triggertimer = -1;
}
