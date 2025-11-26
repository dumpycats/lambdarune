xspd = 0;
yspd = 0;
move_spd = 4;
boost_multiplier = 1.75;
playeronlymove = false;
image_xscale = 2;
image_yscale = 2;
depth = -20;
timer = 0;
interacttimer = -2;

if (room == rm_ch3_spacechannel_2)
{
    sprite_index = sKrisWalkRight;
    curvelinear = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
    percent2 = 0;
    percent3 = 0;
    percent4 = 0;
    percent5 = 0;
    percent6 = 0;
    dtimer1 = 0;
    dtimer2 = 0;
    dtimer3 = 0;
    dtimer6 = 0;
}

if (room == rm_ch3_spacechannel_1)
{
    back = false;
    createtimer = 0;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    curve2 = animcurve_get_channel(Bezier, "acBezier");
    percent1 = 0;
    percent2 = 0;
    percent3 = 0;
    
    if (instance_exists(oWallTransitionC3sp_2))
    {
        back = true;
        x = 1568;
        oBlackScreenFade.x = x;
        oBlackScreenFade.y = y;
        instance_destroy(oWallTransitionC3sp_2);
    }
    
    if (!back)
    {
        sprite_index = spr_krisroll;
        image_index = 0;
        image_speed = 1;
    }
    else
    {
        sprite_index = sKrisWalkLeft;
        image_index = 0;
        image_speed = 0;
    }
}

if (room == rChapter3Room6)
{
    image_index = 0;
    sprite_index = sKrisWalkDown;
    image_speed = 0;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
}

if (room == rChapter3Room3)
{
    sprite_index = sKrisWalkUp;
    image_speed = 0;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
}

if (room == rChapter3KreidRoom)
{
    sprite_index = spr_krisroll;
    x = 180;
    y = -45;
    image_speed = 1;
    falltimer = 0;
    curvefall = animcurve_get_channel(Bezier, "acSlowToFast");
    percentfall = 0;
    depth = -15;
    yy = y;
    kreidbegin = false;
    touching = false;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
    curve2 = animcurve_get_channel(Linear, "acLinear");
    percent2 = 0;
}

if (room == rChapter3Room1)
{
    image_speed = 0;
    dialogue19timer = 0;
}

if (room == rChapter3Room5)
{
    sprite_index = sKrisWalkRight;
    image_speed = 2;
}

if (room == rChapter3Room2)
{
    sprite_index = sKrisWalkDown;
    image_speed = 0;
    touching = false;
    dialoguespawntimer = 0;
    xx = 0;
    yy = 0;
    susiexx = 0;
    susieyy = 0;
}

if (room == rChapter3Room7)
{
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
    curve2 = animcurve_get_channel(Linear, "acLinear");
    percent2 = 0;
    curve3 = animcurve_get_channel(Linear, "acLinear");
    percent3 = 0;
}
