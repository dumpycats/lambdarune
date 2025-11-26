randomize();
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
image_speed = 0;
timer = -1;
inputtimer = 0;
kris = false;
krisscale = 1;
krisalpha = 1;
krishit = false;
krishittimer = -1;
krisspawn = 0;
krismiss = false;
targetk = 0;
targetkend = false;
krisdamage = 165;
krischoicedamage = 0;
krischoice = 0;
kriscolor = 16776960;
onerandom = 319;
tworandomk = choose(415, 319);
endingtransition = false;

if (instance_exists(obj_battle_kf))
    battle_kf = true;
else
    battle_kf = false;

susie = false;
ralsei = false;
