depth = -1000;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = 0;
percent2 = 0;
percent3 = 0;
walk = false;
walkpercent = 0;
out = false;
outpercent = 0;
ending = false;
endingpercent = 0;
endcaseintro = 1000;
endcasespeed = 1000;
speedtimer = -1;
endcaseleave = 1000;
endcasefinal = 1000;
speeding = false;
KRIS = obj_kris_c3;
SUSIE = obj_susie_ctower;
RALSEI = obj_ralsei_ctower;
percent4 = 0;
percent5 = 0;
d19timer = -1;
d20timer = -1;
interacttimer = -2;
progressallow = true;
interacttimer = -2;
talking = true;
subimg = 0;
dialogueicon = 1;
dialogueiconchoice = sSusieDialogueSprite;
quipicon = 0;
dialoguequipchoice = spr_empty;
current_dialogue = translation_get_string("gml_Object_obj_tower_text_Create_0_0");
displayed_text = "";
letter_index = 0;
sound_playing = false;
text_complete = false;
pause_for_punctuation = false;
pause_for_ellipsis = false;
destroy = false;
typing_speed = 1;
typing_timer = 0;
susietalk = false;
ralseitalk = false;
kreidtalk = false;
texttalk = false;

if (obj_kris_c3.y >= 220)
{
    dialoguebottom = false;
    dialoguetop = true;
}
else
{
    dialoguebottom = true;
    dialoguetop = false;
}

charactertalking = false;
dialogue = 2;
blockprogress = false;
skiptext = false;
skiptimer = 0;
quip = false;
quiplinear = animcurve_get_channel(Curve, "acLinear");
quipicon = spr_empty;
quipindex = 0;
quipx = 230;
quipxoffset = 50;
quipyoffset = 0;
quippercent = 0;
quipalpha = 0;
quipstring = translation_get_string("gml_Object_obj_tower_text_Create_0_1");
quipicon = spr_empty;
