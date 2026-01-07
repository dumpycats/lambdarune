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
draw_text(cx + 318, cy + 50, translation_get_string("obj_kf_specialtrigger_Draw_0_0"));
draw_text(cx + 322, cy + 50, translation_get_string("obj_kf_specialtrigger_Draw_0_1"));
draw_text(cx + 320, cy + 48, translation_get_string("obj_kf_specialtrigger_Draw_0_2"));
draw_text(cx + 320, cy + 52, translation_get_string("obj_kf_specialtrigger_Draw_0_3"));
draw_set_color(c_white);
draw_text(cx + 320, cy + 50, translation_get_string("obj_kf_specialtrigger_Draw_0_4"));
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
    
    room_goto(rm_ch3_kreidfight_skip);
}

if (keyboard_check_pressed(ord("N")) && !instance_exists(obj_battlecheck))
{
    triggered = true;
    nohit = true;
    
    if (instance_exists(obj_battle_kf))
    {
        if (!(global.krismaxhp == 1))
        {
            global.krishp = 1;
            global.krismaxhp = 1;
        }
        else
        {
            global.krismaxhp = 160;
            nohit = false;
        }
    }
}

if (room == rLambdaruneLogoToC3)
    instance_destroy();
