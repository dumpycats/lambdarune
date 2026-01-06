var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (debug)
{
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    
    if (generator1)
    {
        draw_text_ext_transformed(cx + 320, cy + 20, get_lang_string("obj_battle_sio_Draw_0_0"), 0, 640, 1, 1, 0);
        draw_text_ext_transformed(cx + 320, cy + 60, string(jamphase), 0, 640, 1, 1, 0);
    }
    
    if (generator2)
    {
        draw_text_ext_transformed(cx + 320, cy + 40, get_lang_string("obj_battle_sio_Draw_0_1"), 0, 640, 1, 1, 0);
        draw_text_ext_transformed(cx + 320, cy + 60, string(jamphase), 0, 640, 1, 1, 0);
    }
    
    if (keyboard_check_pressed(ord("U")))
    {
    }
    
    if (keyboard_check_pressed(ord("I")))
    {
    }
    
    draw_set_halign(fa_left);
}

if (instance_exists(self))
{
    if (krisdown && susiedown && ralseidown)
    {
        global.alldown = true;
        audio_stop_sound(mus_tennasiblings_boss);
        audio_group_stop_all(AUDIO_APPEARANCE);
        inputtimer = -2;
        PARTYMEMBER1.image_speed = 0;
        PARTYMEMBER2.image_speed = 0;
        PARTYMEMBER3.image_speed = 0;
    }
}

if (global.generator1hp <= 0)
    generator1 = false;

if (global.generator2hp <= 0)
    generator2 = false;

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
draw_set_color(c_white);
draw_set_font(fDeterminationMW);

if (susiemagic)
{
}

