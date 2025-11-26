e0timer++;

if (e0timer == 40)
{
    if (!instance_exists(obj_foane_attackcheck))
    {
        talking = true;
    }
    else
    {
        dialogue = start2;
        talking = true;
    }
}

if (e1trigger)
{
    e1timer++;
    
    if (e1timer == 0)
    {
        obj_foane_ex_end.sprite_index = spr_foane_ex_laugh_3;
        obj_foane_ex_end.image_speed = 1;
        audio_play_sound(snd_foane_laugh, 1, false, 0.6);
    }
    
    if (e1timer == 40)
    {
        window_set_caption("Connection Terminated");
        audio_stop_sound(snd_foane_laugh);
        audio_play_sound(mus_sfx_glitch, 1, false, 1, false, 1);
        obj_foane_ex_end.image_index = 0;
        obj_foane_ex_end.floatmultiplier = 0.5;
        obj_foane_ex_end.sprite_index = spr_foane_ex_end;
        obj_foane_background_final.subimgspeed = 0;
        obj_foane_background_final.antialpha = -2;
        obj_foane_background_final.multiplier = 0;
        obj_foane_background_final.endalpha = 0.5;
    }
    
    switch (e1timer)
    {
        case 40:
            obj_foane_ex_end.xoffset = 6;
            break;
        case 41:
            obj_foane_ex_end.xoffset = -4;
            break;
        case 42:
            obj_foane_ex_end.xoffset = 3;
            break;
        case 43:
            obj_foane_ex_end.xoffset = -2;
            break;
        case 44:
            obj_foane_ex_end.xoffset = 1;
            break;
        case 45:
            obj_foane_ex_end.xoffset = 0;
            break;
    }
    
    if (e1timer == 75)
    {
        reset_dialogue_normal();
        dialogue = 8;
        talking = true;
    }
}

if (e2trigger)
{
    e2timer++;
    
    if (e2timer == 0)
    {
        obj_foane_ex_end.floatmultiplier = 0.5;
        obj_foane_ex_end.image_index = 0;
        obj_foane_ex_end.sprite_index = spr_foane_ex_end;
        window_set_caption("Connection Terminated");
        audio_play_sound(mus_sfx_glitch, 1, false, 1, false, 1);
        obj_foane_background_final.subimgspeed = 0;
        obj_foane_background_final.antialpha = -0.5;
        obj_foane_background_final.multiplier = 0;
        obj_foane_background_final.endalpha = 0.5;
    }
    
    switch (e2timer)
    {
        case 0:
            obj_foane_ex_end.xoffset = 6;
            break;
        case 1:
            obj_foane_ex_end.xoffset = -4;
            break;
        case 2:
            obj_foane_ex_end.xoffset = 3;
            break;
        case 3:
            obj_foane_ex_end.xoffset = -2;
            break;
        case 4:
            obj_foane_ex_end.xoffset = 1;
            break;
        case 5:
            obj_foane_ex_end.xoffset = 0;
            break;
    }
    
    if (e2timer == 60)
    {
        reset_dialogue_normal();
        dialogue = 18;
        talking = true;
    }
}

if (e3trigger)
{
    e3timer++;
    
    switch (e3timer)
    {
        case 40:
            obj_foane_ex_end.sprite_index = spr_foane_ex_end_1;
            audio_play_sound(snd_bump, 1, false);
            obj_foane_ex_end.xoffset = 6;
            break;
        case 41:
            obj_foane_ex_end.xoffset = -3;
            break;
        case 42:
            obj_foane_ex_end.xoffset = 2;
            break;
        case 43:
            obj_foane_ex_end.xoffset = -1;
            break;
        case 44:
            obj_foane_ex_end.xoffset = 1;
            break;
        case 45:
            obj_foane_ex_end.xoffset = 0;
            break;
    }
    
    if (e3timer == 80)
    {
        reset_dialogue_normal();
        dialogue = 11;
        talking = true;
    }
}

if (e4trigger)
{
    e4timer++;
    
    switch (e4timer)
    {
        case 20:
            obj_foane_ex_end.sprite_index = spr_foane_ex_end_1;
            audio_play_sound(snd_bump, 1, false);
            obj_foane_ex_end.xoffset = 6;
            break;
        case 21:
            obj_foane_ex_end.xoffset = -3;
            break;
        case 22:
            obj_foane_ex_end.xoffset = 2;
            break;
        case 23:
            obj_foane_ex_end.xoffset = -1;
            break;
        case 24:
            obj_foane_ex_end.xoffset = 1;
            break;
        case 25:
            obj_foane_ex_end.xoffset = 0;
            break;
    }
    
    if (e4timer == 60)
    {
        reset_dialogue_normal();
        dialogue = 20;
        talking = true;
    }
}

if (e5trigger)
    e5timer++;

if (e6trigger)
{
    e6timer++;
    
    if (e6timer == 0)
        instance_create_depth(320, 240, -500, obj_menu_SOUL);
}

if (e7trigger)
    e7timer++;

if (e8trigger)
{
    e8timer++;
    
    if (e8timer == 0)
        instance_create_depth(460, 346, -640, obj_shine_ch3);
}

if (e9trigger)
    e9timer++;

if (e10trigger)
{
    e10timer++;
    
    if (e10timer == 0)
        obj_foane_ex_aftermath.flashtrigger = true;
}

