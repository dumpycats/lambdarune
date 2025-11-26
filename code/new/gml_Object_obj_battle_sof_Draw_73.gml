var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]) + entireyoffset;

if (instance_exists(self))
{
    if (krisdown && susiedown && ralseidown)
    {
        global.alldown = true;
        audio_stop_sound(mus_harmonious_foane);
        audio_stop_sound(mus_foanebattle_old);
        audio_stop_sound(mus_exstatic_resonance);
        audio_group_stop_all(AUDIO_APPEARANCE);
        inputtimer = -2;
    }
}

if (global.krishp <= 0)
{
    krisdown = true;
    PARTYMEMBER1.sprite_index = spr_kris_downed;
}
else
{
    krisdown = false;
}

if (global.susiehp <= 0)
{
    susiedown = true;
    PARTYMEMBER2.sprite_index = spr_susie_downed;
}
else
{
    susiedown = false;
}

if (global.ralseihp <= 0)
{
    ralseidown = true;
    PARTYMEMBER3.sprite_index = spr_ralsei_downed;
}
else
{
    ralseidown = false;
}

generaltimer++;
var left, right, up, down, advance, revert;

if (inputtimer >= 0)
{
    left = keyboard_check_pressed(vk_left);
    right = keyboard_check_pressed(vk_right);
    up = keyboard_check_pressed(vk_up);
    down = keyboard_check_pressed(vk_down);
    advance = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    revert = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
}
else
{
    left = 0;
    right = 0;
    up = 0;
    down = 0;
    advance = 0;
    revert = 0;
}

if (left || right || up || down || advance || revert)
{
    inputtimer = -2;
    
    if (advance)
    {
        left = 0;
        right = 0;
        up = 0;
        down = 0;
        revert = 0;
    }
}

inputtimer++;

if (susiemagic)
{
}

if (global.enemyhp <= 0 || global.mercy >= 100)
{
    if (global.enemyhp <= 0 && !instance_exists(obj_foane_attackcheck))
        instance_create_depth(0, 0, 0, obj_foane_attackcheck);
}

if (global.finaltalk)
{
    finaltalktimer++;
    finaltalktimerdelta += 1;
    
    if (finaltalktimerdelta == 0)
    {
        ENEMY1.hit = true;
        ENEMY1.hittimer = -1;
        ENEMY1.image_speed = 1;
        ENEMY1.sprite_index = spr_foane_ex_laugh_3;
        audio_play_sound(mus_exstatic_resonance, 6, false);
    }
    
    if (finaltalktimerdelta == 55)
    {
        ENEMY1.sprite_index = spr_foane_ex_idle;
        enemydialogue = -5;
        reset_dialogue_normal();
    }
    
    if (finaltalktimerdelta == 165)
    {
        enemydialogue = -4;
        reset_dialogue_normal();
    }
    
    if (finaltalktimerdelta == 280)
    {
        enemydialogue = -3;
        reset_dialogue_normal();
    }
    
    if (finaltalktimerdelta == 385)
    {
        enemydialogue = -2;
        reset_dialogue_normal();
    }
    
    if (finaltalktimerdelta >= 443 && finaltalktimerdelta <= 459)
    {
        if (!finallaugh)
        {
            window_set_caption(lang("obj_battle_sof_Draw_73_0"));
            obj_tpbar.leftout = true;
            audio_play_sound(snd_laugh_resonance, 1, false, 1.6);
            textenemy = false;
            ENEMY1.sprite_index = spr_foane_ex_laugh_3;
            ENEMY1.image_speed = 1;
            ENEMY1.smallshake = true;
            ENEMY1.smallshaketimer = -1;
            finallaugh = true;
        }
    }
    
    if (finaltalktimerdelta >= 443 && finaltalktimerdelta <= 480)
    {
        textenemy = false;
        percentydown++;
        pos_y = cy + 240;
        pos_y2 = cy + 272;
        pos_ys = cy + 240;
        pos_y2s = cy + 272;
        pos_yr = cy + 240;
        pos_y2r = cy + 272;
        
        if (percentydown <= 12)
        {
            var positiondown = animcurve_channel_evaluate(curvelinear, percentydown / 12);
            entireyoffset = lerp(0, 160, positiondown);
        }
        
        percentextra++;
        var positionsoul = animcurve_channel_evaluate(curveease, percentextra / 20);
        obj_foane_background_final.SOULx = round(lerp(obj_foane_background_final.SOULx, 339, positionsoul));
    }
    
    if (finaltalktimerdelta == 477)
        global.enemyturn = true;
    
    if (finaltalktimer == 1470)
    {
        window_set_caption(lang("obj_battle_sof_Draw_73_1"));
        room_goto(rm_ch3_foaneend);
        
        if (global.nohit)
            global.c3foanenohit = true;
    }
}

if (!global.harmonizing)
    global.harmonyfrequency += 800;

global.harmonyfrequency = clamp(global.harmonyfrequency, 700, 22050);

if (turnrefresh)
{
    if (global.tp == 100)
        tpmax = true;
    
    if (global.harmonized)
    {
        instance_create_depth(ENEMY1.x, ENEMY1.y - 30, ENEMY1.depth - 3, obj_mercynumber);
        obj_mercynumber.value = lang("obj_battle_sof_Draw_73_2");
        global.mercy += 20;
        global.harmonized = false;
        audio_play_sound(snd_mercyadd, 1, false);
    }
    
    if (krisdown || susiedown || ralseidown)
        finalrequirement = false;
    else if ((global.harmonyphase >= 4 && !krisdown && !susiedown && !ralseidown && global.tp >= 100) || global.enemyhp <= 400)
        finalrequirement = true;
    
    if (global.harmonyphase > 4)
    {
        global.endofbattle = true;
        ENEMY1.flashalpha = 0;
    }
    else
    {
        krisdefending = false;
        susiedefending = false;
        ralseidefending = false;
        krisdefend = false;
        krismercy = false;
        krisitem = false;
        krisselected = false;
        krisactselected = false;
        krisbattleicon = 0;
        susiedefend = false;
        susiemercy = false;
        susieitem = false;
        susiemagic = false;
        susieselected = false;
        susieactselected = false;
        susiebattleicon = 0;
        PARTYMEMBER2.specialrude = false;
        PARTYMEMBER2.rudebuster = false;
        PARTYMEMBER2.bustertriggered = false;
        PARTYMEMBER2.rudetimer = -1;
        PARTYMEMBER2.bustertimer = -1;
        ralseidefend = false;
        ralseimercy = false;
        ralseiitem = false;
        ralseiselected = false;
        ralseiactselected = false;
        ralseimagicselected = false;
        ralseimagic = false;
        ralseibattleicon = 0;
        itemsection = 0;
        itemcolumns = 0;
        itemrows = 0;
        healmenu = false;
        healoption = 0;
        flashresettimer = -1;
        
        if (global.krishp >= -20)
            krismenuaccessible = true;
        else if (!susiedown)
            susiemenuaccessible = true;
        else if (!ralseidown)
            ralseimenuaccessible = true;
        
        if (!krisdown)
        {
            PARTYMEMBER1.sprite_index = spr_kris_idle;
            PARTYMEMBER1.image_speed = 1;
        }
        else
        {
            var greenhpk = instance_create_depth(PARTYMEMBER1.x - 6, PARTYMEMBER1.y - 6, PARTYMEMBER1.depth - 6, obj_damage);
            greenhpk.image_blend = c_lime;
            greenhpk.value = 20;
            
            if ((20 + global.krishp) > 0 && global.krishp <= 0)
                greenhpk.up = true;
            
            global.krishp += 20;
        }
        
        if (!susiedown)
        {
            PARTYMEMBER2.sprite_index = spr_susie_idle;
            PARTYMEMBER2.image_speed = 1;
        }
        else
        {
            var greenhps = instance_create_depth(PARTYMEMBER2.x - 6, PARTYMEMBER2.y - 6, PARTYMEMBER2.depth - 6, obj_damage);
            greenhps.image_blend = c_lime;
            greenhps.value = 20;
            
            if ((20 + global.susiehp) > 0 && global.susiehp <= 0)
                greenhps.up = true;
            
            global.susiehp += 20;
        }
        
        if (!ralseidown)
        {
            PARTYMEMBER3.sprite_index = spr_ralsei_idle;
            PARTYMEMBER3.image_speed = 1;
        }
        else
        {
            var greenhpr = instance_create_depth(PARTYMEMBER3.x - 6, PARTYMEMBER3.y - 6, PARTYMEMBER3.depth - 6, obj_damage);
            greenhpr.image_blend = c_lime;
            greenhpr.value = 20;
            
            if ((20 + global.ralseihp) > 0 && global.ralseihp <= 0)
                greenhpr.up = true;
            
            global.ralseihp += 20;
        }
        
        if (krisdown)
            audio_play_sound(snd_power, 1, false);
        else if (susiedown)
            audio_play_sound(snd_power, 1, false);
        else if (ralseidown)
            audio_play_sound(snd_power, 1, false);
        
        randompick = irandom_range(1, 9);
        krismenuoptions = 1;
        krisactoptions = 0;
        krisitemtimer = -1;
        susiemenuoptions = 1;
        susieactoptions = 0;
        susieitemtimer = -1;
        ralseimenuoptions = 1;
        ralseiactoptions = 0;
        ralseiitemtimer = -1;
        itemsection = 0;
        itemcolumns = 0;
        itemrows = 0;
        reset_dialogue_normal();
        turnrefresh = false;
    }
}

if (ralseiswitch)
{
    ralseiprogress = true;
    progressfinal = true;
    ralseiswitch = false;
}

if (susieswitch)
{
    susieprogress = true;
    
    if (!ralseidown)
        ralseimenuaccessible = true;
    else
        progressfinal = true;
    
    susieswitch = false;
}

if (krisswitch)
{
    turnprogress = true;
    
    if (!susiedown)
        susiemenuaccessible = true;
    else if (!ralseidown)
        ralseimenuaccessible = true;
    else
        progressfinal = true;
    
    krisswitch = false;
}

if (susiedeswitch)
{
    susiemenuaccessible = false;
    krismenuaccessible = true;
    krisactoptions = 0;
    krisitemtimer = -1;
    itemsection = 0;
    itemcolumns = 0;
    itemrows = 0;
    
    if (krisdefend)
    {
        krisdefend = false;
        krisdefending = false;
        
        if (!tpmax)
            global.tp -= 16;
    }
    
    krisfight = false;
    krisacting = false;
    krismercy = false;
    healmenu = false;
    
    if (krisitem)
    {
        krisitem = false;
        advancecounter--;
        var i = array_length(itemlist) - 1;
        
        while (i > last_used_indexk)
        {
            itemlist[i] = itemlist[i - 1];
            i--;
        }
        
        itemlist[last_used_indexk] = used_itemk;
    }
    
    krisselected = false;
    krisactselected = false;
    krisbattleicon = 0;
    PARTYMEMBER1.image_speed = 1;
    PARTYMEMBER1.sprite_index = spr_kris_idle;
    susiedeswitch = false;
}

if (ralseideswitch)
{
    ralseimenuaccessible = false;
    
    if (!susiedown)
    {
        susiemenuaccessible = true;
        
        if (susiedefend)
        {
            susiedefend = false;
            susiedefending = false;
            
            if (!tpmax)
                global.tp -= 16;
        }
        
        susieitemtimer = -1;
        itemsection = 0;
        itemcolumns = 0;
        itemrows = 0;
        susiefight = false;
        susieacting = false;
        susiemercy = false;
        healmenu = false;
        
        if (susieitem)
        {
            susieitem = false;
            advancecounter--;
            var i = array_length(itemlist) - 1;
            
            while (i > last_used_indexs)
            {
                itemlist[i] = itemlist[i - 1];
                i--;
            }
            
            itemlist[last_used_indexs] = used_items;
        }
        
        if (susiemagic)
        {
            susiemagic = false;
            
            if (susieactoptions == 0)
            {
                global.tp += 50;
            }
            else if (susieactoptions == 1)
            {
                global.tp += 84;
                susieactoptions = 0;
            }
        }
        
        susieselected = false;
        susieactselected = false;
        susiebattleicon = 0;
        PARTYMEMBER2.image_speed = 1;
        PARTYMEMBER2.sprite_index = spr_susie_idle;
    }
    else
    {
        krismenuaccessible = true;
        krisactoptions = 0;
        krisitemtimer = -1;
        itemsection = 0;
        itemcolumns = 0;
        itemrows = 0;
        
        if (krisdefend)
        {
            krisdefend = false;
            krisdefending = false;
            global.tp -= 16;
        }
        
        krisfight = false;
        krisacting = false;
        krismercy = false;
        healmenu = false;
        
        if (krisitem)
        {
            krisitem = false;
            advancecounter--;
            var i = array_length(itemlist) - 1;
            
            while (i > last_used_indexk)
            {
                itemlist[i] = itemlist[i - 1];
                i--;
            }
            
            itemlist[last_used_indexk] = used_itemk;
        }
        
        krisselected = false;
        krisactselected = false;
        krisbattleicon = 0;
        PARTYMEMBER1.image_speed = 1;
        PARTYMEMBER1.sprite_index = spr_kris_idle;
    }
    
    ralseideswitch = false;
}

if (turnprogress)
{
    flashpercent = 0;
    ENEMY1.flashalpha = 0;
    
    if (krisdefending)
    {
        krisdefend = true;
        PARTYMEMBER1.image_index = 0;
        PARTYMEMBER1.image_speed = 1;
        PARTYMEMBER1.sprite_index = spr_kris_defend;
        global.tp += 16;
        krisselected = false;
        krismenuaccessible = false;
        krisbattleicon = 5;
    }
    else if (krisacting)
    {
        PARTYMEMBER1.image_index = 0;
        PARTYMEMBER1.image_speed = 0;
        PARTYMEMBER1.sprite_index = spr_kris_act;
    }
    else if (krismercy)
    {
        PARTYMEMBER1.sprite_index = spr_kris_idle;
    }
    else if (krisitem)
    {
        healmenu = false;
        PARTYMEMBER1.image_index = 0;
        PARTYMEMBER1.image_speed = 0;
        PARTYMEMBER1.sprite_index = spr_kris_item;
    }
    else if (krisfight)
    {
        PARTYMEMBER1.sprite_index = spr_kris_fight;
        PARTYMEMBER1.image_speed = 0;
        PARTYMEMBER1.image_index = 0;
    }
    
    turnprogress = false;
}

if (susieprogress)
{
    flashpercent = 0;
    ENEMY1.flashalpha = 0;
    
    if (susiedefending)
    {
        susiedefend = true;
        PARTYMEMBER2.image_index = 0;
        PARTYMEMBER2.image_speed = 1;
        PARTYMEMBER2.sprite_index = spr_susie_defend;
        global.tp += 16;
        susieselected = false;
        susiemenuaccessible = false;
        susiebattleicon = 5;
    }
    else if (susieacting)
    {
        PARTYMEMBER2.image_index = 0;
        PARTYMEMBER2.image_speed = 0;
        PARTYMEMBER2.sprite_index = spr_susie_act;
    }
    else if (susiemercy)
    {
        PARTYMEMBER2.sprite_index = spr_susie_idle;
    }
    else if (susieitem)
    {
        healmenu = false;
        PARTYMEMBER2.image_index = 0;
        PARTYMEMBER2.image_speed = 0;
        PARTYMEMBER2.sprite_index = spr_susie_item_prepare;
    }
    else if (susiemagic)
    {
        PARTYMEMBER2.sprite_index = spr_susie_magic;
    }
    else if (susiefight)
    {
        PARTYMEMBER2.sprite_index = spr_susie_attack_prepare;
        PARTYMEMBER2.image_speed = 0;
        PARTYMEMBER2.image_index = 0;
    }
    
    susieprogress = false;
}

