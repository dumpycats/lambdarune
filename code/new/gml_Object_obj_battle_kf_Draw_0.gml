var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (global.turn >= 8 && !global.endofbattle)
{
    smoketimer++;
    
    if ((smoketimer % round(55 - (global.turn * 3))) == 0)
    {
        var smoke1 = instance_create_depth(cx + 520, cy + 290, 102, obj_kreid_smoke);
        var smoke2 = instance_create_depth(cx + 520, cy + 290, 101, obj_kreid_smoke_black);
        randomize();
        var smokedirection = irandom_range(150 - global.turn, 185 - global.turn);
        var smokespeed = irandom_range(2, 3);
        var smokescale = random_range(0.3, 0.8);
        smoke1.image_xscale = smokescale;
        smoke1.image_yscale = smokescale;
        smoke1.direction = smokedirection;
        smoke1.speed = smokespeed;
        smoke2.image_xscale = smokescale;
        smoke2.image_yscale = smokescale;
        smoke2.direction = smokedirection;
        smoke2.speed = smokespeed;
    }
}

if (instance_exists(obj_battle_kf))
{
    if (global.krishp <= 0)
    {
        global.alldown = true;
        camera_set_view_pos(view_camera[0], 20, 20);
        audio_stop_sound(mus_kreidfight);
        audio_stop_sound(snd_bulletshot);
        audio_group_stop_all(AUDIO_APPEARANCE);
        inputtimer = -2;
    }
}

if (instance_exists(obj_kf_specialtrigger))
{
    if (obj_kf_specialtrigger.nohit)
        global.krishp = clamp(global.krishp, -666, 1);
}

if (global.enemyhp < (global.enemymaxhp / 1.5))
{
    if (!instance_exists(obj_kreid_attackcheck))
        instance_create_depth(1000, 1000, 0, obj_kreid_attackcheck);
}

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

if (global.enemyhp <= 0)
    audio_stop_sound(mus_kreidfight);

if (turnrefresh)
{
    krisdefend = false;
    krismercy = false;
    krisitem = false;
    krisselected = false;
    krisactselected = false;
    krisbattleicon = 0;
    krismenuaccessible = true;
    obj_kris_c3.sprite_index = spr_kris_idle;
    obj_kris_c3.image_speed = 1;
    
    if (global.turn <= 7)
    {
        obj_kreid_c3.sprite_index = spr_kreid_idle;
        obj_kreid_c3.image_speed = 1;
    }
    else
    {
        obj_c3_sky.panning = true;
        obj_kreid_c3.sprite_index = spr_kreid_rage;
        obj_kreid_c3.image_speed = 1;
    }
    
    randompick = irandom_range(1, 7);
    krismenuoptions = 1;
    krisactoptions = 0;
    krisitemtimer = -1;
    itemsection = 0;
    itemcolumns = 0;
    itemrows = 0;
    turnrefresh = false;
}

