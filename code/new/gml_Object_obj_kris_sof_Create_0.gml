curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = 0;
image_speed = 0;

if (room == rm_ch3_screenroom)
    image_speed = 1;

battlestart = false;

if (room == rm_ch3_sof_skip)
{
    battlestart = true;
    image_index = 0;
}

percentdown = 0;
percentdown2 = 0;
percentdown3 = 0;
percentdown4 = 0;
timerdown = -1;
timerdown2 = -1;
timerdown3 = -1;
timertrigger = false;
timertrigger2 = false;
timertrigger3 = false;
falldown = false;
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
ENGINE = obj_battle_sof;
MEMBER1 = obj_kris_sof;
MEMBER2 = obj_susie_sof;
MEMBER3 = obj_ralsei_sof;