if (ralseiprogress)
{
    flashpercent = 0;
    ENEMY1.flashalpha = 0;
    
    if (ralseidefending)
    {
        ralseidefend = true;
        PARTYMEMBER3.image_index = 0;
        PARTYMEMBER3.image_speed = 1;
        PARTYMEMBER3.sprite_index = spr_ralsei_defend;
        global.tp += 16;
        ralseiselected = false;
        ralseimenuaccessible = false;
        ralseibattleicon = 5;
    }
    else if (ralseiacting)
    {
        PARTYMEMBER3.image_index = 0;
        PARTYMEMBER3.image_speed = 0;
        PARTYMEMBER3.sprite_index = spr_ralsei_act;
    }
    else if (ralseimercy)
    {
        PARTYMEMBER3.sprite_index = spr_ralsei_idle;
    }
    else if (ralseiitem)
    {
        healmenu = false;
        PARTYMEMBER3.image_index = 0;
        PARTYMEMBER3.image_speed = 0;
        PARTYMEMBER3.sprite_index = spr_ralsei_item_prepare;
    }
    else if (ralseimagic)
    {
        PARTYMEMBER3.sprite_index = spr_ralsei_magic_prepare;
        PARTYMEMBER3.image_speed = 1;
        PARTYMEMBER3.image_index = 0;
    }
    else if (ralseifight)
    {
        PARTYMEMBER3.sprite_index = spr_ralsei_attack;
        PARTYMEMBER3.image_speed = 0;
        PARTYMEMBER3.image_index = 0;
    }
    
    ralseiprogress = false;
}

if (progressfinal)
{
    skiptext = false;
    skiptimer = 0;
    flashpercent = 0;
    ENEMY1.sprite_index = ENEMY1.MAINSPRITE;
    
    if (krisdefending)
        krisdefending = false;
    
    if (susieactoptions == 0 && jammed)
        PARTYMEMBER2.specialrude = true;
    
    textxoffset = -34;
    textyoffset = -120;
    tpmax = false;
    
    if (krisacting)
    {
        textmenu = false;
        textact = true;
        ACTNAME = lang("obj_battle_sof_Draw_73_3");
        actdialogue = 1;
        PARTYMEMBER1.image_speed = 1;
        reset_dialogue_normal();
    }
    else if (global.mercy >= 100 || global.enemyhp <= 0)
    {
        global.endofbattle = true;
        ENEMY1.flashalpha = 0;
    }
    else if (susieacting)
    {
        textmenu = false;
        textact = true;
        ACTNAME = lang("obj_battle_sof_Draw_73_4");
        actdialogue = 1;
        PARTYMEMBER2.image_speed = 1;
        PARTYMEMBER2.sprite_index = spr_susie_act;
        reset_dialogue_normal();
    }
    else if (krismercy)
    {
        textmenu = false;
        textact = true;
        ACTNAME = lang("obj_battle_sof_Draw_73_5");
        PARTYMEMBER1.sprite_index = spr_kris_act;
        PARTYMEMBER1.image_index = 0;
        PARTYMEMBER1.image_speed = 1;
        reset_dialogue_normal();
    }
    else if (susiemercy)
    {
        textmenu = false;
        textact = true;
        ACTNAME = lang("obj_battle_sof_Draw_73_6");
        PARTYMEMBER2.sprite_index = spr_susie_act;
        PARTYMEMBER2.image_index = 0;
        PARTYMEMBER2.image_speed = 1;
        reset_dialogue_normal();
    }
    else if (ralseimercy)
    {
        textmenu = false;
        textact = true;
        ACTNAME = lang("obj_battle_sof_Draw_73_7");
        PARTYMEMBER3.sprite_index = spr_ralsei_act;
        PARTYMEMBER3.image_index = 0;
        PARTYMEMBER3.image_speed = 1;
        reset_dialogue_normal();
    }
    else if (krisitem)
    {
        PARTYMEMBER1.image_speed = 1;
        textmenu = false;
        textact = true;
        ACTNAME = lang("obj_battle_sof_Draw_73_8");
        reset_dialogue_normal();
    }
    else if (susieitem)
    {
        PARTYMEMBER2.image_speed = 1;
        PARTYMEMBER2.sprite_index = spr_susie_item;
        textmenu = false;
        textact = true;
        ACTNAME = lang("obj_battle_sof_Draw_73_9");
        reset_dialogue_normal();
    }
    else if (ralseiitem)
    {
        PARTYMEMBER3.image_speed = 1;
        PARTYMEMBER3.sprite_index = spr_ralsei_item;
        textmenu = false;
        textact = true;
        ACTNAME = lang("obj_battle_sof_Draw_73_10");
        reset_dialogue_normal();
    }
    else if (susiemagic && !(susieactoptions == 0 && jammed))
    {
        ACTNAME = lang("obj_battle_sof_Draw_73_11");
        textmenu = false;
        textact = true;
        PARTYMEMBER2.image_index = 0;
        PARTYMEMBER2.sprite_index = spr_susie_mercy;
        
        if (susieactoptions == 0)
            PARTYMEMBER2.rudebuster = true;
        
        reset_dialogue_normal();
    }
    else if (ralseimagic)
    {
        ACTNAME = lang("obj_battle_sof_Draw_73_12");
        textmenu = false;
        textact = true;
        PARTYMEMBER3.image_index = 0;
        PARTYMEMBER3.sprite_index = spr_ralsei_magic;
        reset_dialogue_normal();
    }
    else if (krisfight || susiefight || ralseifight)
    {
        reset_dialogue_normal();
        textmenu = false;
        
        if (!instance_exists(ATTACK))
        {
            var spawnattack = instance_create_depth(0, 0, depth - 640, ATTACK);
            
            if (jammed)
                spawnattack.nerfmultiplier = 0.1;
            
            if (krisfight)
                spawnattack.kris = true;
            
            if (susiefight)
                spawnattack.susie = true;
            
            if (ralseifight)
                spawnattack.ralsei = true;
            
            spawnattack.krischoice = ENEMY1;
            spawnattack.susiechoice = ENEMY1;
            spawnattack.ralseichoice = ENEMY1;
        }
    }
    else
    {
        textmenu = false;
        textenemy = true;
        reset_dialogue_normal();
    }
    
    if (enemydialogue > 31)
    {
        randomize();
        var randomenemydialogue = irandom_range(0, 4);
        
        switch (randomenemydialogue)
        {
            case 0:
                tennatext = lang("obj_battle_sof_Draw_73_13");
                break;
            case 1:
                tennatext = lang("obj_battle_sof_Draw_73_14");
                break;
            case 2:
                tennatext = lang("obj_battle_sof_Draw_73_15");
                break;
            case 3:
                tennatext = lang("obj_battle_sof_Draw_73_16");
                break;
            case 4:
                tennatext = lang("obj_battle_sof_Draw_73_17");
                break;
        }
    }
    
    if (jammed)
    {
        jamtext = lang("obj_battle_sof_Draw_73_18");
        
        if (!generator1 && !generator2)
        {
            jamphase++;
            jamwait = 0;
            jammed = false;
        }
    }
    else if (global.turn == 3)
    {
        jamtext = lang("obj_battle_sof_Draw_73_19");
    }
    else if (global.turn == 10)
    {
        jamtext = lang("obj_battle_sof_Draw_73_20");
    }
    else if (global.turn == 11)
    {
        jamtext = lang("obj_battle_sof_Draw_73_21");
    }
    else if (jamphase == 0)
    {
        randomize();
        randomtextjam = irandom_range(0, 2);
        
        switch (randomtextjam)
        {
            case 0:
                jamtext = lang("obj_battle_sof_Draw_73_22");
                break;
            case 1:
                jamtext = lang("obj_battle_sof_Draw_73_23");
                break;
            case 2:
                jamtext = lang("obj_battle_sof_Draw_73_24");
                break;
        }
    }
    else if (jamphase == 1)
    {
        randomize();
        randomtextjam = irandom_range(0, 2);
        
        switch (randomtextjam)
        {
            case 0:
                jamtext = lang("obj_battle_sof_Draw_73_25");
                break;
            case 1:
                jamtext = lang("obj_battle_sof_Draw_73_26");
                break;
            case 2:
                jamtext = lang("obj_battle_sof_Draw_73_27");
                break;
        }
    }
    else if (jamphase == 2)
    {
        randomize();
        randomtextjam = irandom_range(0, 2);
        
        switch (randomtextjam)
        {
            case 0:
                jamtext = lang("obj_battle_sof_Draw_73_28");
                break;
            case 1:
                jamtext = lang("obj_battle_sof_Draw_73_29");
                break;
            case 2:
                jamtext = lang("obj_battle_sof_Draw_73_30");
                break;
        }
    }
    else if (jamphase >= 3)
    {
        randomize();
        randomtextjam = irandom_range(0, 3);
        
        switch (randomtextjam)
        {
            case 0:
                jamtext = lang("obj_battle_sof_Draw_73_31");
                break;
            case 1:
                jamtext = lang("obj_battle_sof_Draw_73_32");
                break;
            case 2:
                jamtext = lang("obj_battle_sof_Draw_73_33");
                break;
            case 3:
                jamtext = lang("obj_battle_sof_Draw_73_34");
                break;
        }
    }
    
    progressfinal = false;
}

if (global.battle)
{
    percentblankrise += 0.08333333333333333;
    var position1 = animcurve_channel_evaluate(curveslower, percentblankrise);
    
    if (!battlebegun)
    {
        var delta_riseblank_y = (cy + 240) - (cy + 400);
        pos_y = cy + 400 + (delta_riseblank_y * position1);
        var delta_rise_y = (cy + 240) - (cy + 430);
        pos_y2 = cy + 430 + (delta_rise_y * position1);
    }
    
    if (percentblankrise == 1)
    {
        krismenuaccessible = true;
        battlebegun = true;
    }
}

draw_sprite_ext(spr_battle_blankmenu, 0, cx + 320, pos_y, 1, 1, 0, c_white, 1);

if (!krismenuaccessible && battlebegun)
    draw_sprite_ext(spr_battlemenu, 1, cx + krismenux, pos_y, 1, 1, 0, menucolor, 1);
else
    draw_sprite_ext(spr_battlemenu, 1, cx + krismenux, pos_y, 1, 1, 0, kriscolor, 1);

if (krismenuaccessible && battlebegun)
{
    barsubimg++;
    
    if (barsubimg < 30)
        draw_sprite_ext(spr_opacitybar_beginning, barsubimg, cx + krismenux, pos_y, 1, 1, 0, kriscolor, 1);
    else
        draw_sprite_ext(spr_opacitybar, barsubimg, cx + krismenux, pos_y, 1, 1, 0, kriscolor, 1);
}

