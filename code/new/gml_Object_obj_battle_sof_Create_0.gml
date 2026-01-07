var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
window_set_caption(translation_get_string("obj_battle_sof_Create_0_0"));
debug = false;
finalrequirement = false;
entireyoffset = 0;
percentydown = 0;
cyroomoffset = 20;
finallaugh = false;
randomize();
instance_create_depth(cx + 320, cy + 240, -666, obj_tpbar);
audio_sound_gain(snd_foane, 1, 0);
songchoice = irandom_range(10, 30);
oldchoice = 6;

if (songchoice == oldchoice && global.c3signalcompleted)
{
}
else
{
    audio_sound_gain(mus_harmonious_foane, 1, 0);
    audio_play_sound(mus_harmonious_foane, 6, true, 0.9);
}

audio_sound_gain(mus_exstatic_resonance, 1, 0);
global.endofbattle = false;
endtimer = -1;
global.nohit = true;
global.onetap = false;
global.finaltalk = false;
finaltalktimer = -1;
finaltalktimerdelta = -1;
global.harmonizing = false;
global.harmonyphase = 0;
global.harmonized = false;
global.harmonytp = 66;
global.harmonyfrequency = 22050;
effect = audio_effect_create(AudioEffectType.LPF2);
effect.cutoff = global.harmonyfrequency;
audio_bus_main.effects[0] = effect;
global.krismaxhp = 160;
global.krishp = 160;
global.susiemaxhp = 190;
global.susiehp = 190;
global.ralseimaxhp = 140;
global.ralseihp = 140;
global.enemyhp = 6350;
global.enemymaxhp = 6350;
global.generator1hp = 10;
global.generator2hp = 10;
global.mercy = 0;
global.tp = 0;
global.turn = 1;
global.enemyturn = false;
global.alldown = false;
tpmax = false;

if (instance_exists(obj_sof_specialtrigger))
{
    obj_sof_specialtrigger.triggered = true;
    
    if (obj_sof_specialtrigger.nohit)
    {
        global.krishp = 1;
        global.krismaxhp = 1;
        global.susiehp = 1;
        global.susiemaxhp = 1;
        global.ralseihp = 1;
        global.ralseimaxhp = 1;
        global.onetap = true;
    }
}

global.topoffset = 0;
global.bottomoffset = 0;
global.leftoffset = 0;
global.rightoffset = 0;
depth = -666;
generaltimer = -1;
textmenu = true;
textenemy = false;
textact = false;
dialogueicon = 1;
iconoffsetx = 0;
textxoffset = -34;
textyoffset = -120;
dialoguebubblexscale = 1;
dialoguexoffset = 0;
dialogueyoffset = 0;
current_dialogue = "";
displayed_text = "";
letter_index = 0;
sound_playing = false;
text_complete = false;
pause_for_punctuation = false;
pause_for_ellipsis = false;
destroy = false;
typing_speed = 1;
typing_timer = 0;
d29timer = -1;
d31timer = -1;
d57timer = -1;
tennatalk = false;
miketalk = false;
susietalk = false;
ralseitalk = false;
emptytalk = false;
texttalk = true;
dialoguebottom = true;
dialoguetop = false;
charactertalking = false;
menudialogue = 1;
enemydialogue = 1;
enemydialoguecount = 1;
actdialogue = 1;
reason = 0;
randomize();
randomtextjam = irandom_range(0, 2);
jamwait = 0;
susiejaminterrupt = false;
jammer = false;
jammed = false;
generator1 = false;
generator2 = false;
jamphase = 0;
jamtext = "";
tennatext = "";
ACTNAME = translation_get_string("obj_battle_sof_Create_0_1");
blockprogress = false;
skiptext = false;
skiptimer = 0;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percentblankrise = 0;
percentdownk = 0;
percentupk = 1;
percentdowns = 1;
percentups = 0;
percentdownr = 1;
percentupr = 0;
percentextra = 0;
inputtimer = -2;
pos_y = cy + 400;
pos_y2 = cy + 430;
pos_ys = cy + 400;
pos_y2s = cy + 430;
pos_yr = cy + 400;
pos_y2r = cy + 430;
kriscolor = 16776960;
susiecolor = 16711935;
ralseicolor = 65280;
menucolor = 3350579;
tpcolor = 4235519;
darkred = 128;
orange = 2117887;
green = 65280;
flashpercent = 0;
flashresettimer = -1;
turnrefresh = false;
turnprogress = false;
susieprogress = false;
ralseiprogress = false;
progressfinal = false;
krisdefending = false;
susiedefending = false;
ralseidefending = false;
ENGINE = self;
ATTACK = obj_attack_sof;
ENEMYNAME = translation_get_string("obj_battle_sof_Create_0_2");
ENEMY1 = obj_foane_ex_battle;
ENEMYinitialx = obj_foane_ex_battle.x;
ENEMY1.trigger = true;
SOUL = obj_SOUL_battle_sof;
PARTYMEMBER1 = obj_kris_sof;
PARTYMEMBER2 = obj_susie_sof;
PARTYMEMBER3 = obj_ralsei_sof;
PAINCHOICE = obj_kris_sof;
PAINHP = global.krishp;
PARTYMEMBER1.sprite_index = spr_kris_idle;
PARTYMEMBER1.image_speed = 1;
PARTYMEMBER2.sprite_index = spr_susie_idle;
PARTYMEMBER2.image_speed = 1;
PARTYMEMBER3.sprite_index = spr_ralsei_idle;
PARTYMEMBER3.image_speed = 1;
krismenux = 107;
susiemenux = 320;
ralseimenux = 533;
krisdown = false;
susiedown = false;
ralseidown = false;
battlebegun = false;
barsubimg = 0;
soulsubimg = -1;
soulsubimgback = -1;
krismenuaccessible = false;
krismenuoptions = 1;
krisbattleicon = 0;
krisselected = false;
krisdefend = false;
krisactselected = false;
krisactoptions = 0;
krisacting = false;
krismercy = false;
krisitem = false;
krisitemtimer = -1;
krisfight = false;
krishurt = false;
susiemenuaccessible = false;
susiemenuoptions = 1;
susiebattleicon = 0;
susieselected = false;
susiedefend = false;
susieactselected = false;
susieactoptions = 0;
susieacting = false;
susiemagic = false;
susiemercy = false;
susieitem = false;
susieitemtimer = -1;
susiefight = false;
susiehurt = false;
ralseimenuaccessible = false;
ralseimenuoptions = 1;
ralseibattleicon = 0;
ralseiselected = false;
ralseidefend = false;
ralseiactselected = false;
ralseiactoptions = 0;
ralseiacting = false;
ralseimagic = false;
ralseimagicselected = false;
ralseimercy = false;
ralseiitem = false;
ralseiitemtimer = -1;
ralseifight = false;
ralseihurt = false;
hurttimer = -1;
krisswitch = false;
susieswitch = false;
ralseiswitch = false;
susiedeswitch = false;
ralseideswitch = false;
randompick = irandom_range(1, 9);
used_itemk = 0;
used_items = 0;
used_itemr = 0;
empty = 666;
itemfullname = "";
last_used_indexk = empty;
last_used_indexr = empty;
last_used_indexs = empty;
healmenu = false;
healoption = 0;
itemtargetk = PARTYMEMBER1;
itemtargets = PARTYMEMBER2;
itemtargetr = PARTYMEMBER3;
advancecounter = 0;
itemsection = 0;
itemrows = 0;
itemcolumns = 0;
itemy = cy + 393;
itemx = cx + 18;
global.item_data = ds_map_create();