if (turnprogress)
{
    skiptimer = 0;
    skiptext = false;
    flashpercent = 0;
    obj_kreid_c3.flashalpha = 0;
    
    if (krisdefending)
    {
        krisdefend = true;
        obj_kris_c3.image_index = 0;
        obj_kris_c3.sprite_index = spr_kris_defend;
        global.tp += 16;
        krisselected = false;
        krismenuaccessible = false;
        krisbattleicon = 5;
        textmenu = false;
        
        if (global.enemyhp > 0)
            textenemy = true;
        else if (!instance_exists(DEVICE_OUTLAW_WARNING))
            instance_create_depth(cx + 320, cy + 240, -6666, DEVICE_OUTLAW_WARNING);
        
        reset_dialogue_normal();
        krisdefending = false;
    }
    else if (krisacting)
    {
        obj_kris_c3.image_index = 0;
        obj_kris_c3.sprite_index = spr_kris_act;
        textmenu = false;
        textact = true;
        reset_dialogue_normal();
    }
    else if (krismercy)
    {
        obj_kris_c3.image_index = 0;
        obj_kris_c3.sprite_index = spr_kris_act;
        textmenu = false;
        textact = true;
        reset_dialogue_normal();
    }
    else if (krisitem)
    {
        obj_kris_c3.image_index = 0;
        obj_kris_c3.sprite_index = spr_kris_item;
        textmenu = false;
        textact = true;
        reset_dialogue_normal();
    }
    else if (krisfight)
    {
        obj_kris_c3.sprite_index = spr_kris_fight;
        obj_kris_c3.image_index = 0;
        obj_kris_c3.image_speed = 0;
        reset_dialogue_normal();
        textmenu = false;
        
        if (!instance_exists(obj_attack))
        {
            var spawnattack = instance_create_depth(0, 0, depth - 2, obj_attack);
            spawnattack.kris = true;
            spawnattack.krischoice = obj_kreid_c3;
        }
    }
    
    turnprogress = false;
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
    draw_sprite_ext(spr_battlemenu, 1, cx + 320, pos_y, 1, 1, 0, menucolor, 1);
else
    draw_sprite_ext(spr_battlemenu, 1, cx + 320, pos_y, 1, 1, 0, kriscolor, 1);

if (krismenuaccessible && battlebegun)
{
    barsubimg++;
    
    if (barsubimg < 30)
        draw_sprite_ext(spr_opacitybar_beginning, barsubimg, cx + 320, pos_y, 1, 1, 0, kriscolor, 1);
    else
        draw_sprite_ext(spr_opacitybar, barsubimg, cx + 320, pos_y, 1, 1, 0, kriscolor, 1);
}

if (krismenuaccessible)
    draw_sprite_ext(spr_kris_menuoptions, krismenuoptions, cx + 318, pos_y + 109, 1, 1, 0, c_white, 1);
else if (battlebegun)
    draw_sprite_ext(spr_kris_menuoptions, 0, cx + 318, pos_y + 109, 1, 1, 0, c_white, 1);
else
    draw_sprite_ext(spr_kris_menuoptions, krismenuoptions, cx + 318, pos_y + 109, 1, 1, 0, c_white, 1);

if (!krismenuaccessible && battlebegun)
    draw_sprite_ext(spr_battlemenu, 0, cx + 320, pos_y2, 1, 1, 0, menucolor, 1);
else
    draw_sprite_ext(spr_battlemenu, 0, cx + 320, pos_y2, 1, 1, 0, kriscolor, 1);

if (!krismenuaccessible && battlebegun)
    draw_sprite_ext(spr_menu_blackbars, 0, cx + 320, pos_y, 1, 1, 0, c_white, 1);

draw_sprite_ext(spr_kris_battlemenu, krisbattleicon, cx + 320, pos_y2, 1, 1, 0, c_white, 1);
draw_set_font(fHP);

if (global.krishp <= 0)
    draw_set_color(c_red);
else if (global.krishp <= (global.krismaxhp / 5))
    draw_set_color(c_yellow);
else
    draw_set_color(c_white);

draw_set_halign(fa_right);
draw_text(cx + 373, pos_y2 + 60, global.krishp);
draw_text(cx + 418, pos_y2 + 60, global.krismaxhp);
draw_rectangle_color(cx + 341, pos_y2 + 75, cx + 416, pos_y2 + 83, darkred, darkred, darkred, darkred, 0);

if (!(global.krismaxhp == 1))
    draw_rectangle_color(cx + 341, pos_y2 + 75, cx + 341 + (75 / (global.krismaxhp / global.krishp)), pos_y2 + 83, kriscolor, kriscolor, kriscolor, kriscolor, 0);
else if (!global.alldown)
    draw_rectangle_color(cx + 341, pos_y2 + 75, cx + 341 + (75 / (global.krismaxhp / global.krishp)), pos_y2 + 83, kriscolor, kriscolor, kriscolor, kriscolor, 0);

draw_set_color(c_white);

if (krismenuaccessible)
{
    global.enemyturn = false;
    soulsubimg = -1;
    
    if (!krisselected)
    {
        flashpercent = 0;
        obj_kreid_c3.flashalpha = 0;
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
                turnprogress = true;
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
                draw_text(cx + 80, cy + 379, get_lang_string("gml_Object_obj_battle_kf_Draw_0_0"));
                draw_text_transformed(cx + 424, cy + 366, get_lang_string("gml_Object_obj_battle_kf_Draw_0_1"), 1, 0.5, 0);
                draw_text_transformed(cx + 524, cy + 366, get_lang_string("gml_Object_obj_battle_kf_Draw_0_2"), 1, 0.5, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 500, cy + 395, darkred, darkred, darkred, darkred, 0);
                draw_rectangle_color(cx + 420, cy + 380, cx + 420 + (80 / (2555 / global.enemyhp)), cy + 395, green, green, green, green, 0);
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
                draw_sprite_ext(spr_nomercy, 1, cx + 320, cy + 240, 1, 1, 0, c_white, 1);
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
                        turnprogress = true;
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
                        draw_sprite_ext(spr_SOUL_battle, 0, cx + 63, cy + 393, 1, 1, 0, c_red, 1);
                    
                    if (krisactoptions == 1)
                        draw_sprite_ext(spr_SOUL_battle, 0, cx + 293, cy + 393, 1, 1, 0, c_red, 1);
                    
                    if (advance)
                    {
                        audio_play_sound(snd_select, 1, false);
                        krisacting = true;
                        krisactselected = false;
                        krisselected = false;
                        krismenuaccessible = false;
                        krisbattleicon = 2;
                        turnprogress = true;
                        
                        if (krisactoptions == 1)
                            reason++;
                    }
                    
                    draw_text(cx + 80, cy + 379, get_lang_string("gml_Object_obj_battle_kf_Draw_0_3"));
                    
                    if (global.turn > 7)
                        draw_text(cx + 310, cy + 379, get_lang_string("gml_Object_obj_battle_kf_Draw_0_4"));
                    else
                        draw_text(cx + 310, cy + 379, get_lang_string("gml_Object_obj_battle_kf_Draw_0_5"));
                    
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
                    turnprogress = true;
                }
            }
            
            flashpercent += (1/30);
            
            if (flashpercent <= 0.5)
                obj_kreid_c3.flashalpha += 0.05;
            else
                obj_kreid_c3.flashalpha -= 0.05;
            
            if (flashpercent == 1)
                flashpercent = 0;
            
            obj_kreid_c3.flashalpha = clamp(obj_kreid_c3.flashalpha, 0.25, 1);
        }
        
        if (krismenuoptions == 3 && !(advancecounter >= 12))
        {
            draw_set_font(fDeterminationSans);
            draw_set_halign(fa_left);
            
            if (itemsection == 0)
                draw_sprite_ext(spr_itemarrow, barsubimg, cx + 476, cy + 420, 1, 1, 0, c_white, 1);
            else if (itemsection == 1)
                draw_sprite_ext(spr_itemarrow, barsubimg, cx + 476, cy + 420, 1, -1, 0, c_white, 1);
            
            var item_positions = [[cx + 30, cy + 379], [cx + 250, cy + 379], [cx + 30, cy + 409], [cx + 250, cy + 409], [cx + 30, cy + 439], [cx + 250, cy + 439], [cx + 30, cy + 469], [cx + 250, cy + 469], [cx + 30, cy + 499], [cx + 250, cy + 499], [cx + 30, cy + 529], [cx + 250, cy + 529]];
            var max_selectable_items = array_length(itemlist) - advancecounter;
            var item_name_map = ds_map_create();
            ds_map_add(item_name_map, krispykreid, "KKreid");
            ds_map_add(item_name_map, shadowdonut, "SDonut");
            ds_map_add(item_name_map, adultsoda, "Adult Soda");
            ds_map_add(item_name_map, shotglass, "ShotGlass");
            ds_map_add(item_name_map, puffpastry, "PPastry");
            ds_map_add(item_name_map, spincake, "Spincake");
            ds_map_add(item_name_map, rottentea, "RottenTea");
            ds_map_add(item_name_map, craftyglue, "CraftyGlue");
            ds_map_add(item_name_map, empty, "");
            var item_hover_map = ds_map_create();
            ds_map_add(item_hover_map, krispykreid, "Heals\n140HP");
            ds_map_add(item_hover_map, shadowdonut, "Heals\n70HP");
            ds_map_add(item_hover_map, adultsoda, "Heals\nrandom\nHP");
            ds_map_add(item_hover_map, shotglass, "Heals\n60HP");
            ds_map_add(item_hover_map, puffpastry, "Heals\nteam\n90HP");
            ds_map_add(item_hover_map, spincake, "Heals\nteam\n140HP");
            ds_map_add(item_hover_map, rottentea, "Heals\n10HP");
            ds_map_add(item_hover_map, craftyglue, "Heals\n60HP");
            ds_map_add(item_hover_map, empty, "");
            var item_heal_map = ds_map_create();
            ds_map_add(item_heal_map, krispykreid, 140);
            ds_map_add(item_heal_map, shadowdonut, 70);
            ds_map_add(item_heal_map, adultsoda, irandom_range(20, 160));
            ds_map_add(item_heal_map, shotglass, 60);
            ds_map_add(item_heal_map, puffpastry, 90);
            ds_map_add(item_heal_map, spincake, 140);
            ds_map_add(item_heal_map, rottentea, 10);
            ds_map_add(item_heal_map, craftyglue, 60);
            ds_map_add(item_heal_map, empty, 0);
            var item_names = array_create(array_length(itemlist));
            
            for (var i = 0; i < array_length(itemlist); i++)
                item_names[i] = ds_map_find_value(item_name_map, itemlist[i]);
            
            var start_index = (itemsection == 0) ? 0 : 6;
            
            for (var i = 0; i < min(6, max_selectable_items); i++)
            {
                var pos = item_positions[i];
                draw_text(pos[0], pos[1], item_names[start_index + i]);
            }
            
            draw_sprite_ext(spr_SOUL_battle, 0, itemx, itemy, 1, 1, 0, c_red, 1);
            var selected_index = start_index + (itemrows * 2) + itemcolumns;
            selected_index = min(selected_index, max_selectable_items - 1);
            draw_set_color(c_gray);
            draw_text(cx + 500, cy + 379, ds_map_find_value(item_hover_map, itemlist[selected_index]));
            
            if (advance)
            {
                advancecounter++;
                used_item = itemlist[selected_index];
                audio_play_sound(snd_select, 1, false);
                krisitem = true;
                krisselected = false;
                krismenuaccessible = false;
                krisbattleicon = 3;
                turnprogress = true;
                
                for (var i = selected_index; i < (array_length(itemlist) - 1); i++)
                    itemlist[i] = itemlist[i + 1];
                
                itemlist[array_length(itemlist) - 1] = empty;
            }
            
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
            
            ds_map_destroy(item_name_map);
            ds_map_destroy(item_hover_map);
            ds_map_destroy(item_heal_map);
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

if (obj_kris_c3.sprite_index == spr_kris_act && obj_kris_c3.image_index >= 6 && (krisacting || krismercy))
    obj_kris_c3.image_speed = 0;

if (obj_kris_c3.image_index == 5 && obj_kris_c3.sprite_index == spr_kris_defend)
    obj_kris_c3.image_speed = 0;

if (instance_exists(obj_SOUL_battle))
{
    if (obj_SOUL_battle.hurting && global.krishp > 0)
    {
        krishurttimer++;
        global.nohit = false;
        
        switch (krishurttimer)
        {
            case 0:
                audio_play_sound(snd_hurt1, 2, false);
                obj_kris_c3.xoffset -= 20;
                
                if (global.turn == 8)
                    global.hitduringturn8 = true;
                
                if (!krisdefend)
                {
                    global.krishp -= 24;
                    var damage = instance_create_depth(obj_kris_c3.x - 6, obj_kris_c3.y - 6, obj_kris_c3.depth - 3, obj_damage);
                    damage.value = 24;
                }
                else
                {
                    global.krishp -= 14;
                    var damage = instance_create_depth(obj_kris_c3.x - 6, obj_kris_c3.y - 6, obj_kris_c3.depth - 3, obj_damage);
                    damage.value = 14;
                }
                
                if (instance_exists(obj_kf_specialtrigger))
                {
                    if (obj_kf_specialtrigger.nohit)
                        global.krishp = -666;
                }
                
                break;
            case 1:
                obj_kris_c3.xoffset += 5;
                camera_set_view_pos(view_camera[0], 24, 24);
                break;
            case 2:
                obj_kris_c3.xoffset += 5;
                camera_set_view_pos(view_camera[0], 16, 16);
                break;
            case 3:
                obj_kris_c3.xoffset += 5;
                camera_set_view_pos(view_camera[0], 23, 23);
                break;
            case 4:
                obj_kris_c3.xoffset += 5;
                camera_set_view_pos(view_camera[0], 18, 18);
                break;
            default:
                camera_set_view_pos(view_camera[0], 20, 20);
                break;
        }
    }
    else
    {
        camera_set_view_pos(view_camera[0], 20, 20);
        krishurttimer = -1;
        
        if (global.krishp > 0)
        {
            if (!krisdefend)
                obj_kris_c3.sprite_index = spr_kris_idle;
            else
                obj_kris_c3.sprite_index = spr_kris_defend;
        }
    }
}

if (!krismenuaccessible && battlebegun)
{
    percentdown += (1/3);
    percentup = 0;
    var position1 = animcurve_channel_evaluate(curveslower, percentdown);
    var delta_down_y = (cy + 272) - (cy + 240);
    pos_y2 = cy + 240 + (delta_down_y * position1);
}
else if (krismenuaccessible && battlebegun)
{
    percentup += 0.14285714285714285;
    percentdown = 0;
    
    if (percentup == 0.14285714285714285)
        reset_dialogue_normal();
    
    var position2 = animcurve_channel_evaluate(curveslower, percentup);
    var delta_rise_y = (cy + 240) - (cy + 272);
    pos_y2 = cy + 272 + (delta_rise_y * position2);
}