if (krismenuaccessible)
    draw_sprite_ext(spr_kris_menuoptions, krismenuoptions, (cx + krismenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);
else if (battlebegun)
    draw_sprite_ext(spr_kris_menuoptions, 0, (cx + krismenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);
else
    draw_sprite_ext(spr_kris_menuoptions, krismenuoptions, (cx + krismenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);

if (!krismenuaccessible && battlebegun)
    draw_sprite_ext(spr_battlemenu, 0, cx + krismenux, pos_y2, 1, 1, 0, menucolor, 1);
else
    draw_sprite_ext(spr_battlemenu, 0, cx + krismenux, pos_y2, 1, 1, 0, kriscolor, 1);

if (!krismenuaccessible && battlebegun)
    draw_sprite_ext(spr_menu_blackbars, 0, cx + krismenux, pos_y, 1, 1, 0, c_white, 1);

draw_set_font(fHP);

if (global.krishp <= 0)
    draw_set_color(c_red);
else if (global.krishp <= (global.krismaxhp / 5))
    draw_set_color(c_yellow);
else
    draw_set_color(c_white);

draw_set_halign(fa_right);
draw_text(cx + krismenux + 53, pos_y2 + 60, global.krishp);
draw_text(cx + krismenux + 98, pos_y2 + 60, global.krismaxhp);
draw_rectangle_color(cx + krismenux + 21, pos_y2 + 75, cx + krismenux + 94, pos_y2 + 83, darkred, darkred, darkred, darkred, 0);

if (global.krishp > 0)
    draw_rectangle_color(cx + krismenux + 21, pos_y2 + 75, cx + krismenux + 21 + (75 / (global.krismaxhp / global.krishp)), pos_y2 + 83, kriscolor, kriscolor, kriscolor, kriscolor, 0);

draw_sprite_ext(spr_kris_battlemenu, krisbattleicon, cx + krismenux, pos_y2, 1, 1, 0, c_white, 1);
draw_set_color(c_white);

if (krismenuaccessible)
{
    global.enemyturn = false;
    soulsubimg = -1;
    
    if (!krisselected)
    {
        flashpercent = 0;
        ENEMY1.flashalpha = 0;
        textmenu = true;
        
        if (right)
        {
            if (krismenuoptions < 5)
                krismenuoptions++;
            else
                krismenuoptions = 1;
            
            audio_play_sound(snd_menumove, 1, false);
        }
        
        if (left)
        {
            if (krismenuoptions > 1)
                krismenuoptions--;
            else
                krismenuoptions = 5;
            
            audio_play_sound(snd_menumove, 1, false);
        }
        
        if (advance)
        {
            audio_play_sound(snd_select, 1, false);
            krisselected = true;
            
            if (krismenuoptions == 5)
            {
                krisdefending = true;
                krisswitch = true;
            }
        }
    }
    else if (krisselected)
    {
        textmenu = false;
        displayed_text = current_dialogue;
        text_complete = true;
        
        if (krismenuoptions == 1 || krismenuoptions == 2 || krismenuoptions == 4)
        {
            if (!krisactselected)
            {
                draw_sprite_ext(spr_SOUL_battle, 0, cx + 63, cy + 393, 1, 1, 0, c_red, 1);
                draw_set_font(fDeterminationSans);
                draw_set_halign(fa_left);
                draw_text(cx + 80, cy + 379, ENEMYNAME);
                draw_text_transformed(cx + 424, cy + 366, lang("obj_battle_sof_Draw_73_35"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, lang("obj_battle_sof_Draw_73_36"), 1, 0.5, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 420 + (80 / (global.enemymaxhp / global.enemyhp)), cy + 395, green, green, green, green, 0);
                draw_rectangle_color(cx + 520, cy + 380, cx + 600, cy + 395, orange, orange, orange, orange, 0);
                
                if (global.mercy > 0)
                    draw_rectangle_color(cx + 520, cy + 380, cx + 520 + (80 / (100 / global.mercy)), cy + 395, c_yellow, c_yellow, c_yellow, c_yellow, 0);
                
                var roundedhp;
                
                if (round((global.enemyhp / global.enemymaxhp) * 100) == 0)
                    roundedhp = 1;
                else
                    roundedhp = round((global.enemyhp / global.enemymaxhp) * 100);
                
                draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + lang("obj_battle_sof_Draw_73_37"), 1, 0.5, 0);
                draw_set_color(darkred);
                draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + lang("obj_battle_sof_Draw_73_38"), 1, 0.5, 0);
                draw_set_color(c_white);
            }
            
            if (krismenuoptions == 1)
            {
                if (!krisactselected)
                {
                    if (advance)
                    {
                        audio_play_sound(snd_select, 1, false);
                        krismenuaccessible = false;
                        krisbattleicon = 1;
                        krisfight = true;
                        krisswitch = true;
                    }
                }
            }
            
            if (krismenuoptions == 2)
            {
                if (!krisactselected)
                {
                    if (advance)
                    {
                        audio_play_sound(snd_select, 1, false);
                        krisactselected = true;
                    }
                }
                else if (krisactselected)
                {
                    draw_set_font(fDeterminationSans);
                    draw_set_halign(fa_left);
                    
                    if (krisactoptions == 0)
                        draw_sprite_ext(spr_SOUL_battle, 0, cx + 18, cy + 393, 1, 1, 0, c_red, 1);
                    
                    if (krisactoptions == 1)
                        draw_sprite_ext(spr_SOUL_battle, 0, cx + 238, cy + 393, 1, 1, 0, c_red, 1);
                    
                    if (advance)
                    {
                        if (krisactoptions == 0)
                        {
                            audio_play_sound(snd_select, 1, false);
                            krisacting = true;
                            krisactselected = false;
                            krisselected = false;
                            krismenuaccessible = false;
                            krisbattleicon = 2;
                            krisswitch = true;
                        }
                        
                        if (krisactoptions == 1 && global.tp >= global.harmonytp && !susiedown && !ralseidown)
                        {
                            audio_play_sound(snd_select, 1, false);
                            krisacting = true;
                            krisactselected = false;
                            krisselected = false;
                            krismenuaccessible = false;
                            krisbattleicon = 2;
                            global.tp -= global.harmonytp;
                            global.harmonizing = true;
                            reason++;
                            PARTYMEMBER1.image_index = 0;
                            PARTYMEMBER1.image_speed = 0;
                            PARTYMEMBER1.sprite_index = spr_kris_act;
                            
                            if (!susiedown)
                            {
                                PARTYMEMBER2.image_index = 0;
                                PARTYMEMBER2.image_speed = 1;
                                PARTYMEMBER2.sprite_index = spr_susie_act;
                                susiebattleicon = 2;
                            }
                            
                            if (!ralseidown)
                            {
                                PARTYMEMBER3.image_index = 0;
                                PARTYMEMBER3.image_speed = 1;
                                PARTYMEMBER3.sprite_index = spr_ralsei_act;
                                ralseibattleicon = 2;
                            }
                            
                            progressfinal = true;
                        }
                        else if (krisactoptions == 1)
                        {
                            audio_play_sound(snd_bump, 1, false, 2);
                        }
                    }
                    
                    draw_sprite_ext(spr_susieralsei_icon, 0, cx + 320, cx + 240, 1, 1, 0, c_white, 1);
                    draw_text(cx + 30, cy + 379, lang("obj_battle_sof_Draw_73_39"));
                    
                    if (krisactoptions == 1)
                    {
                        draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_40"), c_gray, c_gray, c_gray, c_gray, 1);
                        draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_41") + string(global.harmonytp) + lang("obj_battle_sof_Draw_73_42"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                    }
                    
                    if (!jammed)
                    {
                        if (!krisdown && !susiedown && !ralseidown && global.tp >= global.harmonytp)
                            draw_text(cx + 260, cy + 379, lang("obj_battle_sof_Draw_73_43"));
                        else
                            draw_text_color(cx + 260, cy + 379, lang("obj_battle_sof_Draw_73_44"), c_gray, c_gray, c_gray, c_gray, 1);
                    }
                    else
                    {
                        draw_text_color(cx + 260, cy + 379, lang("obj_battle_sof_Draw_73_45"), c_red, c_red, c_red, c_red, 1);
                    }
                    
                    if (left)
                        krisactoptions--;
                    
                    if (right)
                        krisactoptions++;
                    
                    krisactoptions = clamp(krisactoptions, 0, 1);
                }
            }
            
            if (krismenuoptions == 4)
            {
                if (advance)
                {
                    audio_play_sound(snd_select, 1, false);
                    krismercy = true;
                    krisactselected = false;
                    krisselected = false;
                    krismenuaccessible = false;
                    krisbattleicon = 4;
                    krisswitch = true;
                }
            }
            
            flashpercent += (1/30);
            
            if (flashpercent <= 0.5)
                ENEMY1.flashalpha += 0.05;
            else
                ENEMY1.flashalpha -= 0.05;
            
            if (flashpercent >= 1)
                flashpercent = 0;
            
            ENEMY1.flashalpha = clamp(ENEMY1.flashalpha, 0.25, 1);
        }
        
        if (krismenuoptions == 3 && !(advancecounter >= 12))
        {
            draw_set_font(fDeterminationSans);
            draw_set_halign(fa_left);
            draw_sprite_ext(spr_itemarrow, barsubimg, cx + 476, cy + 420, 1, (itemsection == 0) ? 1 : -1, 0, c_white, 1);
            var item_positions = [[cx + 30, cy + 379], [cx + 250, cy + 379], [cx + 30, cy + 409], [cx + 250, cy + 409], [cx + 30, cy + 439], [cx + 250, cy + 439], [cx + 30, cy + 469], [cx + 250, cy + 469], [cx + 30, cy + 499], [cx + 250, cy + 499], [cx + 30, cy + 529], [cx + 250, cy + 529]];
            var max_selectable_items = array_length(itemlist) - advancecounter;
            var start_index = (itemsection == 0) ? 0 : 6;
            
            for (var i = 0; i < min(6, max_selectable_items); i++)
            {
                var item_val = itemlist[start_index + i];
                var pos = item_positions[i];
                
                if (item_val == empty)
                {
                    draw_text(pos[0], pos[1], lang("obj_battle_sof_Draw_73_46"));
                }
                else
                {
                    var short_name = ds_map_find_value(ds_map_find_value(global.item_data, item_val), "short");
                    draw_text(pos[0], pos[1], short_name);
                }
            }
            
            draw_sprite_ext(spr_SOUL_battle, 0, itemx, itemy, 1, 1, 0, c_red, 1);
            var selected_index = clamp(start_index + (itemrows * 2) + itemcolumns, 0, max_selectable_items - 1);
            var selected_item = itemlist[selected_index];
            var hover_text = ds_map_find_value(ds_map_find_value(global.item_data, selected_item), "hover");
            draw_set_color(c_gray);
            draw_text(cx + 500, cy + 379, hover_text);
            
            if (advance && !healmenu && ds_map_find_value(ds_map_find_value(global.item_data, selected_item), "team_heal"))
            {
                advancecounter++;
                used_itemk = itemlist[selected_index];
                last_used_indexk = selected_index;
                PARTYMEMBER1.flashalpha = 0;
                PARTYMEMBER2.flashalpha = 0;
                PARTYMEMBER3.flashalpha = 0;
                
                if (healoption == 0)
                    itemtargetk = PARTYMEMBER1;
                else if (healoption == 1)
                    itemtargetk = PARTYMEMBER2;
                else if (healoption == 2)
                    itemtargetk = PARTYMEMBER3;
                
                audio_play_sound(snd_select, 1, false);
                krisitem = true;
                krisselected = false;
                krismenuaccessible = false;
                krisbattleicon = 3;
                healoption = 0;
                krisswitch = true;
                
                for (var i = selected_index; i < (array_length(itemlist) - 1); i++)
                    itemlist[i] = itemlist[i + 1];
                
                itemlist[array_length(itemlist) - 1] = empty;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
            else if (advance && !healmenu)
            {
                audio_play_sound(snd_select, 1, false);
                healmenu = true;
            }
            else if (healmenu)
            {
                draw_set_color(c_black);
                draw_rectangle(cx + 0, cy + 376, cx + 640, cy + 480, 0);
                draw_set_color(c_white);
                
                if (healoption == 0)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 393, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER1.flashalpha += 0.05;
                    else
                        PARTYMEMBER1.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER1.flashalpha = clamp(PARTYMEMBER1.flashalpha, 0.25, 1);
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                else if (healoption == 1)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 423, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER2.flashalpha += 0.05;
                    else
                        PARTYMEMBER2.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER2.flashalpha = clamp(PARTYMEMBER2.flashalpha, 0.25, 1);
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                else if (healoption == 2)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 453, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER3.flashalpha += 0.05;
                    else
                        PARTYMEMBER3.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER3.flashalpha = clamp(PARTYMEMBER3.flashalpha, 0.25, 1);
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                }
                
                draw_rectangle_color(cx + 400, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 400, cy + 410, cx + 500, cy + 425, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 400, cy + 440, cx + 500, cy + 455, darkred, darkred, darkred, darkred, 0);
                var barstart = cx + 400;
                var barend = cx + 500;
                var barwidth = barend - barstart;
                var krispercent = clamp(global.krishp / global.krismaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 380, barstart + (barwidth * krispercent), cy + 395, green, green, green, green, 0);
                var susiepercent = clamp(global.susiehp / global.susiemaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 410, barstart + (barwidth * susiepercent), cy + 425, green, green, green, green, 0);
                var ralseipercent = clamp(global.ralseihp / global.ralseimaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 440, barstart + (barwidth * ralseipercent), cy + 455, green, green, green, green, 0);
                draw_set_font(fDeterminationSans);
                draw_text_with_tracking(cx + 80, cy + 379, lang("obj_battle_sof_Draw_73_47"), 16777215, 0, -2);
                
                if (revert)
                {
                    healmenu = false;
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                
                if (advance)
                {
                    advancecounter++;
                    used_itemk = itemlist[selected_index];
                    last_used_indexk = selected_index;
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                    
                    if (healoption == 0)
                        itemtargetk = PARTYMEMBER1;
                    else if (healoption == 1)
                        itemtargetk = PARTYMEMBER2;
                    else if (healoption == 2)
                        itemtargetk = PARTYMEMBER3;
                    
                    audio_play_sound(snd_select, 1, false);
                    krisitem = true;
                    krisselected = false;
                    krismenuaccessible = false;
                    krisbattleicon = 3;
                    healoption = 0;
                    krisswitch = true;
                    
                    for (var i = selected_index; i < (array_length(itemlist) - 1); i++)
                        itemlist[i] = itemlist[i + 1];
                    
                    itemlist[array_length(itemlist) - 1] = empty;
                    itemsection = 0;
                    itemcolumns = 0;
                    itemrows = 0;
                }
            }
            
            if (!healmenu)
            {
                if (left)
                    itemcolumns--;
                else if (right)
                    itemcolumns++;
                
                if (down)
                {
                    if (itemrows == 2 && itemsection == 0)
                    {
                        itemrows = 0;
                        itemsection = 1;
                    }
                    else
                    {
                        itemrows++;
                    }
                }
                
                if (up)
                {
                    if (itemrows == 0 && itemsection == 1)
                    {
                        itemrows = 2;
                        itemsection = 0;
                    }
                    else
                    {
                        itemrows--;
                    }
                }
            }
            else
            {
                if (up)
                {
                    audio_play_sound(snd_menumove, 1, false);
                    
                    if (!(healoption == 0))
                        healoption--;
                    else
                        healoption = 2;
                }
                else if (down)
                {
                    audio_play_sound(snd_menumove, 1, false);
                    
                    if (!(healoption == 2))
                        healoption++;
                    else
                        healoption = 0;
                }
                
                healoption = clamp(healoption, 0, 2);
            }
            
            if (((itemsection * 6) + (itemrows * 2) + itemcolumns) >= max_selectable_items)
            {
                itemcolumns = max(0, itemcolumns - 1);
                itemrows = max(0, itemrows - 1);
            }
            
            if (advancecounter < 6)
                itemsection = clamp(itemsection, 0, 1);
            else
                itemsection = clamp(itemsection, 0, 0);
            
            itemcolumns = clamp(itemcolumns, 0, 1);
            itemrows = clamp(itemrows, 0, 2);
            
            if (itemcolumns == 0)
                itemx = cx + 18;
            else if (itemcolumns == 1)
                itemx = cx + 238;
            
            if (itemrows == 0)
                itemy = cy + 393;
            else if (itemrows == 1)
                itemy = cy + 423;
            else if (itemrows == 2)
                itemy = cy + 453;
        }
        else if (krismenuoptions == 3 && advancecounter >= 12)
        {
            krisselected = false;
        }
        
        if (revert)
        {
            if (krisactselected)
            {
                audio_play_sound(snd_menumove, 1, false);
                krisactselected = false;
                krisselected = false;
                krisactoptions = 0;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
            else
            {
                audio_play_sound(snd_menumove, 1, false);
                krisselected = false;
                krisactoptions = 0;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
        }
    }
}

krismenuoptions = clamp(krismenuoptions, 1, 5);

if (!susiemenuaccessible)
    draw_sprite_ext(spr_battlemenu, 1, cx + susiemenux, pos_y, 1, 1, 0, menucolor, 1);
else
    draw_sprite_ext(spr_battlemenu, 1, cx + susiemenux, pos_y, 1, 1, 0, susiecolor, 1);

if (susiemenuaccessible && battlebegun)
{
    barsubimg++;
    
    if (barsubimg < 30)
        draw_sprite_ext(spr_opacitybar_beginning, barsubimg, cx + susiemenux, pos_y, 1, 1, 0, susiecolor, 1);
    else
        draw_sprite_ext(spr_opacitybar, barsubimg, cx + susiemenux, pos_y, 1, 1, 0, susiecolor, 1);
}

if (susiemenuaccessible)
    draw_sprite_ext(spr_magic_menuoptions, susiemenuoptions, (cx + susiemenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);
else if (!battlebegun)
    draw_sprite_ext(spr_magic_menuoptions, 0, (cx + susiemenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);
else
    draw_sprite_ext(spr_magic_menuoptions, 0, (cx + susiemenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);

if (!susiemenuaccessible)
    draw_sprite_ext(spr_battlemenu, 0, cx + susiemenux, pos_y2s, 1, 1, 0, menucolor, 1);
else
    draw_sprite_ext(spr_battlemenu, 0, cx + susiemenux, pos_y2s, 1, 1, 0, susiecolor, 1);

if (generaltimer <= 12)
{
    draw_sprite_ext(spr_battlemenu, 0, cx + susiemenux, pos_y + 32, 1, 1, 0, menucolor, 1);
    draw_sprite_ext(spr_susie_battlemenu, susiebattleicon, cx + susiemenux, pos_y + 32, 1, 1, 0, c_white, 1);
}
else
{
    draw_sprite_ext(spr_susie_battlemenu, susiebattleicon, cx + susiemenux, pos_y2s, 1, 1, 0, c_white, 1);
}

if (!susiemenuaccessible)
    draw_sprite_ext(spr_menu_blackbars, 0, cx + susiemenux, pos_y, 1, 1, 0, c_white, 1);

draw_set_font(fHP);

if (global.susiehp <= 0)
    draw_set_color(c_red);
else if (global.susiehp <= (global.susiemaxhp / 5))
    draw_set_color(c_yellow);
else
    draw_set_color(c_white);

draw_set_halign(fa_right);

if (generaltimer <= 12)
{
    draw_text(cx + susiemenux + 53, pos_y + 92, global.susiehp);
    draw_text(cx + susiemenux + 98, pos_y + 92, global.susiemaxhp);
    draw_rectangle_color(cx + susiemenux + 21, pos_y + 107, cx + susiemenux + 94, pos_y + 115, darkred, darkred, darkred, darkred, 0);
    
    if (global.susiehp > 0)
        draw_rectangle_color(cx + susiemenux + 21, pos_y + 107, cx + susiemenux + 21 + (75 / (global.susiemaxhp / global.susiehp)), pos_y + 115, susiecolor, susiecolor, susiecolor, susiecolor, 0);
}
else
{
    draw_text(cx + susiemenux + 53, pos_y2s + 60, global.susiehp);
    draw_text(cx + susiemenux + 98, pos_y2s + 60, global.susiemaxhp);
    draw_rectangle_color(cx + susiemenux + 21, pos_y2s + 75, cx + susiemenux + 94, pos_y2s + 83, darkred, darkred, darkred, darkred, 0);
    
    if (global.susiehp > 0)
        draw_rectangle_color(cx + susiemenux + 21, pos_y2s + 75, cx + susiemenux + 21 + (75 / (global.susiemaxhp / global.susiehp)), pos_y2s + 83, susiecolor, susiecolor, susiecolor, susiecolor, 0);
}

draw_sprite_ext(spr_susie_battlemenu, susiebattleicon, cx + susiemenux, pos_y2s, 1, 1, 0, c_white, 1);
draw_set_color(c_white);

if (susiemenuaccessible)
{
    global.enemyturn = false;
    ENEMY1.flashcolor = 16777215;
    soulsubimg = -1;
    
    if (!susieselected)
    {
        flashpercent = 0;
        ENEMY1.flashalpha = 0;
        textmenu = true;
        
        if (revert && !krisdown && !advance)
            susiedeswitch = true;
        
        if (right)
        {
            if (susiemenuoptions < 5)
                susiemenuoptions++;
            else
                susiemenuoptions = 1;
            
            audio_play_sound(snd_menumove, 1, false);
        }
        
        if (left)
        {
            if (susiemenuoptions > 1)
                susiemenuoptions--;
            else
                susiemenuoptions = 5;
            
            audio_play_sound(snd_menumove, 1, false);
        }
        
        if (advance)
        {
            audio_play_sound(snd_select, 1, false);
            susieselected = true;
            
            if (susiemenuoptions == 5)
            {
                susiedefending = true;
                susieswitch = true;
            }
        }
    }
    else if (susieselected)
    {
        textmenu = false;
        displayed_text = current_dialogue;
        text_complete = true;
        
        if (susiemenuoptions == 2)
        {
            draw_set_font(fDeterminationSans);
            draw_set_halign(fa_left);
            
            if (!susieactselected)
            {
                if (global.tp < 50)
                    draw_text_color(cx + 30, cy + 379, lang("obj_battle_sof_Draw_73_48"), c_gray, c_gray, c_gray, c_gray, 1);
                else
                    draw_text(cx + 30, cy + 379, lang("obj_battle_sof_Draw_73_49"));
                
                if (global.tp < 84)
                    draw_text_color(cx + 260, cy + 379, lang("obj_battle_sof_Draw_73_50"), c_gray, c_gray, c_gray, c_gray, 1);
                else
                    draw_text(cx + 260, cy + 379, lang("obj_battle_sof_Draw_73_51"));
                
                if (susieactoptions == 0)
                {
                    draw_sprite_ext(spr_SOUL_battle, 0, cx + 18, cy + 393, 1, 1, 0, c_red, 1);
                    draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_52"), c_gray, c_gray, c_gray, c_gray, 1);
                    draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_53"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                }
                else if (susieactoptions == 1)
                {
                    draw_sprite_ext(spr_SOUL_battle, 0, cx + 238, cy + 393, 1, 1, 0, c_red, 1);
                    draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_54"), c_gray, c_gray, c_gray, c_gray, 1);
                    draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_55"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                }
                
                if (left)
                    susieactoptions--;
                
                if (right)
                    susieactoptions++;
                
                susieactoptions = clamp(susieactoptions, 0, 1);
                
                if (advance && global.tp >= 50 && susieactoptions == 0)
                {
                    audio_play_sound(snd_select, 1, false);
                    susieactselected = true;
                    advance = 0;
                }
                
                if (advance && global.tp >= 84 && susieactoptions == 1)
                {
                    audio_play_sound(snd_select, 1, false);
                    susieactselected = true;
                    advance = 0;
                }
            }
            
            if (susieactselected && susieactoptions == 0)
            {
                draw_sprite_ext(spr_SOUL_battle, 0, cx + 63, cy + 393, 1, 1, 0, c_red, 1);
                draw_set_font(fDeterminationSans);
                draw_set_halign(fa_left);
                draw_text(cx + 80, cy + 379, ENEMYNAME);
                draw_text_transformed(cx + 424, cy + 366, lang("obj_battle_sof_Draw_73_56"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, lang("obj_battle_sof_Draw_73_57"), 1, 0.5, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 420 + (80 / (global.enemymaxhp / global.enemyhp)), cy + 395, green, green, green, green, 0);
                draw_rectangle_color(cx + 520, cy + 380, cx + 600, cy + 395, orange, orange, orange, orange, 0);
                
                if (global.mercy > 0)
                    draw_rectangle_color(cx + 520, cy + 380, cx + 520 + (80 / (100 / global.mercy)), cy + 395, c_yellow, c_yellow, c_yellow, c_yellow, 0);
                
                var roundedhp;
                
                if (round((global.enemyhp / global.enemymaxhp) * 100) == 0)
                    roundedhp = 1;
                else
                    roundedhp = round((global.enemyhp / global.enemymaxhp) * 100);
                
                draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + lang("obj_battle_sof_Draw_73_58"), 1, 0.5, 0);
                draw_set_color(darkred);
                draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + lang("obj_battle_sof_Draw_73_59"), 1, 0.5, 0);
                draw_set_color(c_white);
                flashpercent += (1/30);
                
                if (flashpercent <= 0.5)
                    ENEMY1.flashalpha += 0.05;
                else
                    ENEMY1.flashalpha -= 0.05;
                
                if (flashpercent >= 1)
                    flashpercent = 0;
                
                ENEMY1.flashalpha = clamp(ENEMY1.flashalpha, 0.25, 1);
                
                if (revert)
                {
                    susieactselected = false;
                    revert = 0;
                }
                
                if (advance)
                {
                    susiemagic = true;
                    susieactselected = false;
                    susieselected = false;
                    susiemenuaccessible = false;
                    susiebattleicon = 8;
                    susieswitch = true;
                    global.tp -= 50;
                    audio_play_sound(snd_select, 1, false);
                }
            }
            else if (susieactselected && susieactoptions == 1)
            {
                draw_set_color(c_black);
                draw_rectangle(cx + 0, cy + 376, cx + 640, cy + 480, 0);
                draw_set_color(c_white);
                
                if (healoption == 0)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 393, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER1.flashalpha += 0.05;
                    else
                        PARTYMEMBER1.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER1.flashalpha = clamp(PARTYMEMBER1.flashalpha, 0.25, 1);
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                else if (healoption == 1)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 423, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER2.flashalpha += 0.05;
                    else
                        PARTYMEMBER2.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER2.flashalpha = clamp(PARTYMEMBER2.flashalpha, 0.25, 1);
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                else if (healoption == 2)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 453, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER3.flashalpha += 0.05;
                    else
                        PARTYMEMBER3.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER3.flashalpha = clamp(PARTYMEMBER3.flashalpha, 0.25, 1);
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                }
                
                draw_rectangle_color(cx + 400, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 400, cy + 410, cx + 500, cy + 425, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 400, cy + 440, cx + 500, cy + 455, darkred, darkred, darkred, darkred, 0);
                var barstart = cx + 400;
                var barend = cx + 500;
                var barwidth = barend - barstart;
                var krispercent = clamp(global.krishp / global.krismaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 380, barstart + (barwidth * krispercent), cy + 395, green, green, green, green, 0);
                var susiepercent = clamp(global.susiehp / global.susiemaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 410, barstart + (barwidth * susiepercent), cy + 425, green, green, green, green, 0);
                var ralseipercent = clamp(global.ralseihp / global.ralseimaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 440, barstart + (barwidth * ralseipercent), cy + 455, green, green, green, green, 0);
                draw_set_font(fDeterminationSans);
                draw_text_with_tracking(cx + 80, cy + 379, lang("obj_battle_sof_Draw_73_60"), 16777215, 0, -2);
                
                if (up)
                {
                    audio_play_sound(snd_menumove, 1, false);
                    
                    if (!(healoption == 0))
                        healoption--;
                    else
                        healoption = 2;
                }
                else if (down)
                {
                    audio_play_sound(snd_menumove, 1, false);
                    
                    if (!(healoption == 2))
                        healoption++;
                    else
                        healoption = 0;
                }
                
                healoption = clamp(healoption, 0, 2);
                
                if (revert)
                {
                    susieactselected = false;
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                    revert = 0;
                }
                
                if (advance)
                {
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                    
                    if (healoption == 0)
                        itemtargets = PARTYMEMBER1;
                    else if (healoption == 1)
                        itemtargets = PARTYMEMBER2;
                    else if (healoption == 2)
                        itemtargets = PARTYMEMBER3;
                    
                    audio_play_sound(snd_select, 1, false);
                    susiemagic = true;
                    susieselected = false;
                    susiemenuaccessible = false;
                    susiebattleicon = 8;
                    susieswitch = true;
                    global.tp -= 84;
                }
            }
        }
        
        if (susiemenuoptions == 1 || susiemenuoptions == 4)
        {
            if (!susieactselected)
            {
                draw_sprite_ext(spr_SOUL_battle, 0, cx + 63, cy + 393, 1, 1, 0, c_red, 1);
                draw_set_font(fDeterminationSans);
                draw_set_halign(fa_left);
                draw_text(cx + 80, cy + 379, ENEMYNAME);
                draw_text_transformed(cx + 424, cy + 366, lang("obj_battle_sof_Draw_73_61"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, lang("obj_battle_sof_Draw_73_62"), 1, 0.5, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 420 + (80 / (global.enemymaxhp / global.enemyhp)), cy + 395, green, green, green, green, 0);
                draw_rectangle_color(cx + 520, cy + 380, cx + 600, cy + 395, orange, orange, orange, orange, 0);
                
                if (global.mercy > 0)
                    draw_rectangle_color(cx + 520, cy + 380, cx + 520 + (80 / (100 / global.mercy)), cy + 395, c_yellow, c_yellow, c_yellow, c_yellow, 0);
                
                var roundedhp;
                
                if (round((global.enemyhp / global.enemymaxhp) * 100) == 0)
                    roundedhp = 1;
                else
                    roundedhp = round((global.enemyhp / global.enemymaxhp) * 100);
                
                draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + lang("obj_battle_sof_Draw_73_63"), 1, 0.5, 0);
                draw_set_color(darkred);
                draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + lang("obj_battle_sof_Draw_73_64"), 1, 0.5, 0);
                draw_set_color(c_white);
            }
            
            if (susiemenuoptions == 1)
            {
                if (!susieactselected)
                {
                    if (advance)
                    {
                        audio_play_sound(snd_select, 1, false);
                        susiemenuaccessible = false;
                        susiebattleicon = 1;
                        susiefight = true;
                        susieswitch = true;
                    }
                }
            }
            
            if (susiemenuoptions == 4)
            {
                if (advance)
                {
                    audio_play_sound(snd_select, 1, false);
                    susiemercy = true;
                    susieactselected = false;
                    susieselected = false;
                    susiemenuaccessible = false;
                    susiebattleicon = 4;
                    susieswitch = true;
                }
            }
            
            flashpercent += (1/30);
            
            if (flashpercent <= 0.5)
                ENEMY1.flashalpha += 0.05;
            else
                ENEMY1.flashalpha -= 0.05;
            
            if (flashpercent >= 1)
                flashpercent = 0;
            
            ENEMY1.flashalpha = clamp(ENEMY1.flashalpha, 0.25, 1);
        }
        
        if (susiemenuoptions == 3 && !(advancecounter >= 12))
        {
            draw_set_font(fDeterminationSans);
            draw_set_halign(fa_left);
            draw_sprite_ext(spr_itemarrow, barsubimg, cx + 476, cy + 420, 1, (itemsection == 0) ? 1 : -1, 0, c_white, 1);
            var item_positions = [[cx + 30, cy + 379], [cx + 250, cy + 379], [cx + 30, cy + 409], [cx + 250, cy + 409], [cx + 30, cy + 439], [cx + 250, cy + 439], [cx + 30, cy + 469], [cx + 250, cy + 469], [cx + 30, cy + 499], [cx + 250, cy + 499], [cx + 30, cy + 529], [cx + 250, cy + 529]];
            var max_selectable_items = array_length(itemlist) - advancecounter;
            var start_index = (itemsection == 0) ? 0 : 6;
            
            for (var i = 0; i < min(6, max_selectable_items); i++)
            {
                var item_val = itemlist[start_index + i];
                var pos = item_positions[i];
                
                if (item_val == empty)
                {
                    draw_text(pos[0], pos[1], lang("obj_battle_sof_Draw_73_65"));
                }
                else
                {
                    var short_name = ds_map_find_value(ds_map_find_value(global.item_data, item_val), "short");
                    draw_text(pos[0], pos[1], short_name);
                }
            }
            
            draw_sprite_ext(spr_SOUL_battle, 0, itemx, itemy, 1, 1, 0, c_red, 1);
            var selected_index = clamp(start_index + (itemrows * 2) + itemcolumns, 0, max_selectable_items - 1);
            var selected_item = itemlist[selected_index];
            var hover_text = ds_map_find_value(ds_map_find_value(global.item_data, selected_item), "hover");
            draw_set_color(c_gray);
            draw_text(cx + 500, cy + 379, hover_text);
            
            if (advance && !healmenu && ds_map_find_value(ds_map_find_value(global.item_data, selected_item), "team_heal"))
            {
                advancecounter++;
                used_items = itemlist[selected_index];
                last_used_indexs = selected_index;
                PARTYMEMBER1.flashalpha = 0;
                PARTYMEMBER2.flashalpha = 0;
                PARTYMEMBER3.flashalpha = 0;
                
                if (healoption == 0)
                    itemtargets = PARTYMEMBER1;
                else if (healoption == 1)
                    itemtargets = PARTYMEMBER2;
                else if (healoption == 2)
                    itemtargets = PARTYMEMBER3;
                
                audio_play_sound(snd_select, 1, false);
                susieitem = true;
                susieselected = false;
                susiemenuaccessible = false;
                susiebattleicon = 3;
                healoption = 0;
                susieswitch = true;
                
                for (var i = selected_index; i < (array_length(itemlist) - 1); i++)
                    itemlist[i] = itemlist[i + 1];
                
                itemlist[array_length(itemlist) - 1] = empty;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
            else if (advance && !healmenu)
            {
                audio_play_sound(snd_select, 1, false);
                healmenu = true;
            }
            else if (healmenu)
            {
                draw_set_color(c_black);
                draw_rectangle(cx + 0, cy + 376, cx + 640, cy + 480, 0);
                draw_set_color(c_white);
                
                if (healoption == 0)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 393, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER1.flashalpha += 0.05;
                    else
                        PARTYMEMBER1.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER1.flashalpha = clamp(PARTYMEMBER1.flashalpha, 0.25, 1);
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                else if (healoption == 1)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 423, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER2.flashalpha += 0.05;
                    else
                        PARTYMEMBER2.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER2.flashalpha = clamp(PARTYMEMBER2.flashalpha, 0.25, 1);
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                else if (healoption == 2)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 453, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER3.flashalpha += 0.05;
                    else
                        PARTYMEMBER3.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER3.flashalpha = clamp(PARTYMEMBER3.flashalpha, 0.25, 1);
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                }
                
                draw_rectangle_color(cx + 400, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 400, cy + 410, cx + 500, cy + 425, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 400, cy + 440, cx + 500, cy + 455, darkred, darkred, darkred, darkred, 0);
                var barstart = cx + 400;
                var barend = cx + 500;
                var barwidth = barend - barstart;
                var krispercent = clamp(global.krishp / global.krismaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 380, barstart + (barwidth * krispercent), cy + 395, green, green, green, green, 0);
                var susiepercent = clamp(global.susiehp / global.susiemaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 410, barstart + (barwidth * susiepercent), cy + 425, green, green, green, green, 0);
                var ralseipercent = clamp(global.ralseihp / global.ralseimaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 440, barstart + (barwidth * ralseipercent), cy + 455, green, green, green, green, 0);
                draw_set_font(fDeterminationSans);
                draw_text_with_tracking(cx + 80, cy + 379, lang("obj_battle_sof_Draw_73_66"), 16777215, 0, -2);
                
                if (revert)
                {
                    healmenu = false;
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                
                if (advance)
                {
                    advancecounter++;
                    used_items = itemlist[selected_index];
                    last_used_indexs = selected_index;
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                    
                    if (healoption == 0)
                        itemtargets = PARTYMEMBER1;
                    else if (healoption == 1)
                        itemtargets = PARTYMEMBER2;
                    else if (healoption == 2)
                        itemtargets = PARTYMEMBER3;
                    
                    audio_play_sound(snd_select, 1, false);
                    susieitem = true;
                    susieselected = false;
                    susiemenuaccessible = false;
                    susiebattleicon = 3;
                    healoption = 0;
                    susieswitch = true;
                    
                    for (var i = selected_index; i < (array_length(itemlist) - 1); i++)
                        itemlist[i] = itemlist[i + 1];
                    
                    itemlist[array_length(itemlist) - 1] = empty;
                    itemsection = 0;
                    itemcolumns = 0;
                    itemrows = 0;
                }
            }
            
            if (!healmenu)
            {
                if (left)
                    itemcolumns--;
                else if (right)
                    itemcolumns++;
                
                if (down)
                {
                    if (itemrows == 2 && itemsection == 0)
                    {
                        itemrows = 0;
                        itemsection = 1;
                    }
                    else
                    {
                        itemrows++;
                    }
                }
                
                if (up)
                {
                    if (itemrows == 0 && itemsection == 1)
                    {
                        itemrows = 2;
                        itemsection = 0;
                    }
                    else
                    {
                        itemrows--;
                    }
                }
            }
            else
            {
                if (up)
                {
                    flashpercent = 0;
                    audio_play_sound(snd_menumove, 1, false);
                    
                    if (!(healoption == 0))
                        healoption--;
                    else
                        healoption = 2;
                }
                else if (down)
                {
                    flashpercent = 0;
                    audio_play_sound(snd_menumove, 1, false);
                    
                    if (!(healoption == 2))
                        healoption++;
                    else
                        healoption = 0;
                }
                
                healoption = clamp(healoption, 0, 2);
            }
            
            if (((itemsection * 6) + (itemrows * 2) + itemcolumns) >= max_selectable_items)
            {
                itemcolumns = max(0, itemcolumns - 1);
                itemrows = max(0, itemrows - 1);
            }
            
            if (advancecounter < 6)
                itemsection = clamp(itemsection, 0, 1);
            else
                itemsection = clamp(itemsection, 0, 0);
            
            itemcolumns = clamp(itemcolumns, 0, 1);
            itemrows = clamp(itemrows, 0, 2);
            
            if (itemcolumns == 0)
                itemx = cx + 18;
            else if (itemcolumns == 1)
                itemx = cx + 238;
            
            if (itemrows == 0)
                itemy = cy + 393;
            else if (itemrows == 1)
                itemy = cy + 423;
            else if (itemrows == 2)
                itemy = cy + 453;
        }
        else if (susiemenuoptions == 3 && advancecounter >= 12)
        {
            susieselected = false;
        }
        
        if (revert)
        {
            if (susieactselected)
            {
                audio_play_sound(snd_menumove, 1, false);
                susieactselected = false;
                susieselected = false;
                susieactoptions = 0;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
            else
            {
                audio_play_sound(snd_menumove, 1, false);
                susieselected = false;
                susieactoptions = 0;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
        }
    }
}

susiemenuoptions = clamp(susiemenuoptions, 1, 5);

if (!ralseimenuaccessible)
    draw_sprite_ext(spr_battlemenu, 1, cx + ralseimenux, pos_y, 1, 1, 0, menucolor, 1);
else
    draw_sprite_ext(spr_battlemenu, 1, cx + ralseimenux, pos_y, 1, 1, 0, ralseicolor, 1);

if (ralseimenuaccessible && battlebegun)
{
    barsubimg++;
    
    if (barsubimg < 30)
        draw_sprite_ext(spr_opacitybar_beginning, barsubimg, cx + ralseimenux, pos_y, 1, 1, 0, ralseicolor, 1);
    else
        draw_sprite_ext(spr_opacitybar, barsubimg, cx + ralseimenux, pos_y, 1, 1, 0, ralseicolor, 1);
}

if (ralseimenuaccessible)
    draw_sprite_ext(spr_magic_menuoptions, ralseimenuoptions, (cx + ralseimenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);
else if (!battlebegun)
    draw_sprite_ext(spr_magic_menuoptions, 0, (cx + ralseimenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);
else
    draw_sprite_ext(spr_magic_menuoptions, 0, (cx + ralseimenux) - 2, pos_y + 109, 1, 1, 0, c_white, 1);

if (!ralseimenuaccessible)
    draw_sprite_ext(spr_battlemenu, 0, cx + ralseimenux, pos_y2r, 1, 1, 0, menucolor, 1);
else
    draw_sprite_ext(spr_battlemenu, 0, cx + ralseimenux, pos_y2r, 1, 1, 0, ralseicolor, 1);

if (generaltimer <= 12)
{
    draw_sprite_ext(spr_battlemenu, 0, cx + ralseimenux, pos_y + 32, 1, 1, 0, menucolor, 1);
    draw_sprite_ext(spr_ralsei_battlemenu, ralseibattleicon, cx + ralseimenux, pos_y + 32, 1, 1, 0, c_white, 1);
}
else
{
    draw_sprite_ext(spr_ralsei_battlemenu, ralseibattleicon, cx + ralseimenux, pos_y2r, 1, 1, 0, c_white, 1);
}

if (!ralseimenuaccessible)
    draw_sprite_ext(spr_menu_blackbars, 0, cx + ralseimenux, pos_y, 1, 1, 0, c_white, 1);

draw_set_font(fHP);

if (global.ralseihp <= 0)
    draw_set_color(c_red);
else if (global.ralseihp <= (global.ralseimaxhp / 5))
    draw_set_color(c_yellow);
else
    draw_set_color(c_white);

draw_set_halign(fa_right);

if (generaltimer <= 12)
{
    draw_text(cx + ralseimenux + 53, pos_y + 92, global.ralseihp);
    draw_text(cx + ralseimenux + 98, pos_y + 92, global.ralseimaxhp);
    draw_rectangle_color(cx + ralseimenux + 21, pos_y + 107, cx + ralseimenux + 94, pos_y + 115, darkred, darkred, darkred, darkred, 0);
    
    if (global.ralseihp > 0)
        draw_rectangle_color(cx + ralseimenux + 21, pos_y + 107, cx + ralseimenux + 21 + (75 / (global.ralseimaxhp / global.ralseihp)), pos_y + 115, ralseicolor, ralseicolor, ralseicolor, ralseicolor, 0);
}
else
{
    draw_text(cx + ralseimenux + 53, pos_y2r + 60, global.ralseihp);
    draw_text(cx + ralseimenux + 98, pos_y2r + 60, global.ralseimaxhp);
    draw_rectangle_color(cx + ralseimenux + 21, pos_y2r + 75, cx + ralseimenux + 94, pos_y2r + 83, darkred, darkred, darkred, darkred, 0);
    
    if (global.ralseihp > 0)
        draw_rectangle_color(cx + ralseimenux + 21, pos_y2r + 75, cx + ralseimenux + 21 + (75 / (global.ralseimaxhp / global.ralseihp)), pos_y2r + 83, ralseicolor, ralseicolor, ralseicolor, ralseicolor, 0);
}

draw_sprite_ext(spr_ralsei_battlemenu, ralseibattleicon, cx + ralseimenux, pos_y2r, 1, 1, 0, c_white, 1);
draw_set_color(c_white);

if (ralseimenuaccessible)
{
    global.enemyturn = false;
    ENEMY1.flashcolor = 16777215;
    soulsubimg = -1;
    
    if (!ralseiselected)
    {
        flashpercent = 0;
        ENEMY1.flashalpha = 0;
        textmenu = true;
        
        if (revert && !(krisdown && susiedown) && !advance)
            ralseideswitch = true;
        
        if (right)
        {
            if (ralseimenuoptions < 5)
                ralseimenuoptions++;
            else
                ralseimenuoptions = 1;
            
            audio_play_sound(snd_menumove, 1, false);
        }
        
        if (left)
        {
            if (ralseimenuoptions > 1)
                ralseimenuoptions--;
            else
                ralseimenuoptions = 5;
            
            audio_play_sound(snd_menumove, 1, false);
        }
        
        if (advance)
        {
            audio_play_sound(snd_select, 1, false);
            ralseiselected = true;
            
            if (ralseimenuoptions == 5)
            {
                ralseidefending = true;
                ralseiswitch = true;
            }
        }
    }
    else if (ralseiselected)
    {
        textmenu = false;
        displayed_text = current_dialogue;
        text_complete = true;
        
        if (ralseimenuoptions == 1 || ralseimenuoptions == 2 || ralseimenuoptions == 4)
        {
            if (!ralseiactselected && !(ralseimenuoptions == 2))
            {
                draw_sprite_ext(spr_SOUL_battle, 0, cx + 63, cy + 393, 1, 1, 0, c_red, 1);
                draw_set_font(fDeterminationSans);
                draw_set_halign(fa_left);
                draw_text(cx + 80, cy + 379, ENEMYNAME);
                draw_text_transformed(cx + 424, cy + 366, lang("obj_battle_sof_Draw_73_67"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, lang("obj_battle_sof_Draw_73_68"), 1, 0.5, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 420 + (80 / (global.enemymaxhp / global.enemyhp)), cy + 395, green, green, green, green, 0);
                draw_rectangle_color(cx + 520, cy + 380, cx + 600, cy + 395, orange, orange, orange, orange, 0);
                
                if (global.mercy > 0)
                    draw_rectangle_color(cx + 520, cy + 380, cx + 520 + (80 / (100 / global.mercy)), cy + 395, c_yellow, c_yellow, c_yellow, c_yellow, 0);
                
                var roundedhp;
                
                if (round((global.enemyhp / global.enemymaxhp) * 100) == 0)
                    roundedhp = 1;
                else
                    roundedhp = round((global.enemyhp / global.enemymaxhp) * 100);
                
                draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + lang("obj_battle_sof_Draw_73_69"), 1, 0.5, 0);
                draw_set_color(darkred);
                draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + lang("obj_battle_sof_Draw_73_70"), 1, 0.5, 0);
                draw_set_color(c_white);
            }
            
            if (ralseimenuoptions == 1)
            {
                if (!ralseiactselected)
                {
                    if (advance)
                    {
                        audio_play_sound(snd_select, 1, false);
                        ralseimenuaccessible = false;
                        ralseibattleicon = 1;
                        ralseifight = true;
                        ralseiswitch = true;
                    }
                }
            }
            
            if (ralseimenuoptions == 2)
            {
                if (!ralseiactselected)
                {
                    ralseiactselected = true;
                }
                else if (ralseiactselected)
                {
                    draw_set_font(fDeterminationSans);
                    draw_set_halign(fa_left);
                    
                    if (ralseiactoptions == 0)
                    {
                        if (!ralseimagicselected)
                            draw_sprite_ext(spr_SOUL_battle, 0, cx + 18, cy + 393, 1, 1, 0, c_red, 1);
                        
                        if (advance && !ralseimagicselected && global.tp >= 16)
                        {
                            advance = 0;
                            audio_play_sound(snd_select, 1, false);
                            ralseimagicselected = true;
                        }
                        else if (ralseimagicselected)
                        {
                            draw_sprite_ext(spr_SOUL_battle, 0, cx + 63, cy + 393, 1, 1, 0, c_red, 1);
                            draw_set_font(fDeterminationSans);
                            draw_set_halign(fa_left);
                            draw_text(cx + 80, cy + 379, ENEMYNAME);
                            draw_text_transformed(cx + 424, cy + 366, lang("obj_battle_sof_Draw_73_71"), 1, 0.5, 0);
                            draw_text_transformed(cx + 524, cy + 366, lang("obj_battle_sof_Draw_73_72"), 1, 0.5, 0);
                            draw_rectangle_color(cx + 420, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                            draw_rectangle_color(cx + 420, cy + 380, cx + 420 + (80 / (global.enemymaxhp / global.enemyhp)), cy + 395, green, green, green, green, 0);
                            draw_rectangle_color(cx + 520, cy + 380, cx + 600, cy + 395, orange, orange, orange, orange, 0);
                            
                            if (global.mercy > 0)
                                draw_rectangle_color(cx + 520, cy + 380, cx + 520 + (80 / (100 / global.mercy)), cy + 395, c_yellow, c_yellow, c_yellow, c_yellow, 0);
                            
                            var roundedhp;
                            
                            if (round((global.enemyhp / global.enemymaxhp) * 100) == 0)
                                roundedhp = 1;
                            else
                                roundedhp = round((global.enemyhp / global.enemymaxhp) * 100);
                            
                            draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + lang("obj_battle_sof_Draw_73_73"), 1, 0.5, 0);
                            draw_set_color(darkred);
                            draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + lang("obj_battle_sof_Draw_73_74"), 1, 0.5, 0);
                            draw_set_color(c_white);
                            
                            if (revert)
                            {
                                ralseimagicselected = false;
                                revert = 0;
                            }
                            
                            if (advance)
                            {
                                audio_play_sound(snd_select, 1, false);
                                ralseimagic = true;
                                ralseiselected = false;
                                ralseimenuaccessible = false;
                                ralseibattleicon = 8;
                                ralseiswitch = true;
                                global.tp -= 16;
                            }
                        }
                    }
                    
                    if (ralseiactoptions == 1)
                    {
                        draw_sprite_ext(spr_SOUL_battle, 0, cx + 238, cy + 393, 1, 1, 0, c_red, 1);
                        
                        if (advance && !healmenu && global.tp >= 32)
                        {
                            advance = 0;
                            audio_play_sound(snd_select, 1, false);
                            healmenu = true;
                        }
                        else if (healmenu)
                        {
                            draw_set_color(c_black);
                            draw_rectangle(cx + 0, cy + 376, cx + 640, cy + 480, 0);
                            draw_set_color(c_white);
                            
                            if (healoption == 0)
                            {
                                draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 393, 1, 1, 0, c_white, 1);
                                flashpercent += (1/30);
                                
                                if (flashpercent <= 0.5)
                                    PARTYMEMBER1.flashalpha += 0.05;
                                else
                                    PARTYMEMBER1.flashalpha -= 0.05;
                                
                                if (flashpercent >= 1)
                                    flashpercent = 0;
                                
                                PARTYMEMBER1.flashalpha = clamp(PARTYMEMBER1.flashalpha, 0.25, 1);
                                PARTYMEMBER2.flashalpha = 0;
                                PARTYMEMBER3.flashalpha = 0;
                            }
                            else if (healoption == 1)
                            {
                                draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 423, 1, 1, 0, c_white, 1);
                                flashpercent += (1/30);
                                
                                if (flashpercent <= 0.5)
                                    PARTYMEMBER2.flashalpha += 0.05;
                                else
                                    PARTYMEMBER2.flashalpha -= 0.05;
                                
                                if (flashpercent >= 1)
                                    flashpercent = 0;
                                
                                PARTYMEMBER2.flashalpha = clamp(PARTYMEMBER2.flashalpha, 0.25, 1);
                                PARTYMEMBER1.flashalpha = 0;
                                PARTYMEMBER3.flashalpha = 0;
                            }
                            else if (healoption == 2)
                            {
                                draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 453, 1, 1, 0, c_white, 1);
                                flashpercent += (1/30);
                                
                                if (flashpercent <= 0.5)
                                    PARTYMEMBER3.flashalpha += 0.05;
                                else
                                    PARTYMEMBER3.flashalpha -= 0.05;
                                
                                if (flashpercent >= 1)
                                    flashpercent = 0;
                                
                                PARTYMEMBER3.flashalpha = clamp(PARTYMEMBER3.flashalpha, 0.25, 1);
                                PARTYMEMBER1.flashalpha = 0;
                                PARTYMEMBER2.flashalpha = 0;
                            }
                            
                            draw_rectangle_color(cx + 400, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                            draw_rectangle_color(cx + 400, cy + 410, cx + 500, cy + 425, darkred, darkred, darkred, darkred, 0);
                            draw_rectangle_color(cx + 400, cy + 440, cx + 500, cy + 455, darkred, darkred, darkred, darkred, 0);
                            var barstart = cx + 400;
                            var barend = cx + 500;
                            var barwidth = barend - barstart;
                            var krispercent = clamp(global.krishp / global.krismaxhp, 0, 1);
                            draw_rectangle_color(barstart, cy + 380, barstart + (barwidth * krispercent), cy + 395, green, green, green, green, 0);
                            var susiepercent = clamp(global.susiehp / global.susiemaxhp, 0, 1);
                            draw_rectangle_color(barstart, cy + 410, barstart + (barwidth * susiepercent), cy + 425, green, green, green, green, 0);
                            var ralseipercent = clamp(global.ralseihp / global.ralseimaxhp, 0, 1);
                            draw_rectangle_color(barstart, cy + 440, barstart + (barwidth * ralseipercent), cy + 455, green, green, green, green, 0);
                            draw_set_font(fDeterminationSans);
                            draw_text_with_tracking(cx + 80, cy + 379, lang("obj_battle_sof_Draw_73_75"), 16777215, 0, -2);
                            
                            if (revert)
                            {
                                healmenu = false;
                                PARTYMEMBER1.flashalpha = 0;
                                PARTYMEMBER2.flashalpha = 0;
                                PARTYMEMBER3.flashalpha = 0;
                                revert = 0;
                            }
                            
                            if (advance)
                            {
                                PARTYMEMBER1.flashalpha = 0;
                                PARTYMEMBER2.flashalpha = 0;
                                PARTYMEMBER3.flashalpha = 0;
                                
                                if (healoption == 0)
                                    itemtargetr = PARTYMEMBER1;
                                else if (healoption == 1)
                                    itemtargetr = PARTYMEMBER2;
                                else if (healoption == 2)
                                    itemtargetr = PARTYMEMBER3;
                                
                                audio_play_sound(snd_select, 1, false);
                                ralseimagic = true;
                                ralseiselected = false;
                                ralseimenuaccessible = false;
                                ralseibattleicon = 8;
                                ralseiswitch = true;
                                global.tp -= 32;
                            }
                        }
                        
                        if (healmenu)
                        {
                            if (up)
                            {
                                audio_play_sound(snd_menumove, 1, false);
                                
                                if (!(healoption == 0))
                                    healoption--;
                                else
                                    healoption = 2;
                            }
                            else if (down)
                            {
                                audio_play_sound(snd_menumove, 1, false);
                                
                                if (!(healoption == 2))
                                    healoption++;
                                else
                                    healoption = 0;
                            }
                            
                            healoption = clamp(healoption, 0, 2);
                        }
                    }
                    
                    if (!healmenu && !ralseimagicselected)
                    {
                        if (global.tp < 16)
                            draw_text_color(cx + 30, cy + 379, lang("obj_battle_sof_Draw_73_76"), c_gray, c_gray, c_gray, c_gray, 1);
                        else
                            draw_text(cx + 30, cy + 379, lang("obj_battle_sof_Draw_73_77"));
                        
                        if (global.tp < 32)
                            draw_text_color(cx + 260, cy + 379, lang("obj_battle_sof_Draw_73_78"), c_gray, c_gray, c_gray, c_gray, 1);
                        else
                            draw_text(cx + 260, cy + 379, lang("obj_battle_sof_Draw_73_79"));
                        
                        if (ralseiactoptions == 0)
                        {
                            draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_80"), c_gray, c_gray, c_gray, c_gray, 1);
                            draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_81"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                        }
                        else
                        {
                            draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_82"), c_gray, c_gray, c_gray, c_gray, 1);
                            draw_text_color(cx + 500, cy + 379, lang("obj_battle_sof_Draw_73_83"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                        }
                        
                        if (left)
                            ralseiactoptions--;
                        
                        if (right)
                            ralseiactoptions++;
                        
                        ralseiactoptions = clamp(ralseiactoptions, 0, 1);
                    }
                }
            }
            
            if (ralseimenuoptions == 4)
            {
                if (advance)
                {
                    audio_play_sound(snd_select, 1, false);
                    ralseimercy = true;
                    ralseiactselected = false;
                    ralseiselected = false;
                    ralseimenuaccessible = false;
                    ralseibattleicon = 4;
                    ralseiswitch = true;
                }
            }
            
            if (!(ralseimenuoptions == 2) || ralseimagicselected)
            {
                flashpercent += (1/30);
                
                if (flashpercent <= 0.5)
                    ENEMY1.flashalpha += 0.05;
                else
                    ENEMY1.flashalpha -= 0.05;
                
                if (flashpercent >= 1)
                    flashpercent = 0;
                
                ENEMY1.flashalpha = clamp(ENEMY1.flashalpha, 0.25, 1);
            }
        }
        
        if (ralseimenuoptions == 3 && !(advancecounter >= 12))
        {
            draw_set_font(fDeterminationSans);
            draw_set_halign(fa_left);
            draw_sprite_ext(spr_itemarrow, barsubimg, cx + 476, cy + 420, 1, (itemsection == 0) ? 1 : -1, 0, c_white, 1);
            var item_positions = [[cx + 30, cy + 379], [cx + 250, cy + 379], [cx + 30, cy + 409], [cx + 250, cy + 409], [cx + 30, cy + 439], [cx + 250, cy + 439], [cx + 30, cy + 469], [cx + 250, cy + 469], [cx + 30, cy + 499], [cx + 250, cy + 499], [cx + 30, cy + 529], [cx + 250, cy + 529]];
            var max_selectable_items = array_length(itemlist) - advancecounter;
            var start_index = (itemsection == 0) ? 0 : 6;
            
            for (var i = 0; i < min(6, max_selectable_items); i++)
            {
                var item_val = itemlist[start_index + i];
                var pos = item_positions[i];
                
                if (item_val == empty)
                {
                    draw_text(pos[0], pos[1], lang("obj_battle_sof_Draw_73_84"));
                }
                else
                {
                    var short_name = ds_map_find_value(ds_map_find_value(global.item_data, item_val), "short");
                    draw_text(pos[0], pos[1], short_name);
                }
            }
            
            draw_sprite_ext(spr_SOUL_battle, 0, itemx, itemy, 1, 1, 0, c_red, 1);
            var selected_index = clamp(start_index + (itemrows * 2) + itemcolumns, 0, max_selectable_items - 1);
            var selected_item = itemlist[selected_index];
            var hover_text = ds_map_find_value(ds_map_find_value(global.item_data, selected_item), "hover");
            draw_set_color(c_gray);
            draw_text(cx + 500, cy + 379, hover_text);
            
            if (advance && !healmenu && ds_map_find_value(ds_map_find_value(global.item_data, selected_item), "team_heal"))
            {
                advancecounter++;
                used_itemr = itemlist[selected_index];
                last_used_indexr = selected_index;
                PARTYMEMBER1.flashalpha = 0;
                PARTYMEMBER2.flashalpha = 0;
                PARTYMEMBER3.flashalpha = 0;
                
                if (healoption == 0)
                    itemtargetr = PARTYMEMBER1;
                else if (healoption == 1)
                    itemtargetr = PARTYMEMBER2;
                else if (healoption == 2)
                    itemtargetr = PARTYMEMBER3;
                
                audio_play_sound(snd_select, 1, false);
                ralseiitem = true;
                ralseiselected = false;
                ralseimenuaccessible = false;
                ralseibattleicon = 3;
                healoption = 0;
                ralseiswitch = true;
                
                for (var i = selected_index; i < (array_length(itemlist) - 1); i++)
                    itemlist[i] = itemlist[i + 1];
                
                itemlist[array_length(itemlist) - 1] = empty;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
            else if (advance && !healmenu)
            {
                audio_play_sound(snd_select, 1, false);
                healmenu = true;
            }
            else if (healmenu)
            {
                draw_set_color(c_black);
                draw_rectangle(cx + 0, cy + 376, cx + 640, cy + 480, 0);
                draw_set_color(c_white);
                
                if (healoption == 0)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 393, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER1.flashalpha += 0.05;
                    else
                        PARTYMEMBER1.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER1.flashalpha = clamp(PARTYMEMBER1.flashalpha, 0.25, 1);
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                else if (healoption == 1)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 423, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER2.flashalpha += 0.05;
                    else
                        PARTYMEMBER2.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER2.flashalpha = clamp(PARTYMEMBER2.flashalpha, 0.25, 1);
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                else if (healoption == 2)
                {
                    draw_sprite_ext(spr_SOUL, 0, cx + 63, cy + 453, 1, 1, 0, c_white, 1);
                    flashpercent += (1/30);
                    
                    if (flashpercent <= 0.5)
                        PARTYMEMBER3.flashalpha += 0.05;
                    else
                        PARTYMEMBER3.flashalpha -= 0.05;
                    
                    if (flashpercent >= 1)
                        flashpercent = 0;
                    
                    PARTYMEMBER3.flashalpha = clamp(PARTYMEMBER3.flashalpha, 0.25, 1);
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                }
                
                draw_rectangle_color(cx + 400, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 400, cy + 410, cx + 500, cy + 425, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 400, cy + 440, cx + 500, cy + 455, darkred, darkred, darkred, darkred, 0);
                var barstart = cx + 400;
                var barend = cx + 500;
                var barwidth = barend - barstart;
                var krispercent = clamp(global.krishp / global.krismaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 380, barstart + (barwidth * krispercent), cy + 395, green, green, green, green, 0);
                var susiepercent = clamp(global.susiehp / global.susiemaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 410, barstart + (barwidth * susiepercent), cy + 425, green, green, green, green, 0);
                var ralseipercent = clamp(global.ralseihp / global.ralseimaxhp, 0, 1);
                draw_rectangle_color(barstart, cy + 440, barstart + (barwidth * ralseipercent), cy + 455, green, green, green, green, 0);
                draw_set_font(fDeterminationSans);
                draw_text_with_tracking(cx + 80, cy + 379, lang("obj_battle_sof_Draw_73_85"), 16777215, 0, -2);
                
                if (revert)
                {
                    healmenu = false;
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                }
                
                if (advance)
                {
                    advancecounter++;
                    used_itemr = itemlist[selected_index];
                    last_used_indexr = selected_index;
                    PARTYMEMBER1.flashalpha = 0;
                    PARTYMEMBER2.flashalpha = 0;
                    PARTYMEMBER3.flashalpha = 0;
                    
                    if (healoption == 0)
                        itemtargetr = PARTYMEMBER1;
                    else if (healoption == 1)
                        itemtargetr = PARTYMEMBER2;
                    else if (healoption == 2)
                        itemtargetr = PARTYMEMBER3;
                    
                    audio_play_sound(snd_select, 1, false);
                    ralseiitem = true;
                    ralseiselected = false;
                    ralseimenuaccessible = false;
                    ralseibattleicon = 3;
                    healoption = 0;
                    ralseiswitch = true;
                    
                    for (var i = selected_index; i < (array_length(itemlist) - 1); i++)
                        itemlist[i] = itemlist[i + 1];
                    
                    itemlist[array_length(itemlist) - 1] = empty;
                    itemsection = 0;
                    itemcolumns = 0;
                    itemrows = 0;
                }
            }
            
            if (!healmenu)
            {
                if (left)
                    itemcolumns--;
                else if (right)
                    itemcolumns++;
                
                if (down)
                {
                    if (itemrows == 2 && itemsection == 0)
                    {
                        itemrows = 0;
                        itemsection = 1;
                    }
                    else
                    {
                        itemrows++;
                    }
                }
                
                if (up)
                {
                    if (itemrows == 0 && itemsection == 1)
                    {
                        itemrows = 2;
                        itemsection = 0;
                    }
                    else
                    {
                        itemrows--;
                    }
                }
            }
            else
            {
                if (up)
                {
                    flashpercent = 0;
                    audio_play_sound(snd_menumove, 1, false);
                    
                    if (!(healoption == 0))
                        healoption--;
                    else
                        healoption = 2;
                }
                else if (down)
                {
                    flashpercent = 0;
                    audio_play_sound(snd_menumove, 1, false);
                    
                    if (!(healoption == 2))
                        healoption++;
                    else
                        healoption = 0;
                }
                
                healoption = clamp(healoption, 0, 2);
            }
            
            if (((itemsection * 6) + (itemrows * 2) + itemcolumns) >= max_selectable_items)
            {
                itemcolumns = max(0, itemcolumns - 1);
                itemrows = max(0, itemrows - 1);
            }
            
            if (advancecounter < 6)
                itemsection = clamp(itemsection, 0, 1);
            else
                itemsection = clamp(itemsection, 0, 0);
            
            itemcolumns = clamp(itemcolumns, 0, 1);
            itemrows = clamp(itemrows, 0, 2);
            
            if (itemcolumns == 0)
                itemx = cx + 18;
            else if (itemcolumns == 1)
                itemx = cx + 238;
            
            if (itemrows == 0)
                itemy = cy + 393;
            else if (itemrows == 1)
                itemy = cy + 423;
            else if (itemrows == 2)
                itemy = cy + 453;
        }
        else if (ralseimenuoptions == 3 && advancecounter >= 12)
        {
            ralseiselected = false;
        }
        
        if (revert)
        {
            if (ralseiactselected)
            {
                audio_play_sound(snd_menumove, 1, false);
                ralseiactselected = false;
                ralseiselected = false;
                ralseiactoptions = 0;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
            else
            {
                audio_play_sound(snd_menumove, 1, false);
                ralseiselected = false;
                ralseiactoptions = 0;
                itemsection = 0;
                itemcolumns = 0;
                itemrows = 0;
            }
        }
    }
}

ralseimenuoptions = clamp(ralseimenuoptions, 1, 5);

if (PARTYMEMBER1.sprite_index == spr_kris_act && PARTYMEMBER1.image_index >= 6 && (krisacting || krismercy))
    PARTYMEMBER1.image_speed = 0;

if (PARTYMEMBER1.image_index == 5 && PARTYMEMBER1.sprite_index == spr_kris_defend)
    PARTYMEMBER1.image_speed = 0;

if (PARTYMEMBER2.sprite_index == spr_susie_act && PARTYMEMBER2.image_index >= 8 && krisacting && krisactoptions == 1)
    PARTYMEMBER2.image_speed = 0;

if (PARTYMEMBER3.sprite_index == spr_ralsei_act && PARTYMEMBER3.image_index >= 8 && krisacting && krisactoptions == 1)
    PARTYMEMBER3.image_speed = 0;

if (PARTYMEMBER1.sprite_index == spr_kris_downed && !krisdown)
{
    PARTYMEMBER1.sprite_index = spr_kris_idle;
    PARTYMEMBER1.image_speed = 1;
}

if (PARTYMEMBER2.sprite_index == spr_susie_downed && !susiedown)
{
    PARTYMEMBER2.sprite_index = spr_susie_idle;
    PARTYMEMBER2.image_speed = 1;
}

if (PARTYMEMBER3.sprite_index == spr_ralsei_downed && !ralseidown)
{
    PARTYMEMBER3.sprite_index = spr_ralsei_idle;
    PARTYMEMBER3.image_speed = 1;
}

if (PARTYMEMBER2.sprite_index == spr_susie_act && PARTYMEMBER2.image_index >= 8 && susieacting)
    PARTYMEMBER2.image_speed = 0;

if (PARTYMEMBER3.sprite_index == spr_ralsei_act && PARTYMEMBER3.image_index >= 8 && ralseiacting)
    PARTYMEMBER3.image_speed = 0;

if (instance_exists(SOUL))
{
    if (SOUL.hurting && !global.alldown)
    {
        hurttimer++;
        global.nohit = false;
        
        if (global.onetap)
        {
            global.krishp = -999;
            global.susiehp = -999;
            global.ralseihp = -999;
            PARTYMEMBER1.image_speed = 0;
            PARTYMEMBER2.image_speed = 0;
            PARTYMEMBER3.image_speed = 0;
        }
        
        if (SOUL.hurtchoice == 1)
        {
            PAINCHOICE = PARTYMEMBER1;
            PAINHP = global.krishp;
        }
        else if (SOUL.hurtchoice == 2)
        {
            PAINCHOICE = PARTYMEMBER2;
            PAINHP = global.susiehp;
        }
        else if (SOUL.hurtchoice == 3)
        {
            PAINCHOICE = PARTYMEMBER3;
            PAINHP = global.ralseihp;
        }
        
        switch (hurttimer)
        {
            case 0:
                audio_play_sound(snd_hurt1, 2, false);
                
                if (!SOUL.invulnerable)
                {
                    PAINCHOICE.x -= 20;
                    var hurtvalue = 48;
                    var megahurt = 86;
                    
                    if ((SOUL.hurtchoice == 1 && !krisdown) || global.alldown)
                    {
                        if (!krisdefend)
                        {
                            if (global.krishp > hurtvalue)
                            {
                                global.krishp -= hurtvalue;
                                var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                                damage.value = hurtvalue;
                            }
                            else
                            {
                                global.krishp -= megahurt;
                                var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                                damage.value = megahurt;
                                damage.down = true;
                                krisdown = true;
                                SOUL.downupdate = true;
                            }
                        }
                        else if (global.krishp > (hurtvalue - 10))
                        {
                            global.krishp -= (hurtvalue - 10);
                            var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                            damage.value = hurtvalue - 10;
                        }
                        else
                        {
                            global.krishp -= (megahurt - 10);
                            var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                            damage.value = megahurt - 10;
                            damage.down = true;
                            krisdown = true;
                            SOUL.downupdate = true;
                        }
                    }
                    else if (SOUL.hurtchoice == 2 && !susiedown)
                    {
                        if (!susiedefend)
                        {
                            if (global.susiehp > hurtvalue)
                            {
                                global.susiehp -= hurtvalue;
                                var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                                damage.value = hurtvalue;
                                susiemagic = false;
                                PARTYMEMBER2.specialrude = false;
                            }
                            else
                            {
                                global.susiehp -= megahurt;
                                var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                                damage.value = megahurt;
                                damage.down = true;
                                susiedown = true;
                                susiemagic = false;
                                PARTYMEMBER2.specialrude = false;
                                SOUL.downupdate = true;
                            }
                        }
                        else if (global.susiehp > (hurtvalue - 10))
                        {
                            global.susiehp -= (hurtvalue - 10);
                            var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                            damage.value = hurtvalue - 10;
                        }
                        else
                        {
                            global.susiehp -= (megahurt - 10);
                            var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                            damage.value = megahurt - 10;
                            damage.down = true;
                            susiedown = true;
                            SOUL.downupdate = true;
                        }
                    }
                    else if (SOUL.hurtchoice == 3 && !ralseidown)
                    {
                        if (!ralseidefend)
                        {
                            if (global.ralseihp > hurtvalue)
                            {
                                global.ralseihp -= hurtvalue;
                                var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                                damage.value = hurtvalue;
                            }
                            else
                            {
                                global.ralseihp -= megahurt;
                                var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                                damage.value = megahurt;
                                damage.down = true;
                                ralseidown = true;
                                SOUL.downupdate = true;
                            }
                        }
                        else if (global.ralseihp > (hurtvalue - 10))
                        {
                            global.ralseihp -= (hurtvalue - 10);
                            var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                            damage.value = hurtvalue - 10;
                        }
                        else
                        {
                            global.ralseihp -= (megahurt - 10);
                            var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                            damage.value = megahurt - 10;
                            damage.down = true;
                            ralseidown = true;
                            SOUL.downupdate = true;
                        }
                    }
                }
                
                break;
            case 1:
                PAINCHOICE.x += 5;
                camera_set_view_pos(view_camera[0], 24, 24);
                break;
            case 2:
                PAINCHOICE.x += 5;
                camera_set_view_pos(view_camera[0], 16, 16);
                break;
            case 3:
                PAINCHOICE.x += 5;
                camera_set_view_pos(view_camera[0], 23, 23);
                break;
            case 4:
                PAINCHOICE.x += 5;
                camera_set_view_pos(view_camera[0], 18, 18);
                break;
            default:
                camera_set_view_pos(view_camera[0], 20, 20);
                break;
        }
    }
    else
    {
        hurttimer = -1;
        
        if (!krisdown)
        {
            if (!krisdefend)
                PARTYMEMBER1.sprite_index = spr_kris_idle;
            else
                PARTYMEMBER1.sprite_index = spr_kris_defend;
        }
        
        if (!susiedown && !PARTYMEMBER2.specialrude)
        {
            if (susiemagic && !instance_exists(obj_bulletboard_sof))
                PARTYMEMBER2.sprite_index = spr_susie_magic;
            else if (!susiedefend)
                PARTYMEMBER2.sprite_index = spr_susie_idle;
            else
                PARTYMEMBER2.sprite_index = spr_susie_defend;
        }
        
        if (!ralseidown)
        {
            if (!ralseidefend)
                PARTYMEMBER3.sprite_index = spr_ralsei_idle;
            else
                PARTYMEMBER3.sprite_index = spr_ralsei_defend;
        }
    }
}

if (!krismenuaccessible && battlebegun)
{
    percentdownk += (1/3);
    percentupk = 0;
    var position1 = animcurve_channel_evaluate(curveslower, percentdownk);
    var delta_down_y = (cy + 272) - (cy + 240);
    pos_y2 = cy + 240 + (delta_down_y * position1);
}
else if (krismenuaccessible && battlebegun)
{
    percentupk += 0.14285714285714285;
    percentdownk = 0;
    
    if (percentupk == 0.14285714285714285)
    {
    }
    
    var position2 = animcurve_channel_evaluate(curveslower, percentupk);
    var delta_rise_y = (cy + 240) - (cy + 272);
    pos_y2 = cy + 272 + (delta_rise_y * position2);
}

if (!susiemenuaccessible && battlebegun)
{
    percentdowns += (1/3);
    percentups = 0;
    var positions1 = animcurve_channel_evaluate(curveslower, percentdowns);
    var delta_down_ys = (cy + 272) - (cy + 240);
    pos_y2s = cy + 240 + (delta_down_ys * positions1);
}
else if (susiemenuaccessible && battlebegun)
{
    percentups += 0.14285714285714285;
    percentdowns = 0;
    var positions2 = animcurve_channel_evaluate(curveslower, percentups);
    var delta_rise_ys = (cy + 240) - (cy + 272);
    pos_y2s = cy + 272 + (delta_rise_ys * positions2);
}

if (!ralseimenuaccessible && battlebegun)
{
    percentdownr += (1/3);
    percentupr = 0;
    var positionr1 = animcurve_channel_evaluate(curveslower, percentdownr);
    var delta_down_yr = (cy + 272) - (cy + 240);
    pos_y2r = cy + 240 + (delta_down_yr * positionr1);
}
else if (ralseimenuaccessible && battlebegun)
{
    percentupr += 0.14285714285714285;
    percentdownr = 0;
    var positionr2 = animcurve_channel_evaluate(curveslower, percentupr);
    var delta_rise_yr = (cy + 240) - (cy + 272);
    pos_y2r = cy + 272 + (delta_rise_yr * positionr2);
}

if (global.endofbattle)
{
    endtimer++;
    
    if (endtimer == 0)
    {
        window_set_caption(lang("obj_battle_sof_Draw_73_86"));
        audio_sound_gain(mus_harmonious_foane, 0, 500);
        audio_sound_gain(mus_foanebattle_old, 0, 500);
    }
    
    if (endtimer == 30)
    {
        audio_stop_sound(mus_harmonious_foane);
        audio_stop_sound(mus_foanebattle_old);
    }
    
    if (endtimer >= 30 && endtimer <= 60)
    {
        ENEMY1.floatmultiplier -= 0.016666666666666666;
        ENEMY1.floatmultiplier = clamp(ENEMY1.floatmultiplier, 0.5, 1);
        ENEMY1.image_speed -= 0.016666666666666666;
        ENEMY1.image_speed = clamp(ENEMY1.image_speed, 0.5, 1);
    }
    
    if (endtimer == 60)
    {
        enemydialogue = -7;
        textenemy = true;
        reset_dialogue_normal();
    }
    
    if (endtimer >= 60)
    {
        ENEMY1.floatmultiplier -= 0.016666666666666666;
        ENEMY1.floatmultiplier = clamp(ENEMY1.floatmultiplier, -1, 1);
    }
}

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (global.enemyturn)
{
    soulsubimg++;
    soulsubimgback = -1;
    
    if (soulsubimg <= 6)
        draw_sprite_ext(spr_SOUL_jumpout, soulsubimg, PARTYMEMBER1.x - 12, PARTYMEMBER1.y + 12, 1, 1, 0, c_white, 1);
    
    if (soulsubimg == 0)
    {
        if (!global.endofbattle)
            instance_create_depth(cam_x + 320, cam_y + 170, PARTYMEMBER1.depth - 3, obj_bulletboard_sof);
        else
            instance_create_depth(cam_x + 320, cam_y + 170, PARTYMEMBER1.depth - 3, obj_bulletboard_sof_end);
        
        instance_create_depth(PARTYMEMBER1.x - 12, PARTYMEMBER1.y + 12, PARTYMEMBER1.depth - 4, SOUL);
        SOUL.ENGINETARGET = ENGINE;
    }
}
else
{
    soulsubimgback++;
    
    if (global.turn > 1 && soulsubimgback <= 6)
        draw_sprite_ext(spr_SOUL_jumpout, soulsubimgback, PARTYMEMBER1.x - 12, PARTYMEMBER1.y + 12, 1, 1, 0, c_white, 1);
}

if (textmenu)
{
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    
    if (charactertalking)
    {
    }
    
    var text_x, text_y;
    
    if (!(menudialogue == 1300))
    {
        text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 134) : (camera_get_view_x(view_camera[0]) + 30);
        
        if (dialoguebottom)
            text_y = camera_get_view_y(view_camera[0]) + 376;
        else if (dialoguetop)
            text_y = camera_get_view_y(view_camera[0]) + 30;
    }
    
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    
    if (!destroy)
    {
        draw_text_color(text_x + 1, text_y + 1, displayed_text, shadow_color1, shadow_color1, shadow_color, shadow_color, 1);
        draw_set_color(c_white);
        draw_text(text_x, text_y, displayed_text);
    }
    
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    
    switch (menudialogue)
    {
        case 1:
            randomize();
            texttalk = true;
            dialogueicon = 1;
            
            if (finalrequirement)
            {
                current_dialogue = format_text(lang("obj_battle_sof_Draw_73_87"), 31);
            }
            else if (global.turn == 1)
            {
                current_dialogue = format_text(lang("obj_battle_sof_Draw_73_88"), 31);
            }
            else
            {
                susietalk = false;
                charactertalking = false;
                
                switch (randompick)
                {
                    case 1:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_89"), 31);
                        break;
                    case 2:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_90"), 31);
                        break;
                    case 3:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_91"), 31);
                        break;
                    case 4:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_92"), 31);
                        break;
                    case 5:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_93"), 31);
                        break;
                    case 6:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_94"), 31);
                        break;
                    case 7:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_95"), 31);
                        break;
                    case 8:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_96"), 31);
                        break;
                    case 9:
                        current_dialogue = format_text(lang("obj_battle_sof_Draw_73_97"), 31);
                        break;
                    default:
                        current_dialogue = lang("obj_battle_sof_Draw_73_98");
                        break;
                }
            }
            
            typing_speed = 1;
            break;
        default:
            current_dialogue = lang("obj_battle_sof_Draw_73_99");
            break;
    }
    
    if (destroy)
        blockprogress = true;
    
    if (!text_complete && !pause_for_punctuation)
    {
        typing_timer += typing_speed;
        
        while (typing_timer >= 1)
        {
            typing_timer -= 1;
            
            if (letter_index < string_length(current_dialogue))
            {
                var next_char = string_char_at(current_dialogue, letter_index + 1);
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : lang("obj_battle_sof_Draw_73_100");
                
                if (next_char == " " && following_char == " ")
                {
                    displayed_text += "  ";
                    letter_index += 2;
                }
                else
                {
                    displayed_text += next_char;
                    
                    if ((next_char == "," || next_char == ":") || next_char == ".")
                    {
                        alarm[0] = 4;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char == "}" || next_char == "{" || next_char == "@")
                    {
                        alarm[0] = 10;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char != " " && next_char != "*" && next_char != "?" && displayed_text != "*")
                    {
                        if (tennatalk)
                            audio_play_sound(snd_tenna, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.7);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (emptytalk)
                            audio_play_sound(snd_empty, 1, false);
                    }
                    
                    letter_index += 1;
                }
            }
            else
            {
                text_complete = true;
                break;
            }
        }
    }
    
    if (!pause_for_punctuation && advance_pressed && !blockprogress)
    {
        if (text_complete)
        {
            if (menudialogue == 100)
            {
                textmenu = false;
            }
            else
            {
            }
        }
    }
    else if (!pause_for_punctuation && skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
}

if (textenemy)
{
    draw_set_font(fFight);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var advance_pressed, skip_pressed;
    
    if (!global.finaltalk)
    {
        advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
        skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    }
    else
    {
        advance_pressed = 0;
        skip_pressed = 0;
    }
    
    charactertalking = false;
    
    switch (enemydialogue)
    {
        case 1:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_101"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 6;
            break;
        case 2:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_102"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 0;
            break;
        case 3:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_103"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 7;
            break;
        case 4:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_104"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 0;
            break;
        case 5:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_105"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 6:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_106"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 7:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_107"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 8:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_108"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 9:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_109"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 6;
            break;
        case 10:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_110"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 6;
            break;
        case 11:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_111"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 0;
            break;
        case 12:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_112"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 6;
            break;
        case 13:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_113"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 0;
            break;
        case 14:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_114"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 15:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_115"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 16:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_116"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 17:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_117"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 18:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_118"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 6;
            break;
        case 19:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_119"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 20:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_120"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 21:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_121"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 22:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_122"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 23:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_123"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 24:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_124"), 17 + dialoguexoffset);
            typing_speed = 1;
            dialoguexoffset = 8;
            break;
        case 25:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_125"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 26:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_126"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case 27:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_127"), 17 + dialoguexoffset);
            typing_speed = 1;
            
            if (text_complete == true)
            {
                blockprogress = false;
                advance_pressed = true;
            }
            
            break;
        case 28:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_128"), 17 + dialoguexoffset);
            typing_speed = 1;
            d29timer++;
            
            if (d29timer == 0)
            {
                audio_play_sound(snd_phone, 1, false);
                ENEMY1.sprite_index = spr_foane_ex_surprise;
                blockprogress = true;
                audio_sound_gain(mus_harmonious_foane, 0, 1000);
                audio_sound_gain(mus_foanebattle_old, 0, 1000);
            }
            
            if (d29timer == 50)
            {
                blockprogress = false;
                advance_pressed = true;
            }
            
            break;
        case 29:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_129"), 17 + dialoguexoffset);
            typing_speed = 1;
            blockprogress = false;
            break;
        case 30:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_130"), 17 + dialoguexoffset);
            typing_speed = 1;
            d31timer++;
            
            if (d31timer == 0)
                blockprogress = true;
            
            if (d31timer == 80)
            {
                blockprogress = false;
                advance_pressed = true;
            }
            
            ENEMY1.sprite_index = spr_foane_ex_holdup;
            break;
        case 31:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_131"), 17 + dialoguexoffset);
            typing_speed = 1;
            blockprogress = false;
            audio_sound_gain(mus_harmonious_foane, 1, 1000);
            audio_sound_gain(mus_foanebattle_old, 1, 1000);
            ENEMY1.sprite_index = spr_foane_ex_bruh;
            break;
        case -7:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_132"), 17 + dialoguexoffset);
            typing_speed = 1;
            global.enemyturn = false;
            soulsubimg = -1;
            break;
        case -6:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_133"), 17 + dialoguexoffset);
            typing_speed = 1;
            global.finaltalk = true;
            break;
        case -5:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_134"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case -4:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_135"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case -3:
            tennatalk = true;
            dialoguebubblexscale = 1;
            current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_136"), 17 + dialoguexoffset);
            typing_speed = 1;
            break;
        case -2:
            tennatalk = true;
            dialoguebubblexscale = 1;
            
            if (songchoice == oldchoice && global.c3signalcompleted)
                current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_137"), 17 + dialoguexoffset);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sof_Draw_73_138"), 17 + dialoguexoffset);
            
            typing_speed = 1;
            break;
    }
    
    var end_cases;
    
    if (enemydialogue > 31)
    {
        tennatalk = true;
        miketalk = false;
        susietalk = false;
        texttalk = false;
        dialoguebubblexscale = 1;
        textxoffset = -34;
        textyoffset = -120;
        current_dialogue = format_text_battle(string(tennatext), 17);
        dialoguexoffset = 1;
        typing_speed = 1;
        end_cases = [];
        var total = 3000;
        
        for (var n = 1; n <= total; n++)
            array_push(end_cases, (1 * n) + 31);
    }
    else
    {
        end_cases = [2, 3, 5, 7, 10, 12, 13, 15, 17, 19, 21, 23, 26, 31];
    }
    
    var text_x = ((ENEMYinitialx - 210) + textxoffset) - (9 * dialoguexoffset);
    var text_y = ENEMY1.yy + 10 + 16 + textyoffset;
    var blankdialogue = [28, 30];
    
    if (!array_contains(blankdialogue, enemydialogue))
    {
        if (dialoguebubblexscale == 1)
        {
            draw_sprite_ext(spr_c3_dialoguebubble_2, 0, ((ENEMYinitialx - 20) + textxoffset) - (9 * dialoguexoffset), ENEMY1.yy + 62 + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
            draw_sprite_ext(spr_c3_dialoguebubble_2, 1, ((ENEMYinitialx - 20) + textxoffset) - (9 * dialoguexoffset), ENEMY1.yy + 62 + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
            draw_sprite_ext(spr_c3_dialoguebubble_2, 2, (ENEMYinitialx - 20) + textxoffset, ENEMY1.yy + 62 + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
            draw_sprite_ext(spr_c3_dialoguebubble_2, 3, (ENEMYinitialx - 20) + textxoffset, ENEMY1.yy + 62 + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
            draw_sprite_ext(spr_c3_dialoguebubble_2, 4, ((ENEMYinitialx - 20) + textxoffset) - ((9 * dialoguexoffset) / 2), ENEMY1.yy + 62 + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(spr_c3_dialoguebubble, 0, (ENEMYinitialx - 240) + textxoffset, ENEMY1.yy + 62 + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
        }
    }
    
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    draw_set_color(c_black);
    draw_text(text_x, text_y, displayed_text);
    
    if (destroy)
        blockprogress = true;
    
    if (!text_complete && !pause_for_punctuation)
    {
        typing_timer += typing_speed;
        
        while (typing_timer >= 1)
        {
            typing_timer -= 1;
            
            if (letter_index < string_length(current_dialogue))
            {
                var next_char = string_char_at(current_dialogue, letter_index + 1);
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : lang("obj_battle_sof_Draw_73_139");
                
                if (next_char == " " && following_char == " ")
                {
                    displayed_text += "  ";
                    letter_index += 2;
                }
                else
                {
                    if (next_char == "@" || next_char == "}" || next_char == "{")
                    {
                        alarm[0] = 10;
                        pause_for_punctuation = true;
                        
                        if (next_char == "@")
                            displayed_text += ".";
                        
                        if (next_char == "}")
                            displayed_text += "?";
                        
                        if (next_char == "{")
                            displayed_text += "!";
                        
                        letter_index += 1;
                        break;
                    }
                    
                    displayed_text += next_char;
                    
                    if (next_char == "," || next_char == ":" || next_char == ".")
                    {
                        alarm[0] = 4;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char != " " && next_char != "*" && next_char != "?")
                    {
                        if (tennatalk)
                            audio_play_sound(snd_foane, 1, false, 0.31, false, 1);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.7);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (emptytalk)
                            audio_play_sound(snd_empty, 1, false);
                    }
                    
                    letter_index += 1;
                }
            }
            else
            {
                text_complete = true;
                break;
            }
        }
    }
    
    if ((advance_pressed && !blockprogress) || (skiptimer == 2 && !blockprogress))
    {
        flashpercent = 0;
        PARTYMEMBER1.flashalpha = 0;
        PARTYMEMBER2.flashalpha = 0;
        PARTYMEMBER3.flashalpha = 0;
        
        if (text_complete)
        {
            if (array_contains(end_cases, enemydialogue))
            {
                textenemy = false;
                global.enemyturn = true;
                enemydialogue += 1;
                enemydialoguecount += 1;
                texttalk = true;
                tennatalk = false;
                miketalk = false;
                
                if (enemydialogue == 32)
                {
                }
            }
            else
            {
                enemydialogue += 1;
                reset_dialogue_normal();
                enemydialoguecount += 1;
            }
        }
    }
    else if ((skip_pressed && !advance_pressed && !blockprogress) || (skiptimer == 1 && !blockprogress))
    {
        displayed_text = format_text_replacements(current_dialogue);
        text_complete = true;
        audio_stop_sound(snd_tenna);
        audio_stop_sound(snd_mike);
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
}

if (enemydialogue >= 1)
{
    if (keyboard_check(ord("C")) && !blockprogress)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
    {
        skiptext = false;
        skiptimer = 0;
    }
    
    if (skiptext && !blockprogress)
        skiptimer++;
}
else
{
    skiptext = false;
    skiptimer = 0;
}

if (textact)
{
    flashresettimer++;
    
    if (flashresettimer == 0)
    {
        flashpercent = 0;
        ENEMY1.flashalpha = 0;
    }
    
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 146) : (camera_get_view_x(view_camera[0]) + 30);
    var text_y = camera_get_view_y(view_camera[0]) + 376;
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    
    if (!destroy)
    {
        draw_text_color(text_x + 1, text_y + 1, displayed_text, shadow_color1, shadow_color1, shadow_color, shadow_color, 1);
        draw_set_color(c_white);
        draw_text(text_x, text_y, displayed_text);
    }
    
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    
    if (ACTNAME == lang("obj_battle_sof_Draw_73_140"))
    {
        if (ds_map_exists(global.item_data, used_itemk))
        {
            var item_entry = ds_map_find_value(global.item_data, used_itemk);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = lang("obj_battle_sof_Draw_73_141");
        }
        
        switch (itemtargetk)
        {
            case PARTYMEMBER1:
                PARTYMEMBER1.itemchoice = used_itemk;
                break;
            case PARTYMEMBER2:
                PARTYMEMBER2.itemchoice = used_itemk;
                break;
            case PARTYMEMBER3:
                PARTYMEMBER3.itemchoice = used_itemk;
                break;
        }
    }
    else if (ACTNAME == lang("obj_battle_sof_Draw_73_142"))
    {
        if (ds_map_exists(global.item_data, used_items))
        {
            var item_entry = ds_map_find_value(global.item_data, used_items);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = lang("obj_battle_sof_Draw_73_143");
        }
        
        switch (itemtargets)
        {
            case PARTYMEMBER1:
                PARTYMEMBER1.itemchoice = used_items;
                break;
            case PARTYMEMBER2:
                PARTYMEMBER2.itemchoice = used_items;
                break;
            case PARTYMEMBER3:
                PARTYMEMBER3.itemchoice = used_items;
                break;
        }
    }
    else if (ACTNAME == lang("obj_battle_sof_Draw_73_144"))
    {
        if (ds_map_exists(global.item_data, used_itemr))
        {
            var item_entry = ds_map_find_value(global.item_data, used_itemr);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = lang("obj_battle_sof_Draw_73_145");
        }
        
        switch (itemtargetr)
        {
            case PARTYMEMBER1:
                PARTYMEMBER1.itemchoice = used_itemr;
                break;
            case PARTYMEMBER2:
                PARTYMEMBER2.itemchoice = used_itemr;
                break;
            case PARTYMEMBER3:
                PARTYMEMBER3.itemchoice = used_itemr;
                break;
        }
    }
    
    susietalk = false;
    charactertalking = false;
    
    switch (actdialogue)
    {
        case 1:
            randomize();
            texttalk = true;
            dialogueicon = 1;
            
            if (krisactoptions == 0 && krisacting)
            {
                current_dialogue = format_text(lang("obj_battle_sof_Draw_73_146"), 31);
            }
            else if (krismercy || susiemercy || ralseimercy)
            {
                current_dialogue = format_text(string(ACTNAME) + lang("obj_battle_sof_Draw_73_147"), 60);
            }
            else if (krisitem || susieitem || ralseiitem)
            {
                current_dialogue = format_text(string(ACTNAME) + lang("obj_battle_sof_Draw_73_148") + string(itemfullname) + lang("obj_battle_sof_Draw_73_149"), 31);
            }
            else if (susiemagic && !(susieactoptions == 0 && jammed))
            {
                if (susieactoptions == 0)
                    current_dialogue = format_text(lang("obj_battle_sof_Draw_73_150"), 31);
                else if (susieactoptions == 1)
                    current_dialogue = format_text(lang("obj_battle_sof_Draw_73_151"), 31);
            }
            else if (ralseimagic)
            {
                if (ralseiactoptions == 0)
                    current_dialogue = lang("obj_battle_sof_Draw_73_152");
                else if (ralseiactoptions == 1)
                    current_dialogue = format_text(lang("obj_battle_sof_Draw_73_153"), 31);
            }
            else
            {
                current_dialogue = format_text(lang("obj_battle_sof_Draw_73_154"), 31);
            }
            
            typing_speed = 1;
            break;
        case 2:
            texttalk = false;
            tennatalk = true;
            
            if (!(global.turn >= 7))
                charactertalking = true;
            
            if (krisactoptions == 1)
            {
                if (global.turn >= 7)
                {
                    charactertalking = false;
                    current_dialogue = format_text(lang("obj_battle_sof_Draw_73_155"), 28);
                }
                else
                {
                    switch (reason)
                    {
                        case 1:
                            dialogueicon = 2;
                            current_dialogue = format_text(lang("obj_battle_sof_Draw_73_156"), 28);
                            break;
                        case 2:
                            dialogueicon = 14;
                            current_dialogue = format_text(lang("obj_battle_sof_Draw_73_157"), 28);
                            break;
                        case 3:
                            dialogueicon = 4;
                            current_dialogue = format_text(lang("obj_battle_sof_Draw_73_158"), 28);
                            break;
                        case 4:
                            dialogueicon = 4;
                            current_dialogue = format_text(lang("obj_battle_sof_Draw_73_159"), 28);
                            break;
                        case 5:
                            dialogueicon = 1;
                            current_dialogue = format_text(lang("obj_battle_sof_Draw_73_160"), 28);
                            break;
                        case 6:
                            dialogueicon = 9;
                            current_dialogue = format_text(lang("obj_battle_sof_Draw_73_161"), 28);
                            break;
                        default:
                            break;
                    }
                }
            }
            
            break;
        default:
            current_dialogue = lang("obj_battle_sof_Draw_73_162");
            break;
    }
    
    if (charactertalking)
    {
    }
    
    if (destroy)
        blockprogress = true;
    
    if (!text_complete && !pause_for_punctuation)
    {
        typing_timer += typing_speed;
        
        while (typing_timer >= 1)
        {
            typing_timer -= 1;
            
            if (letter_index < string_length(current_dialogue))
            {
                var next_char = string_char_at(current_dialogue, letter_index + 1);
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : lang("obj_battle_sof_Draw_73_163");
                
                if (next_char == " " && following_char == " ")
                {
                    displayed_text += "  ";
                    letter_index += 2;
                }
                else
                {
                    if (next_char == "@" || next_char == "}" || next_char == "{" || next_char == ";")
                    {
                        alarm[0] = 10;
                        pause_for_punctuation = true;
                        
                        if (next_char == "@")
                            displayed_text += ".";
                        
                        if (next_char == "}")
                            displayed_text += "?";
                        
                        if (next_char == "{")
                            displayed_text += "!";
                        
                        if (next_char == ";")
                            displayed_text += ";";
                        
                        letter_index += 1;
                        break;
                    }
                    
                    displayed_text += next_char;
                    
                    if (next_char == "," || next_char == ":" || next_char == ".")
                    {
                        alarm[0] = 4;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char != " " && next_char != "*" && next_char != "?")
                    {
                        if (tennatalk)
                            audio_play_sound(snd_tenna, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.7);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (emptytalk)
                            audio_play_sound(snd_empty, 1, false);
                    }
                    
                    letter_index += 1;
                }
            }
            else
            {
                text_complete = true;
                break;
            }
        }
    }
    
    var end_cases;
    
    if (krisitem || susieitem || ralseiitem || global.endofbattle)
        end_cases = [1];
    else if (susiemagic && !(susieactoptions == 0 && jammed))
        end_cases = [1];
    else if (krisactoptions == 0)
        end_cases = [1];
    else
        end_cases = [1];
    
    var textx = camera_get_view_x(view_camera[0]) + 30;
    var texty = camera_get_view_y(view_camera[0]) + 376;
    
    if (actdialogue == 1 && (krismercy || susiemercy || ralseimercy))
    {
        var text_parts = string_split(current_dialogue, lang("obj_battle_sof_Draw_73_164"));
        var x_offset = textx;
        var y_offset = texty;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, lang("obj_battle_sof_Draw_73_165"));
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                draw_text(x_offset, y_offset, line);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = textx;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 6);
                
                switch (i + 1)
                {
                    default:
                        var color = 8388736;
                        break;
                }
                
                draw_set_color(#323200);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(c_white);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, c_yellow, c_yellow, 1);
                x_offset += string_width(remaining);
                
                if (string_pos(lang("obj_battle_sof_Draw_73_166"), remaining) > 0)
                {
                    x_offset = textx;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    else if (ralseiactoptions == 0)
    {
        var text_parts = string_split(current_dialogue, lang("obj_battle_sof_Draw_73_167"));
        var x_offset = textx;
        var y_offset = texty;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, lang("obj_battle_sof_Draw_73_168"));
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                draw_text(x_offset, y_offset, line);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = textx;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 5);
                var color;
                
                switch (i + 1)
                {
                    default:
                        color = 8388736;
                        break;
                }
                
                draw_set_color(#03037D);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, c_blue, c_blue, 1);
                x_offset += string_width(remaining);
                
                if (string_pos(lang("obj_battle_sof_Draw_73_169"), remaining) > 0)
                {
                    x_offset = textx;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if ((!pause_for_punctuation && advance_pressed && !blockprogress) && !PARTYMEMBER2.rudebuster && !(PARTYMEMBER3.sprite_index == spr_ralsei_magic) && !(PARTYMEMBER1.sprite_index == spr_kris_item && PARTYMEMBER1.image_speed == 1) && !(PARTYMEMBER2.sprite_index == spr_susie_item) && !(PARTYMEMBER3.sprite_index == spr_ralsei_item && PARTYMEMBER3.image_speed == 1))
    {
        if (text_complete)
        {
            flashpercent = 0;
            ENEMY1.flashalpha = 0;
            
            if (array_contains(end_cases, actdialogue))
            {
                textact = false;
                progressfinal = true;
                reset_dialogue_normal();
                charactertalking = false;
                tennatalk = false;
                miketalk = false;
                texttalk = true;
                actdialogue = 1;
                
                if (ACTNAME == lang("obj_battle_sof_Draw_73_170"))
                {
                    krisacting = false;
                    krismercy = false;
                    krisitem = false;
                    krisbattleicon = 0;
                    PARTYMEMBER1.image_speed = 1;
                    
                    if (krisactoptions == 1)
                    {
                        if (!susiedown)
                        {
                            susieacting = false;
                            
                            if (!PARTYMEMBER2.specialrude)
                                susiemagic = false;
                            
                            susiemercy = false;
                            susieitem = false;
                            susiebattleicon = 0;
                            PARTYMEMBER2.image_speed = 1;
                        }
                        
                        if (!ralseidown)
                        {
                            ralseiacting = false;
                            ralseimagic = false;
                            ralseimercy = false;
                            ralseiitem = false;
                            ralseibattleicon = 0;
                            PARTYMEMBER3.image_speed = 1;
                        }
                    }
                }
                else if (ACTNAME == lang("obj_battle_sof_Draw_73_171"))
                {
                    susieacting = false;
                    
                    if (!PARTYMEMBER2.specialrude)
                        susiemagic = false;
                    
                    susiemercy = false;
                    susieitem = false;
                    susiebattleicon = 0;
                    PARTYMEMBER2.image_speed = 1;
                }
                else if (ACTNAME == lang("obj_battle_sof_Draw_73_172"))
                {
                    ralseiacting = false;
                    ralseimagic = false;
                    ralseimercy = false;
                    ralseiitem = false;
                    ralseibattleicon = 0;
                    PARTYMEMBER3.image_speed = 1;
                }
            }
            else
            {
                actdialogue += 1;
                reset_dialogue_normal();
            }
        }
    }
    else if (skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = format_text_replacements(current_dialogue);
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
}