function define_item(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var entry = ds_map_create();
    ds_map_add(entry, "name", arg1);
    ds_map_add(entry, "short", arg2);
    ds_map_add(entry, "hover", arg3);
    ds_map_add(entry, "heal", arg4);
    ds_map_add(entry, "team_heal", arg5);
    ds_map_add(global.item_data, arg0, entry);
}

ITEM_KREID = 0;
ITEM_DONUT = 1;
ITEM_MILK = 2;
ITEM_STRUDEL = 3;
ITEM_BTEA = 4;
ITEM_SPINCAKE = 5;
ITEM_TEA = 6;
ITEM_TV = 7;
ITEM_REVIVE = 8;
ITEM_EMPTY = -1;
itemlist = [ITEM_KREID, ITEM_DONUT, ITEM_MILK, ITEM_REVIVE, ITEM_BTEA, ITEM_KREID, ITEM_SPINCAKE, ITEM_DONUT, ITEM_REVIVE, ITEM_REVIVE, ITEM_TV, ITEM_TV];
define_item(ITEM_KREID, translation_get_string("obj_battle_sof_Create_0_3"), translation_get_string("obj_battle_sof_Create_0_4"), translation_get_string("obj_battle_sof_Create_0_5"), 140, false);
define_item(ITEM_DONUT, translation_get_string("obj_battle_sof_Create_0_6"), translation_get_string("obj_battle_sof_Create_0_7"), translation_get_string("obj_battle_sof_Create_0_8"), 70, false);
define_item(ITEM_MILK, translation_get_string("obj_battle_sof_Create_0_9"), translation_get_string("obj_battle_sof_Create_0_10"), translation_get_string("obj_battle_sof_Create_0_11"), 100, true);
define_item(ITEM_STRUDEL, translation_get_string("obj_battle_sof_Create_0_12"), translation_get_string("obj_battle_sof_Create_0_13"), translation_get_string("obj_battle_sof_Create_0_14"), 90, false);
define_item(ITEM_BTEA, translation_get_string("obj_battle_sof_Create_0_15"), translation_get_string("obj_battle_sof_Create_0_16"), translation_get_string("obj_battle_sof_Create_0_17"), 777, true);
define_item(ITEM_SPINCAKE, translation_get_string("obj_battle_sof_Create_0_18"), translation_get_string("obj_battle_sof_Create_0_19"), translation_get_string("obj_battle_sof_Create_0_20"), 140, true);
define_item(ITEM_TEA, translation_get_string("obj_battle_sof_Create_0_21"), translation_get_string("obj_battle_sof_Create_0_22"), translation_get_string("obj_battle_sof_Create_0_23"), 10, false);
define_item(ITEM_TV, translation_get_string("obj_battle_sof_Create_0_24"), translation_get_string("obj_battle_sof_Create_0_25"), translation_get_string("obj_battle_sof_Create_0_26"), 110, false);
define_item(ITEM_REVIVE, translation_get_string("obj_battle_sof_Create_0_27"), translation_get_string("obj_battle_sof_Create_0_28"), translation_get_string("obj_battle_sof_Create_0_29"), 999, false);
define_item(ITEM_EMPTY, "error", "", "", 0, false);

enum AudioEffectType
{
    Bitcrusher,
    Delay,
    Gain,
    HPF2,
    LPF2,
    Reverb1,
    Tremolo,
    PeakEQ,
    HiShelf,
    LoShelf,
    EQ,
    Compressor
}