if (e11trigger)
{
    e11timer++;
    
    if (e11timer == 60)
        obj_ralsei_sof_end.sprite_index = sRalseiWalkDownUpset;
    
    if (e11timer == 90)
    {
        reset_dialogue_normal();
        dialogue = 58;
        talking = true;
    }
}

if (d59trigger)
{
    d59timer++;
    
    if (d59timer == 0)
    {
        obj_susie_sof_end.sprite_index = sSusieWalkLeftUpset;
        obj_susie_sof_end.image_index = 1;
        obj_susie_sof_end.speed = -6;
    }
    
    if (d59timer == 8)
    {
        obj_susie_sof_end.image_speed = 0;
        obj_susie_sof_end.image_index = 0;
        obj_susie_sof_end.speed = 0;
    }
}

if (e12trigger)
{
    e12timer++;
    
    if (e12timer == 0)
    {
        obj_susie_sof_end.sprite_index = sSusieWalkRightUpset;
        obj_susie_sof_end.image_speed = 1;
        obj_susie_sof_end.speed = 6;
        obj_susie_sof_end.direction = -45;
    }
    
    if (e12timer == 4)
        obj_susie_sof_end.direction = 0;
    
    if (obj_susie_sof_end.x >= obj_kris_sof_end.x)
        obj_kris_sof_end.sprite_index = sKrisWalkRight;
    
    if (e12timer == 120)
    {
        reset_dialogue_normal();
        dialogue = 64;
        talking = true;
        e12trigger = false;
    }
}

if (e13trigger)
{
    e13timer++;
    obj_kris_sof_end.image_speed = 0.6;
    obj_kris_sof_end.sprite_index = sKrisWalkRight;
    obj_kris_sof_end.speed = 4;
    
    if (e13timer == 0)
        instance_create_depth(320, 240, -1600, obj_blackscreen_fadein);
    
    if (e13timer >= 0)
        obj_blackscreen_fadein.image_alpha += 0.0125;
    
    if (e13timer == 110)
    {
        oPersistent.androidsavetimer = -1;
        
        if (!global.c3signalcompleted)
        {
            instance_create_depth(0, 0, -59, obj_memorandum_notice_c3);
            obj_memorandum_notice_c3.image_index = 7;
            global.c3signalcompleted = true;
        }
        
        if (instance_exists(obj_foane_attackcheck))
            instance_destroy(obj_foane_attackcheck);
        
        room_goto(rLambdaruneLogoToC3);
    }
}

if (e14trigger)
    e14timer++;

if (e15trigger)
{
    e15timer++;
    
    switch (e15timer)
    {
        case 0:
            obj_foane_ex_end.xoffset = 6;
            break;
        case 2:
            obj_foane_ex_end.xoffset = -4;
            break;
        case 4:
            obj_foane_ex_end.xoffset = 3;
            break;
        case 6:
            obj_foane_ex_end.xoffset = -2;
            break;
        case 8:
            obj_foane_ex_end.xoffset = 1;
            break;
        case 10:
            obj_foane_ex_end.xoffset = 0;
            break;
    }
    
    if (e15timer == 0)
    {
        obj_foane_ex_end.floatmultiplier = 0;
        obj_foane_ex_end.off = true;
        obj_foane_ex_end.image_index = 0;
        audio_play_sound(snd_noise_reverb, 1, false);
        audio_play_sound(snd_phone_dying, 1, false, 0.3, false, 0.8);
    }
    
    if (e15timer == 55)
    {
        var b1 = instance_create_depth(320, 240, -5000, obj_ch3_blackscreen_custom);
        b1.image_alpha = 0;
    }
    
    if (e15timer >= 18 && e15timer <= 130)
        obj_foane_ex_end.falltrigger = true;
    
    if (e15timer == 130)
        audio_play_sound(snd_closet_impact, 1, false, 1.2, false, 0.85);
    
    if (e15timer >= 55 && e15timer <= 225 && instance_exists(obj_ch3_blackscreen_custom))
    {
        obj_ch3_blackscreen_custom.image_alpha += 0.02;
    }
    else if (instance_exists(obj_ch3_blackscreen_custom))
    {
        if (instance_exists(obj_foane_ex_end))
            instance_destroy(obj_foane_ex_end);
        
        if (instance_exists(obj_foane_background))
            instance_destroy(obj_foane_background);
        
        if (instance_exists(obj_foane_background_overlay_end))
            instance_destroy(obj_foane_background_overlay_end);
        
        if (instance_exists(obj_pylon))
            instance_destroy(obj_pylon);
        
        if (instance_exists(obj_kris_sof))
            instance_destroy(obj_kris_sof);
        
        if (instance_exists(obj_susie_sof))
            instance_destroy(obj_susie_sof);
        
        if (instance_exists(obj_ralsei_sof))
            instance_destroy(obj_ralsei_sof);
        
        window_set_caption("");
        obj_kris_sof_end.image_alpha = 1;
        obj_susie_sof_end.image_alpha = 1;
        obj_ralsei_sof_end.image_alpha = 1;
        obj_foane_ex_aftermath.image_alpha = 1;
        obj_ch3_blackscreen_custom.image_alpha -= 0.02857142857142857;
    }
    
    if (e15timer == 370)
    {
        dialoguetop = true;
        dialoguebottom = false;
        reset_dialogue_normal();
        dialogue = 23;
        talking = true;
    }
}

if (e16trigger)
    e16timer++;

if (e17trigger)
    e17timer++;

if (e18trigger)
    e18timer++;

if (e19trigger)
    e19timer++;

if (e20trigger)
    e20timer++;
