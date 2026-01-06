var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
timer++;
percent1++;

if (!triggered)
{
    var position = animcurve_channel_evaluate(curvelinear, percent1 / 30);
    
    if (percent1 <= 30)
        alpha = lerp(0, 1, position);
    else if (percent1 >= 90)
        alpha -= (1/15);
}
else
{
    alpha = 0;
}

draw_set_alpha(alpha);
draw_set_halign(fa_center);
draw_set_font(fDeterminationMW);
draw_set_color(c_black);
draw_text(cx + 318, cy + 50, get_lang_string("gml_Object_obj_sof_specialtrigger_Draw_0_0"));
draw_text(cx + 322, cy + 50, get_lang_string("gml_Object_obj_sof_specialtrigger_Draw_0_1"));
draw_text(cx + 320, cy + 48, get_lang_string("gml_Object_obj_sof_specialtrigger_Draw_0_2"));
draw_text(cx + 320, cy + 52, get_lang_string("gml_Object_obj_sof_specialtrigger_Draw_0_3"));
draw_set_color(c_white);
draw_text(cx + 320, cy + 50, get_lang_string("gml_Object_obj_sof_specialtrigger_Draw_0_4"));
draw_set_halign(fa_left);
draw_set_alpha(1);

if (keyboard_check_pressed(ord("R")))
{
    triggered = true;
    audio_stop_all();
    
    if (instance_exists(obj_battlecheck))
        instance_destroy(obj_battlecheck);
    
    if (instance_exists(obj_kreid_attackcheck))
        instance_destroy(obj_kreid_attackcheck);
    
    if (instance_exists(obj_kreid_nohitcheck))
        instance_destroy(obj_kreid_nohitcheck);
    
    if (instance_exists(obj_foane_attackcheck))
        instance_destroy(obj_foane_attackcheck);
    
    room_goto(rm_ch3_sof_skip);
}

if (keyboard_check_pressed(ord("N")) && !instance_exists(obj_battlecheck))
{
    triggered = true;
    nohit = true;
    
    if (instance_exists(obj_battle_sof))
    {
        if (!(global.krismaxhp == 1))
        {
            global.krishp = 1;
            global.krismaxhp = 1;
            global.susiehp = 1;
            global.susiemaxhp = 1;
            global.ralseihp = 1;
            global.ralseimaxhp = 1;
            global.onetap = true;
        }
        else
        {
            global.krismaxhp = 160;
            global.susiemaxhp = 190;
            global.ralseimaxhp = 140;
            global.onetap = false;
            nohit = false;
        }
    }
}

if (room == rLambdaruneLogoToC3)
    instance_destroy();
