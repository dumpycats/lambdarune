window_set_caption("Cathode Tower");
sprite_prefetch(sDialogueBox);
sprite_prefetch(spr_planegate_door);
sprite_prefetch(spr_tower_1);
sprite_prefetch(spr_tower_2);
sprite_prefetch(spr_c3_sky);
sprite_prefetch(spr_v_aware);
sprite_prefetch(spr_v_aware_leftarm);
sprite_prefetch(spr_v_aware_rightarm);
sprite_prefetch(spr_v_aware_talking);
timer = -1;

if (room == rm_ch3_cathodetower_aftermath)
    global.playermove = false;
else
    global.playermove = true;

global.yoffset = 50;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = 0;
global.krismaxhp = 160;
global.krishp = 160;
global.alldown = false;
