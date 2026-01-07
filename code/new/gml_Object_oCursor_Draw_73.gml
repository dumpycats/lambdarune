var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
depth = -6666;
var restartroom = room;
var restart1 = keyboard_check(ord("R"));
var restart2 = keyboard_check_pressed(ord("T"));

if (restart1 && restart2)
    allaway = true;

if (instance_exists(obj_battle_sof) || instance_exists(obj_battle_sio) || instance_exists(obj_battle_kf))
{
    if (keyboard_check_pressed(vk_delete))
        global.enemyhp -= 500;
    
    if (keyboard_check_pressed(vk_tab))
    {
        global.turn -= 1;
        turnalpha = 1;
    }
    else if (keyboard_check_pressed(ord("1")))
    {
        global.turn += 1;
        turnalpha = 1;
    }
    else if (keyboard_check_pressed(ord("2")))
    {
        global.turn += 2;
        turnalpha = 1;
    }
    else if (keyboard_check_pressed(ord("3")))
    {
        global.turn += 3;
        turnalpha = 1;
    }
    else if (keyboard_check_pressed(ord("4")))
    {
        global.turn += 4;
        turnalpha = 1;
    }
    else if (keyboard_check_pressed(ord("5")))
    {
        global.turn += 5;
        turnalpha = 1;
    }
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_black);
    draw_set_alpha(turnalpha);
    var turn = translation_get_string("oCursor_Draw_73_0") + string(global.turn);
    draw_text(cx + 320, cy + 48 + 2, turn);
    draw_text(cx + 320, (cy + 48) - 2, turn);
    draw_text(cx + 320 + 2, cy + 48, turn);
    draw_text((cx + 320) - 2, cy + 48, turn);
    draw_set_color(c_yellow);
    draw_text(cx + 320, cy + 48, turn);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1);
    turnalpha -= (1/30);
    turnalpha = clamp(turnalpha, 0, 1);
}

if (keyboard_check_pressed(vk_space))
{
    if (!on)
        on = true;
    else
        on = false;
}

if (mouse_check_button_pressed(mb_left))
    selecton = true;
else if (mouse_check_button_pressed(mb_right))
    selecton = false;

if (on && selecton)
{
    if (mouse_check_button_pressed(mb_left))
    {
        selecton = true;
        var list = ds_list_create();
        collision_point_list(x, y, all, false, true, list, true);
        
        for (var i = 0; i < ds_list_size(list); i++)
        {
            var candidate = ds_list_find_value(list, i);
            
            if (candidate != id && true)
            {
                selected_obj = candidate;
                break;
            }
        }
        
        ds_list_destroy(list);
        var obj = instance_position(x, y, all);
        
        if (obj != -4 && obj != id)
            selected_obj = obj;
    }
    else if (mouse_check_button_pressed(mb_right))
    {
        selecton = false;
        selected_obj = -4;
    }
}

if (on && selecton)
{
    if (!(selected_obj == -4) && instance_exists(selected_obj))
    {
        selectedx = selected_obj.x;
        selectedy = selected_obj.y;
    }
    else
    {
        selectedx = 0;
        selectedy = 0;
    }
    
    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fDeterminationSans);
    draw_set_alpha(1);
    draw_text(cx + 6, cy + 4, translation_get_string("oCursor_Draw_73_1") + string(selectedx - cx) + "\n" + string(selectedy - cy));
    draw_text(cx + 6, cy + 8, translation_get_string("oCursor_Draw_73_2") + string(selectedx - cx) + "\n" + string(selectedy - cy));
    draw_text(cx + 4, cy + 6, translation_get_string("oCursor_Draw_73_3") + string(selectedx - cx) + "\n" + string(selectedy - cy));
    draw_text(cx + 8, cy + 6, translation_get_string("oCursor_Draw_73_4") + string(selectedx - cx) + "\n" + string(selectedy - cy));
    draw_set_alpha(0.8);
    draw_set_color(c_white);
    draw_text(cx + 6, cy + 6, translation_get_string("oCursor_Draw_73_5") + string(selectedx - cx) + "\n" + string(selectedy - cy));
    draw_set_alpha(1);
}

if (window_get_fullscreen())
{
    var mx = display_mouse_get_x();
    var my = display_mouse_get_y();
    var cam = view_camera[0];
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);
    var win_w = window_get_width();
    var win_h = window_get_height();
    var scale_x = win_w / cam_w;
    var scale_y = win_h / cam_h;
    var scale = min(scale_x, scale_y);
    var offset_x = (win_w - (cam_w * scale)) / 2;
    var offset_y = (win_h - (cam_h * scale)) / 2;
    mx = ((mx - offset_x) / scale) + cx;
    my = ((my - offset_y) / scale) + cy;
    x = round(mx);
    y = round(my);
}
else
{
    var mousex = camera_get_view_x(view_camera[0]) + (window_mouse_get_x() / 2);
    var mousey = camera_get_view_y(view_camera[0]) + (window_mouse_get_y() / 2);
    x = round(mousex);
    y = round(mousey);
}

