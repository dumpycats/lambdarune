timer = -1;

if (global.c3outskirtscompleted)
    y = 180;

depth = 30;
curve1 = animcurve_get_channel(Bezier, "acSlowToFast");
percent1 = 0;
curve2 = animcurve_get_channel(Linear, "acLinear");
percent2 = 0;
curve3 = animcurve_get_channel(Bezier, "acSlowToFast");
percent3 = 0;
curve4 = animcurve_get_channel(Linear, "acLinear");
percent4 = 0;
