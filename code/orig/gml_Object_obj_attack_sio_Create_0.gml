randomize();
cxstart = camera_get_view_x(view_camera[0]);
cystart = camera_get_view_y(view_camera[0]);
image_speed = 0;
timer = -1;
inputtimer = -2;
hitnoise = false;
hitnoisetimer = -1;
criticalnoise = false;
criticalnoisetimer = -1;
kris = false;
krisscale = 1;
krisalpha = 1;
krishit = false;
susiehit = false;
ralseihit = false;
krishittimer = -1;
susiehittimer = -1;
ralseihittimer = -1;
allhittimer = -1;
krisspawn = 0;
krismiss = false;
susiemiss = false;
ralseimiss = false;
targetk = 0;
targetkend = false;
krisdamage = 165;
susiedamage = 270;
ralseidamage = 120;
krischoicedamage = 0;
krischoice = 0;
susiechoice = 0;
ralseichoice = 0;
kriscolor = 16776960;
susiecolor = 13408716;
ralseicolor = 8454016;
nerfmultiplier = 1;
endingtransition = false;

if (instance_exists(obj_battle_kf))
    battle_kf = true;
else
    battle_kf = false;

if (instance_exists(obj_battle_sio))
    battle_sio = true;
else
    battle_sio = false;

krisobject = obj_kris_sio;
susieobject = obj_susie_sio;
ralseiobject = obj_ralsei_sio;
ENGINE = obj_battle_sio;
ENEMY1 = obj_maximike_battle;
ENEMY1targetx = ENEMY1.x - 10;
ENEMY1targety = ENEMY1.y - 65;
susie = false;
ralsei = false;
order = 0;
targetpos = 0;
target_instances = [];
krisorder = 0;
susieorder = 0;
ralseiorder = 0;