if (on)
{
    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fDeterminationSans);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
    draw_set_color(c_black);
    draw_text(cx + 6, cy + 4, "\n" + string(x - cx) + "\n" + string(y - cy));
    draw_text(cx + 6, cy + 8, "\n" + string(x - cx) + "\n" + string(y - cy));
    draw_text(cx + 4, cy + 6, "\n" + string(x - cx) + "\n" + string(y - cy));
    draw_text(cx + 8, cy + 6, "\n" + string(x - cx) + "\n" + string(y - cy));
    draw_set_alpha(0.8);
    draw_set_color(c_white);
    draw_text(cx + 6, cy + 6, "\n" + string(x - cx) + "\n" + string(y - cy));
    draw_set_alpha(1);
}

if (on && keyboard_check(vk_backspace))
{
    audio_bus_main.effects[0] = undefined;
    allaway = true;
    room_goto(rm_ch3_debug);
    instance_destroy();
}

if (allaway)
{
    if (instance_exists(obj_controller_joystick))
        instance_destroy(obj_controller_joystick);
    
    if (instance_exists(oESC))
        instance_destroy(oESC);
    
    if (instance_exists(oCRT))
        instance_destroy(oCRT);
    
    if (instance_exists(obj_sof_specialtrigger))
        instance_destroy(obj_sof_specialtrigger);
    
    if (instance_exists(obj_foane_attackcheck))
        instance_destroy(obj_foane_attackcheck);
    
    if (instance_exists(obj_battlecheck))
        instance_destroy(obj_battlecheck);
    
    if (instance_exists(obj_chaseSR_empty))
        instance_destroy(obj_chaseSR_empty);
    
    if (instance_exists(obj_eggchecker))
        instance_destroy(obj_eggchecker);
    
    if (instance_exists(obj_healthbar_kris))
        instance_destroy(obj_healthbar_kris);
    
    if (instance_exists(obj_healthbar_susie))
        instance_destroy(obj_healthbar_susie);
    
    if (instance_exists(obj_kf_specialtrigger))
        instance_destroy(obj_kf_specialtrigger);
    
    if (instance_exists(obj_sio_specialtrigger))
        instance_destroy(obj_sio_specialtrigger);
    
    if (instance_exists(obj_kreid_attackcheck))
        instance_destroy(obj_kreid_attackcheck);
    
    if (instance_exists(obj_kreid_nohitcheck))
        instance_destroy(obj_kreid_nohitcheck);
    
    if (instance_exists(obj_memorandum_notice_c3))
        instance_destroy(obj_memorandum_notice_c3);
    
    if (instance_exists(obj_spacechannel_screen1))
        instance_destroy(obj_spacechannel_screen1);
    
    if (instance_exists(obj_spacechannel_screen2))
        instance_destroy(obj_spacechannel_screen2);
    
    if (instance_exists(obj_spacechannel_screen3))
        instance_destroy(obj_spacechannel_screen3);
    
    if (instance_exists(obj_spacechannel_textcheck))
        instance_destroy(obj_spacechannel_textcheck);
    
    if (instance_exists(oGlobalHP_R3))
        instance_destroy(oGlobalHP_R3);
    
    if (instance_exists(oWallTransitionC3sp_2))
        instance_destroy(oWallTransitionC3sp_2);
    
    if (instance_exists(txt_krishp_overworld))
        instance_destroy(txt_krishp_overworld);
    
    if (instance_exists(txt_krismaxhp_overworld))
        instance_destroy(txt_krismaxhp_overworld);
    
    if (instance_exists(txt_susiehp_overworld))
        instance_destroy(txt_susiehp_overworld);
    
    if (instance_exists(txt_susiemaxhp_overworld))
        instance_destroy(txt_susiemaxhp_overworld);
    
    audio_sound_gain(mus_outofbounds, 1, 0);
    audio_sound_pitch(mus_outofbounds, 1);
    audio_sound_gain(mus_primflower, 1, 0);
    audio_sound_pitch(mus_primflower, 1);
    audio_sound_gain(mus_revolution, 1, 0);
    audio_sound_pitch(mus_revolution, 1);
    audio_sound_gain(mus_screen_theme, 1, 0);
    audio_sound_pitch(mus_screen_theme, 1);
    audio_sound_gain(mus_shadowchase, 1, 0);
    audio_sound_pitch(mus_shadowchase, 1);
    audio_sound_gain(mus_shadowshop, 1, 0);
    audio_sound_pitch(mus_shadowshop, 1);
    audio_sound_gain(mus_strings, 1, 0);
    audio_sound_pitch(mus_strings, 1);
    audio_sound_gain(mus_strollingshady, 1, 0);
    audio_sound_pitch(mus_strollingshady, 1);
    audio_sound_gain(mus_tennasiblings_boss, 1, 0);
    audio_sound_pitch(mus_tennasiblings_boss, 1);
    audio_sound_gain(mus_THE_GREATEST_COMEDY, 1, 0);
    audio_sound_pitch(mus_THE_GREATEST_COMEDY, 1);
    audio_sound_gain(mus_wind, 1, 0);
    audio_sound_pitch(mus_wind, 1);
    audio_sound_gain(snd_acquire_lancer, 1, 0);
    audio_sound_pitch(snd_acquire_lancer, 1);
    audio_sound_gain(snd_announcement, 1, 0);
    audio_sound_pitch(snd_announcement, 1);
    audio_sound_gain(snd_arrow, 1, 0);
    audio_sound_pitch(snd_arrow, 1);
    audio_sound_gain(snd_aw_audience, 1, 0);
    audio_sound_pitch(snd_aw_audience, 1);
    audio_sound_gain(snd_badexplosion, 1, 0);
    audio_sound_pitch(snd_badexplosion, 1);
    audio_sound_gain(snd_battleenter, 1, 0);
    audio_sound_pitch(snd_battleenter, 1);
    audio_sound_gain(snd_bell, 1, 0);
    audio_sound_pitch(snd_bell, 1);
    audio_sound_gain(snd_bell_bc, 1, 0);
    audio_sound_pitch(snd_bell_bc, 1);
    audio_sound_gain(snd_bomb, 1, 0);
    audio_sound_pitch(snd_bomb, 1);
    audio_sound_gain(snd_bombfall, 1, 0);
    audio_sound_pitch(snd_bombfall, 1);
    audio_sound_gain(snd_break1, 1, 0);
    audio_sound_pitch(snd_break1, 1);
    audio_sound_gain(snd_break2, 1, 0);
    audio_sound_pitch(snd_break2, 1);
    audio_sound_gain(snd_bulletreverb, 1, 0);
    audio_sound_pitch(snd_bulletreverb, 1);
    audio_sound_gain(snd_bulletshot, 1, 0);
    audio_sound_pitch(snd_bulletshot, 1);
    audio_sound_gain(snd_bump, 1, 0);
    audio_sound_pitch(snd_bump, 1);
    audio_sound_gain(snd_cardrive, 1, 0);
    audio_sound_pitch(snd_cardrive, 1);
    audio_sound_gain(snd_car_doorslam, 1, 0);
    audio_sound_pitch(snd_car_doorslam, 1);
    audio_sound_gain(snd_car_doorslam_reverb, 1, 0);
    audio_sound_pitch(snd_car_doorslam_reverb, 1);
    audio_sound_gain(snd_chain_extend, 1, 0);
    audio_sound_pitch(snd_chain_extend, 1);
    audio_sound_gain(snd_chairiel, 1, 0);
    audio_sound_pitch(snd_chairiel, 1);
    audio_sound_gain(snd_cheer, 1, 0);
    audio_sound_pitch(snd_cheer, 1);
    audio_sound_gain(snd_cinematickick, 1, 0);
    audio_sound_pitch(snd_cinematickick, 1);
    audio_sound_gain(snd_closet_impact, 1, 0);
    audio_sound_pitch(snd_closet_impact, 1);
    audio_sound_gain(snd_cough, 1, 0);
    audio_sound_pitch(snd_cough, 1);
    audio_sound_gain(snd_foane_laugh, 1, 0);
    audio_sound_pitch(snd_foane_laugh, 1);
    audio_sound_gain(snd_criticalswing, 1, 0);
    audio_sound_pitch(snd_criticalswing, 1);
    audio_sound_gain(snd_damage, 1, 0);
    audio_sound_pitch(snd_damage, 1);
    audio_sound_gain(snd_deathsqueak, 1, 0);
    audio_sound_pitch(snd_deathsqueak, 1);
    audio_sound_gain(snd_deep_noise, 1, 0);
    audio_sound_pitch(snd_deep_noise, 1);
    audio_sound_gain(snd_drumroll, 1, 0);
    audio_sound_pitch(snd_drumroll, 1);
    audio_sound_gain(snd_egg, 1, 0);
    audio_sound_pitch(snd_egg, 1);
    audio_sound_gain(snd_elecdoor_close, 1, 0);
    audio_sound_pitch(snd_elecdoor_close, 1);
    audio_sound_gain(snd_elecdoor_open, 1, 0);
    audio_sound_pitch(snd_elecdoor_open, 1);
    audio_sound_gain(snd_elecdoor_shut, 1, 0);
    audio_sound_pitch(snd_elecdoor_shut, 1);
    audio_sound_gain(snd_elevator, 1, 0);
    audio_sound_pitch(snd_elevator, 1);
    audio_sound_gain(snd_empty, 1, 0);
    audio_sound_pitch(snd_empty, 1);
    audio_sound_gain(snd_equip, 1, 0);
    audio_sound_pitch(snd_equip, 1);
    audio_sound_gain(snd_explosion, 1, 0);
    audio_sound_pitch(snd_explosion, 1);
    audio_sound_gain(snd_explosion_mmx3, 1, 0);
    audio_sound_pitch(snd_explosion_mmx3, 1);
    audio_sound_gain(snd_fall_cool_deep, 1, 0);
    audio_sound_pitch(snd_fall_cool_deep, 1);
    audio_sound_gain(snd_feighline, 1, 0);
    audio_sound_pitch(snd_feighline, 1);
    audio_sound_gain(snd_foane, 1, 0);
    audio_sound_pitch(snd_foane, 1);
    audio_sound_gain(snd_foanereverb, 1, 0);
    audio_sound_pitch(snd_foanereverb, 1);
    audio_sound_gain(snd_gasp_audience, 1, 0);
    audio_sound_pitch(snd_gasp_audience, 1);
    audio_sound_gain(snd_glassbreak, 1, 0);
    audio_sound_pitch(snd_glassbreak, 1);
    audio_sound_gain(snd_glitchbuffer, 1, 0);
    audio_sound_pitch(snd_glitchbuffer, 1);
    audio_sound_gain(snd_grab, 1, 0);
    audio_sound_pitch(snd_grab, 1);
    audio_sound_gain(snd_graze, 1, 0);
    audio_sound_pitch(snd_graze, 1);
    audio_sound_gain(snd_great_shine, 1, 0);
    audio_sound_pitch(snd_great_shine, 1);
    audio_sound_gain(snd_heartshot_dr_b, 1, 0);
    audio_sound_pitch(snd_heartshot_dr_b, 1);
    audio_sound_gain(snd_hurt1, 1, 0);
    audio_sound_pitch(snd_hurt1, 1);
    audio_sound_gain(snd_impact, 1, 0);
    audio_sound_pitch(snd_impact, 1);
    audio_sound_gain(snd_impact_bc, 1, 0);
    audio_sound_pitch(snd_impact_bc, 1);
    audio_sound_gain(snd_impending_cut, 1, 0);
    audio_sound_pitch(snd_impending_cut, 1);
    audio_sound_gain(snd_item, 1, 0);
    audio_sound_pitch(snd_item, 1);
    audio_sound_gain(snd_jump_bc, 1, 0);
    audio_sound_pitch(snd_jump_bc, 1);
    audio_sound_gain(snd_kreid, 1, 0);
    audio_sound_pitch(snd_kreid, 1);
    audio_sound_gain(snd_kreid_1, 1, 0);
    audio_sound_pitch(snd_kreid_1, 1);
    audio_sound_gain(snd_laugh, 1, 0);
    audio_sound_pitch(snd_laugh, 1);
    audio_sound_gain(snd_laz, 1, 0);
    audio_sound_pitch(snd_laz, 1);
    audio_sound_gain(snd_leave, 1, 0);
    audio_sound_pitch(snd_leave, 1);
    audio_sound_gain(snd_lilhit, 1, 0);
    audio_sound_pitch(snd_lilhit, 1);
    audio_sound_gain(snd_locker, 1, 0);
    audio_sound_pitch(snd_locker, 1);
    audio_sound_gain(snd_menumove, 1, 0);
    audio_sound_pitch(snd_menumove, 1);
    audio_sound_gain(snd_mercyadd, 1, 0);
    audio_sound_pitch(snd_mercyadd, 1);
    audio_sound_gain(snd_metalhit_bc, 1, 0);
    audio_sound_pitch(snd_metalhit_bc, 1);
    audio_sound_gain(snd_mike, 1, 0);
    audio_sound_pitch(snd_mike, 1);
    audio_sound_gain(snd_noise, 1, 0);
    audio_sound_pitch(snd_noise, 1);
    audio_sound_gain(snd_pacify, 1, 0);
    audio_sound_pitch(snd_pacify, 1);
    audio_sound_gain(snd_paperrise, 1, 0);
    audio_sound_pitch(snd_paperrise, 1);
    audio_sound_gain(snd_plane_ambience, 1, 0);
    audio_sound_pitch(snd_plane_ambience, 1);
    audio_sound_gain(snd_power, 1, 0);
    audio_sound_pitch(snd_power, 1);
    audio_sound_gain(snd_primflower_sfx, 1, 0);
    audio_sound_pitch(snd_primflower_sfx, 1);
    audio_sound_gain(snd_pullback, 1, 0);
    audio_sound_pitch(snd_pullback, 1);
    audio_sound_gain(snd_ralsei, 1, 0);
    audio_sound_pitch(snd_ralsei, 1);
    audio_sound_gain(snd_ralsei_yell, 1, 0);
    audio_sound_pitch(snd_ralsei_yell, 1);
    audio_sound_gain(snd_realization, 1, 0);
    audio_sound_pitch(snd_realization, 1);
    audio_sound_gain(snd_respawnaudio, 1, 0);
    audio_sound_pitch(snd_respawnaudio, 1);
    audio_sound_gain(snd_rocket_long, 1, 0);
    audio_sound_pitch(snd_rocket_long, 1);
    audio_sound_gain(snd_rudebuster_hit, 1, 0);
    audio_sound_pitch(snd_rudebuster_hit, 1);
    audio_sound_gain(snd_rudebuster_swing, 1, 0);
    audio_sound_pitch(snd_rudebuster_swing, 1);
    audio_sound_gain(snd_rumble, 1, 0);
    audio_sound_pitch(snd_rumble, 1);
    audio_sound_gain(snd_screenglitch, 1, 0);
    audio_sound_pitch(snd_screenglitch, 1);
    audio_sound_gain(snd_screenshake, 1, 0);
    audio_sound_pitch(snd_screenshake, 1);
    audio_sound_gain(snd_scytheburst, 1, 0);
    audio_sound_pitch(snd_scytheburst, 1);
    audio_sound_gain(snd_scytheburst_bc, 1, 0);
    audio_sound_pitch(snd_scytheburst_bc, 1);
    audio_sound_gain(snd_select, 1, 0);
    audio_sound_pitch(snd_select, 1);
    audio_sound_gain(snd_smallswing, 1, 0);
    audio_sound_pitch(snd_smallswing, 1);
    audio_sound_gain(snd_soulstab, 1, 0);
    audio_sound_pitch(snd_soulstab, 1);
    audio_sound_gain(snd_spare, 1, 0);
    audio_sound_pitch(snd_spare, 1);
    audio_sound_gain(snd_spearrise, 1, 0);
    audio_sound_pitch(snd_spearrise, 1);
    audio_sound_gain(snd_spellcure, 1, 0);
    audio_sound_pitch(snd_spellcure, 1);
    audio_sound_gain(snd_spellcure_reverse, 1, 0);
    audio_sound_pitch(snd_spellcure_reverse, 1);
    audio_sound_gain(snd_staticbrief, 1, 0);
    audio_sound_pitch(snd_staticbrief, 1);
    audio_sound_gain(snd_susie, 1, 0);
    audio_sound_pitch(snd_susie, 1);
    audio_sound_gain(snd_swing, 1, 0);
    audio_sound_pitch(snd_swing, 1);
    audio_sound_gain(snd_tenna, 1, 0);
    audio_sound_pitch(snd_tenna, 1);
    audio_sound_gain(snd_text, 1, 0);
    audio_sound_pitch(snd_text, 1);
    audio_sound_gain(snd_thunder, 1, 0);
    audio_sound_pitch(snd_thunder, 1);
    audio_sound_gain(snd_ultraswing, 1, 0);
    audio_sound_pitch(snd_ultraswing, 1);
    audio_sound_gain(snd_undynestep, 1, 0);
    audio_sound_pitch(snd_undynestep, 1);
    audio_sound_gain(snd_weaponpull, 1, 0);
    audio_sound_pitch(snd_weaponpull, 1);
    audio_sound_gain(snd_weaponpull_fast, 1, 0);
    audio_sound_pitch(snd_weaponpull_fast, 1);
    audio_sound_gain(snd_whistle, 1, 0);
    audio_sound_pitch(snd_whistle, 1);
    audio_sound_gain(snd_wing, 1, 0);
    audio_sound_pitch(snd_wing, 1);
    audio_stop_all();
    
    if (restart1 && restart2)
        room_restart();
    
    allaway = false;
}
