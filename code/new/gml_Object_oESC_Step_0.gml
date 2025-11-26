var advance = keyboard_check(vk_escape);

if (advance)
    timer++;
else
    timer--;

timer = clamp(timer, -30, 1);

if (timer >= 0)
    triggered = true;

if (triggered)
{
    audio_bus_main.effects[0] = undefined;
    
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
    
    audio_sound_gain(mus_ch3_credits, 1, 0);
    audio_sound_pitch(mus_ch3_credits, 1);
    audio_sound_gain(mus_man_ragtime, 1, 0);
    audio_sound_pitch(mus_man_ragtime, 1);
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
    
    if (!debugroom)
        room_goto(rLambdaruneLogo);
    else
        room_goto(rm_ch3_debug);
    
    audio_stop_all();
    instance_destroy();
}