if (turnrefresh)
{
    if (jammer)
    {
        instance_create_depth(cx + 0, cy + 0, -5000, obj_jamnotif);
        jammed = true;
        jamdifficulty += 1;
        jammer = false;
    }
    
    if (jammed)
    {
        if (!generator1 && !generator2)
        {
            jamphase++;
            jamwait = 0;
            jammed = false;
        }
    }
    
    if (susiepissed)
        susiepissturn += 1;
    
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
    
    if (global.krishp >= -19)
        krismenuaccessible = true;
    else if (global.susiehp >= -19)
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
    
    randompick = irandom_range(1, 11);
    krismenuoptions = 1;
    krisactoptions = 0;
    krisitemtimer = -1;
    susiemenuoptions = 1;
    susieactoptions = 0;
    susieitemtimer = -1;
    ralseimenuoptions = 1;
    ralseiactoptions = 0;
    ralseiactoptionsvertical = 0;
    ralseiitemtimer = -1;
    itemsection = 0;
    itemcolumns = 0;
    itemrows = 0;
    reset_dialogue_normal();
    turnrefresh = false;
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
    if (jammed)
    {
        if (!generator1 && !generator2)
        {
            jamphase++;
            jamwait = 0;
            jammed = false;
        }
    }
    
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
            
            if (susieactoptions == 1)
            {
                global.tp += 50;
            }
            else if (susieactoptions == 0 && susieactoptionsvertical == 1)
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
    mercyall = round(8 + (jamphase / 1));
    mercyactionadd = round(2 + (jamphase / 1.5));
    
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
    
    if (krisdefending)
        krisdefending = false;
    
    if (susieactoptions == 1 && jammed)
        PARTYMEMBER2.specialrude = true;
    
    textxoffset = -34;
    textyoffset = -120;
    
    if (krisacting)
    {
        textmenu = false;
        textact = true;
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_2");
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
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_3");
        actdialogue = 1;
        PARTYMEMBER2.image_speed = 1;
        PARTYMEMBER2.sprite_index = spr_susie_act;
        reset_dialogue_normal();
        instance_create_depth(ENEMY1.x, ENEMY1.y, ENEMY1.depth - 1, obj_maximike_channel);
        var ms = instance_create_depth(ENEMY1.x - 50, ENEMY1.y - 30, ENEMY1.depth - 3, obj_mercynumber);
        ENEMY1.shake = true;
        ENEMY1.shaketimer = -1;
        ms.value = "+" + string(mercyactionadd) + "%";
        global.mercy += mercyactionadd;
        audio_play_sound(snd_screenglitch, 1, false);
    }
    else if (ralseiacting)
    {
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_4");
        textmenu = false;
        textact = true;
        PARTYMEMBER3.image_speed = 1;
        PARTYMEMBER3.image_index = 0;
        PARTYMEMBER3.sprite_index = spr_ralsei_act;
        reset_dialogue_normal();
        instance_create_depth(ENEMY1.x, ENEMY1.y, ENEMY1.depth - 1, obj_maximike_channel);
        var mr = instance_create_depth(ENEMY1.x - 50, ENEMY1.y - 30, ENEMY1.depth - 3, obj_mercynumber);
        ENEMY1.shake = true;
        ENEMY1.shaketimer = -1;
        mr.value = "+" + string(mercyactionadd) + "%";
        global.mercy += mercyactionadd;
        audio_play_sound(snd_screenglitch, 1, false);
    }
    else if (krismercy)
    {
        textmenu = false;
        textact = true;
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_5");
        PARTYMEMBER1.sprite_index = spr_kris_act;
        PARTYMEMBER1.image_index = 0;
        PARTYMEMBER1.image_speed = 1;
        reset_dialogue_normal();
    }
    else if (susiemercy)
    {
        textmenu = false;
        textact = true;
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_6");
        PARTYMEMBER2.sprite_index = spr_susie_act;
        PARTYMEMBER2.image_index = 0;
        PARTYMEMBER2.image_speed = 1;
        reset_dialogue_normal();
    }
    else if (ralseimercy)
    {
        textmenu = false;
        textact = true;
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_7");
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
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_8");
        reset_dialogue_normal();
    }
    else if (susieitem)
    {
        PARTYMEMBER2.image_speed = 1;
        PARTYMEMBER2.sprite_index = spr_susie_item;
        textmenu = false;
        textact = true;
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_9");
        reset_dialogue_normal();
    }
    else if (ralseiitem)
    {
        PARTYMEMBER3.image_speed = 1;
        PARTYMEMBER3.sprite_index = spr_ralsei_item;
        textmenu = false;
        textact = true;
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_10");
        reset_dialogue_normal();
    }
    else if (susiemagic && !(susieactoptions == 1 && jammed))
    {
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_11");
        textmenu = false;
        textact = true;
        PARTYMEMBER2.image_index = 0;
        PARTYMEMBER2.sprite_index = spr_susie_mercy;
        
        if (susieactoptions == 1)
            PARTYMEMBER2.rudebuster = true;
        
        reset_dialogue_normal();
    }
    else if (ralseimagic)
    {
        ACTNAME = get_lang_string("obj_battle_sio_Draw_0_12");
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
            var spawnattack = instance_create_depth(0, 0, depth - 2, ATTACK);
            
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
    
    if (enemydialogue >= 62)
    {
        randomize();
        var randomenemydialogue = irandom_range(0, 7);
        
        switch (randomenemydialogue)
        {
            case 0:
                tennatext = get_lang_string("obj_battle_sio_Draw_0_13");
                break;
            case 1:
                tennatext = get_lang_string("obj_battle_sio_Draw_0_14");
                break;
            case 2:
                tennatext = get_lang_string("obj_battle_sio_Draw_0_15");
                break;
            case 3:
                tennatext = get_lang_string("obj_battle_sio_Draw_0_16");
                break;
            case 4:
                tennatext = get_lang_string("obj_battle_sio_Draw_0_17");
                break;
            case 5:
                tennatext = get_lang_string("obj_battle_sio_Draw_0_18");
                break;
            case 6:
                tennatext = get_lang_string("obj_battle_sio_Draw_0_19");
                break;
            case 7:
                tennatext = get_lang_string("obj_battle_sio_Draw_0_20");
                break;
        }
    }
    
    if (jammed)
    {
        jamtext = get_lang_string("obj_battle_sio_Draw_0_21");
        
        if (!generator1 && !generator2)
        {
            jamphase++;
            jamwait = 0;
            jammed = false;
        }
    }
    else if (global.turn == 3)
    {
        jamtext = get_lang_string("obj_battle_sio_Draw_0_22");
    }
    else if (global.turn == 10)
    {
        jamtext = get_lang_string("obj_battle_sio_Draw_0_23");
    }
    else if (global.turn == 11)
    {
        jamtext = get_lang_string("obj_battle_sio_Draw_0_24");
    }
    else if (jamphase == 0)
    {
        randomize();
        randomtextjam = irandom_range(0, 2);
        
        switch (randomtextjam)
        {
            case 0:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_25");
                break;
            case 1:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_26");
                break;
            case 2:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_27");
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
                jamtext = get_lang_string("obj_battle_sio_Draw_0_28");
                break;
            case 1:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_29");
                break;
            case 2:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_30");
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
                jamtext = get_lang_string("obj_battle_sio_Draw_0_31");
                break;
            case 1:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_32");
                break;
            case 2:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_33");
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
                jamtext = get_lang_string("obj_battle_sio_Draw_0_34");
                break;
            case 1:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_35");
                break;
            case 2:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_36");
                break;
            case 3:
                jamtext = get_lang_string("obj_battle_sio_Draw_0_37");
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
                draw_text_transformed(cx + 424, cy + 366, get_lang_string("obj_battle_sio_Draw_0_38"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, get_lang_string("obj_battle_sio_Draw_0_39"), 1, 0.5, 0);
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
                
                draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + "%", 1, 0.5, 0);
                draw_set_color(darkred);
                draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + "%", 1, 0.5, 0);
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
                        
                        if (krisactoptions == 1 && !jammed && !susiedown && !ralseidown)
                        {
                            audio_play_sound(snd_select, 1, false);
                            krisacting = true;
                            krisactselected = false;
                            krisselected = false;
                            krismenuaccessible = false;
                            krisbattleicon = 2;
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
                            instance_create_depth(ENEMY1.x, ENEMY1.y, ENEMY1.depth - 1, obj_maximike_channel);
                            instance_create_depth(ENEMY1.x - 50, ENEMY1.y - 30, ENEMY1.depth - 3, obj_mercynumber);
                            ENEMY1.shake = true;
                            ENEMY1.shaketimer = -1;
                            obj_mercynumber.value = "+" + string(mercyall) + "%";
                            global.mercy += mercyall;
                            audio_play_sound(snd_screenglitch, 1, false);
                        }
                        else if (krisactoptions == 1)
                        {
                            audio_play_sound(snd_bump, 1, false, 2);
                        }
                    }
                    
                    draw_sprite_ext(spr_susieralsei_icon, 0, cx + 320, cx + 240, 1, 1, 0, c_white, 1);
                    draw_text(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_40"));
                    
                    if (!jammed)
                    {
                        if (!krisdown && !susiedown && !ralseidown)
                            draw_text(cx + 260, cy + 379, get_lang_string("obj_battle_sio_Draw_0_41"));
                        else
                            draw_text_color(cx + 260, cy + 379, get_lang_string("obj_battle_sio_Draw_0_42"), c_gray, c_gray, c_gray, c_gray, 1);
                    }
                    else
                    {
                        draw_text_color(cx + 260, cy + 379, get_lang_string("obj_battle_sio_Draw_0_43"), c_red, c_red, c_red, c_red, 1);
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
                    draw_text(pos[0], pos[1], "");
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
                draw_text_with_tracking(cx + 80, cy + 379, get_lang_string("obj_battle_sio_Draw_0_44"), 16777215, 0, -2);
                
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
                    draw_text_color(cx + 260, cy + 379, get_lang_string("obj_battle_sio_Draw_0_45"), c_gray, c_gray, c_gray, c_gray, 1);
                else
                    draw_text(cx + 260, cy + 379, get_lang_string("obj_battle_sio_Draw_0_46"));
                
                if (global.tp < 84)
                    draw_text_color(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_47"), c_gray, c_gray, c_gray, c_gray, 1);
                else
                    draw_text(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_48"));
                
                var saction = 16744703;
                
                if (!jammed)
                    draw_text_color(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_49"), saction, saction, saction, saction, 1);
                else
                    draw_text_color(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_50"), c_red, c_red, c_red, c_red, 1);
                
                if (susieactoptions == 1)
                {
                    draw_sprite_ext(spr_SOUL_battle, 0, cx + 238, cy + 393, 1, 1, 0, c_red, 1);
                    draw_text_color(cx + 500, cy + 379, get_lang_string("obj_battle_sio_Draw_0_51"), c_gray, c_gray, c_gray, c_gray, 1);
                    draw_text_color(cx + 500, cy + 379, get_lang_string("obj_battle_sio_Draw_0_52"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                }
                else if (susieactoptions == 0 && susieactoptionsvertical == 1)
                {
                    draw_sprite_ext(spr_SOUL_battle, 0, cx + 18, cy + 423, 1, 1, 0, c_red, 1);
                    draw_text_color(cx + 500, cy + 379, get_lang_string("obj_battle_sio_Draw_0_53"), c_gray, c_gray, c_gray, c_gray, 1);
                    draw_text_color(cx + 500, cy + 379, get_lang_string("obj_battle_sio_Draw_0_54"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                }
                else if (susieactoptions == 0)
                {
                    draw_sprite_ext(spr_SOUL_battle, 0, cx + 18, cy + 393, 1, 1, 0, c_red, 1);
                }
                
                if (left)
                {
                    susieactoptions--;
                    susieactoptionsvertical = 0;
                }
                
                if (right)
                {
                    susieactoptions++;
                    susieactoptionsvertical = 0;
                }
                
                susieactoptions = clamp(susieactoptions, 0, 1);
                
                if (up)
                {
                    susieactoptions = 0;
                    susieactoptionsvertical--;
                }
                
                if (down)
                {
                    susieactoptions = 0;
                    susieactoptionsvertical++;
                }
                
                susieactoptionsvertical = clamp(susieactoptionsvertical, 0, 1);
                
                if (advance && susieactoptions == 0 && susieactoptionsvertical == 0 && !jammed)
                {
                    audio_play_sound(snd_select, 1, false);
                    susieactselected = true;
                    advance = 0;
                }
                
                if (advance && global.tp >= 50 && susieactoptions == 1)
                {
                    audio_play_sound(snd_select, 1, false);
                    susieactselected = true;
                    advance = 0;
                }
                
                if (advance && global.tp >= 84 && susieactoptions == 0 && susieactoptionsvertical == 1)
                {
                    audio_play_sound(snd_select, 1, false);
                    susieactselected = true;
                    advance = 0;
                }
            }
            
            if (susieactselected && (susieactoptions == 1 || (susieactoptions == 0 && susieactoptionsvertical == 0)))
            {
                draw_sprite_ext(spr_SOUL_battle, 0, cx + 63, cy + 393, 1, 1, 0, c_red, 1);
                draw_set_font(fDeterminationSans);
                draw_set_halign(fa_left);
                
                if (susieactoptions == 1 && susieactoptionsvertical == 0 && jammed)
                {
                    draw_text(cx + 80, cy + 379, get_lang_string("obj_battle_sio_Draw_0_55"));
                }
                else
                {
                    draw_text(cx + 80, cy + 379, ENEMYNAME);
                    
                    if (flashpercent <= 0.5)
                        ENEMY1.flashalpha += 0.05;
                    else
                        ENEMY1.flashalpha -= 0.05;
                    
                    ENEMY1.flashalpha = clamp(ENEMY1.flashalpha, 0.25, 1);
                }
                
                draw_text_transformed(cx + 424, cy + 366, get_lang_string("obj_battle_sio_Draw_0_56"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, get_lang_string("obj_battle_sio_Draw_0_57"), 1, 0.5, 0);
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
                
                draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + "%", 1, 0.5, 0);
                draw_set_color(darkred);
                draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + "%", 1, 0.5, 0);
                draw_set_color(c_white);
                flashpercent += (1/30);
                
                if (flashpercent >= 1)
                    flashpercent = 0;
                
                if (revert)
                {
                    ENEMY1.flashalpha = 0;
                    susieactselected = false;
                    revert = 0;
                }
                
                if (advance)
                {
                    if (susieactoptions == 0 && susieactoptionsvertical == 0)
                    {
                        susieacting = true;
                        susieactselected = false;
                        susieselected = false;
                        susiemenuaccessible = false;
                        susiebattleicon = 2;
                        susieswitch = true;
                    }
                    else
                    {
                        susiemagic = true;
                        susieactselected = false;
                        susieselected = false;
                        susiemenuaccessible = false;
                        susiebattleicon = 8;
                        susieswitch = true;
                        global.tp -= 50;
                    }
                    
                    audio_play_sound(snd_select, 1, false);
                }
            }
            else if (susieactselected && susieactoptions == 0 && susieactoptionsvertical == 1)
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
                draw_text_with_tracking(cx + 80, cy + 379, get_lang_string("obj_battle_sio_Draw_0_58"), 16777215, 0, -2);
                
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
                draw_text_transformed(cx + 424, cy + 366, get_lang_string("obj_battle_sio_Draw_0_59"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, get_lang_string("obj_battle_sio_Draw_0_60"), 1, 0.5, 0);
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
                
                draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + "%", 1, 0.5, 0);
                draw_set_color(darkred);
                draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + "%", 1, 0.5, 0);
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
                    draw_text(pos[0], pos[1], "");
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
                draw_text_with_tracking(cx + 80, cy + 379, get_lang_string("obj_battle_sio_Draw_0_61"), 16777215, 0, -2);
                
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
                draw_text_transformed(cx + 424, cy + 366, get_lang_string("obj_battle_sio_Draw_0_62"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, get_lang_string("obj_battle_sio_Draw_0_63"), 1, 0.5, 0);
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
                
                draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + "%", 1, 0.5, 0);
                draw_set_color(darkred);
                draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + "%", 1, 0.5, 0);
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
                    
                    if (ralseiactoptions == 0 && ralseiactoptionsvertical == 0 && !ralseimagicselected)
                        draw_sprite_ext(spr_SOUL_battle, 0, cx + 18, cy + 393, 1, 1, 0, c_red, 1);
                    
                    if (ralseiactoptionsvertical == 1)
                        draw_sprite_ext(spr_SOUL_battle, 0, cx + 18, cy + 423, 1, 1, 0, c_red, 1);
                    
                    if (ralseiactoptions == 1 || (ralseiactoptions == 0 && ralseiactoptionsvertical == 0))
                    {
                        if (!ralseimagicselected)
                        {
                            if (ralseiactoptionsvertical == 0 && ralseiactoptions == 1)
                                draw_sprite_ext(spr_SOUL_battle, 0, cx + 238, cy + 393, 1, 1, 0, c_red, 1);
                        }
                        
                        if ((advance && !ralseimagicselected && global.tp >= 16 && ralseiactoptions == 1) || (advance && ralseiactoptions == 0 && ralseiactoptionsvertical == 0 && !ralseimagicselected && !jammed))
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
                            draw_text_transformed(cx + 424, cy + 366, get_lang_string("obj_battle_sio_Draw_0_64"), 1, 0.5, 0);
                            draw_text_transformed(cx + 524, cy + 366, get_lang_string("obj_battle_sio_Draw_0_65"), 1, 0.5, 0);
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
                            
                            draw_text_transformed(cx + 424, cy + 382, string(roundedhp) + "%", 1, 0.5, 0);
                            draw_set_color(darkred);
                            draw_text_transformed(cx + 524, cy + 382, string(global.mercy / 1) + "%", 1, 0.5, 0);
                            draw_set_color(c_white);
                            
                            if (revert)
                            {
                                ralseimagicselected = false;
                                ralseiactoptions = 0;
                                ralseiactoptionsvertical = 0;
                                revert = 0;
                            }
                            
                            if (advance)
                            {
                                audio_play_sound(snd_select, 1, false);
                                
                                if (ralseiactoptions == 1)
                                {
                                    ralseimagic = true;
                                    ralseiselected = false;
                                    ralseimenuaccessible = false;
                                    ralseibattleicon = 8;
                                    ralseiswitch = true;
                                    global.tp -= 16;
                                }
                                else if (ralseiactoptions == 0 && ralseiactoptionsvertical == 0)
                                {
                                    ralseiacting = true;
                                    ralseiselected = false;
                                    ralseimenuaccessible = false;
                                    ralseibattleicon = 2;
                                    ralseiswitch = true;
                                }
                            }
                        }
                    }
                    
                    if (ralseiactoptions == 0 && ralseiactoptionsvertical == 1)
                    {
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
                            draw_text_with_tracking(cx + 80, cy + 379, get_lang_string("obj_battle_sio_Draw_0_66"), 16777215, 0, -2);
                            
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
                        var raction = 8454016;
                        
                        if (!jammed)
                            draw_text_color(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_67"), raction, raction, raction, raction, 1);
                        else
                            draw_text_color(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_68"), c_red, c_red, c_red, c_red, 1);
                        
                        if (global.tp < 16)
                            draw_text_color(cx + 260, cy + 379, get_lang_string("obj_battle_sio_Draw_0_69"), c_gray, c_gray, c_gray, c_gray, 1);
                        else
                            draw_text(cx + 260, cy + 379, get_lang_string("obj_battle_sio_Draw_0_70"));
                        
                        if (global.tp < 32)
                            draw_text_color(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_71"), c_gray, c_gray, c_gray, c_gray, 1);
                        else
                            draw_text(cx + 30, cy + 379, get_lang_string("obj_battle_sio_Draw_0_72"));
                        
                        if (ralseiactoptions == 0 && ralseiactoptionsvertical == 0)
                        {
                        }
                        else if (ralseiactoptions == 1)
                        {
                            draw_text_color(cx + 500, cy + 379, get_lang_string("obj_battle_sio_Draw_0_73"), c_gray, c_gray, c_gray, c_gray, 1);
                            draw_text_color(cx + 500, cy + 379, get_lang_string("obj_battle_sio_Draw_0_74"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                        }
                        else if (ralseiactoptions == 0 && ralseiactoptionsvertical == 1)
                        {
                            draw_text_color(cx + 500, cy + 379, get_lang_string("obj_battle_sio_Draw_0_75"), c_gray, c_gray, c_gray, c_gray, 1);
                            draw_text_color(cx + 500, cy + 379, get_lang_string("obj_battle_sio_Draw_0_76"), tpcolor, tpcolor, tpcolor, tpcolor, 1);
                        }
                        
                        if (left)
                        {
                            ralseiactoptions--;
                            ralseiactoptionsvertical = 0;
                        }
                        
                        if (right)
                        {
                            ralseiactoptions++;
                            ralseiactoptionsvertical = 0;
                        }
                        
                        ralseiactoptions = clamp(ralseiactoptions, 0, 1);
                        
                        if (up)
                        {
                            ralseiactoptions = 0;
                            ralseiactoptionsvertical--;
                        }
                        
                        if (down)
                        {
                            ralseiactoptions = 0;
                            ralseiactoptionsvertical++;
                        }
                        
                        ralseiactoptionsvertical = clamp(ralseiactoptionsvertical, 0, 1);
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
                    draw_text(pos[0], pos[1], "");
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
                draw_text_with_tracking(cx + 80, cy + 379, get_lang_string("obj_battle_sio_Draw_0_77"), 16777215, 0, -2);
                
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
                PAINCHOICE.x -= 20;
                var hurtvalue = 40;
                var megahurt = 78;
                
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
                        if (global.susiehp > (hurtvalue + 2))
                        {
                            global.susiehp -= (hurtvalue + 2);
                            var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                            damage.value = hurtvalue + 2;
                            susiemagic = false;
                            
                            if (PARTYMEMBER2.specialrude)
                            {
                                susiepissed = true;
                                
                                if (instance_exists(obj_generator1_sio))
                                    obj_generator1_sio.nevermind = true;
                                
                                if (instance_exists(obj_generator2_sio))
                                    obj_generator2_sio.nevermind = true;
                            }
                            
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
                            
                            if (PARTYMEMBER2.specialrude)
                                susiepissed = true;
                            
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
                        if (global.ralseihp > (hurtvalue - 2))
                        {
                            global.ralseihp -= (hurtvalue - 2);
                            var damage = instance_create_depth(PAINCHOICE.x - 6, PAINCHOICE.y - 6, PAINCHOICE.depth - 3, obj_damage);
                            damage.value = hurtvalue - 2;
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
            if (susiemagic && !instance_exists(obj_bulletboard_sio))
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
    percentupk += 0.16666666666666666;
    percentdownk = 0;
    
    if (percentupk == 0.16666666666666666)
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
    percentups += 0.16666666666666666;
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
    percentupr += 0.16666666666666666;
    percentdownr = 0;
    var positionr2 = animcurve_channel_evaluate(curveslower, percentupr);
    var delta_rise_yr = (cy + 240) - (cy + 272);
    pos_y2r = cy + 272 + (delta_rise_yr * positionr2);
}

if (global.endofbattle)
{
    endtimer++;
    
    if (endtimer == 0)
        audio_sound_gain(mus_tennasiblings_boss, 0, 500);
    
    if (endtimer == 30)
    {
        audio_stop_sound(mus_tennasiblings_boss);
        obj_tpbar.leftout = true;
    }
    
    if (endtimer >= 30)
    {
        ENEMY1.image_speed -= 1/30;
        ENEMY1.image_speed = clamp(ENEMY1.image_speed, 0, 1);
    }
    
    if (endtimer == 60)
        instance_create_depth(340, 261, -735, obj_tenna_static);
    
    if (endtimer == 80)
    {
        ENEMY1.resetindex = ENEMY1.image_index;
        ENEMY1.reset = true;
        PARTYMEMBER1.sprite_index = sKrisWalkRight;
        PARTYMEMBER2.sprite_index = sSusieWalkRightUpset;
        PARTYMEMBER3.sprite_index = sRalseiWalkRight;
        PARTYMEMBER2.x += 10;
        PARTYMEMBER2.y += 16;
        PARTYMEMBER1.image_speed = 0;
        PARTYMEMBER2.image_speed = 0;
        PARTYMEMBER3.image_speed = 0;
        PARTYMEMBER1.image_index = 0;
        PARTYMEMBER2.image_index = 0;
        PARTYMEMBER3.image_index = 0;
        instance_destroy(obj_generator1_sio);
        instance_destroy(obj_generator2_sio);
        instance_destroy(obj_battle_sio);
    }
}
