var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (global.enemyturn)
{
    depth = obj_kris_c3.depth - 5;
    soulsubimg++;
    soulsubimgback = -1;
    
    if (soulsubimg <= 6)
        draw_sprite_ext(spr_SOUL_jumpout, soulsubimg, obj_kris_c3.x - 12, obj_kris_c3.y + 12, 1, 1, 0, c_white, 1);
    
    if (soulsubimg == 0)
    {
        instance_create_depth(cam_x + 320, cam_y + 170, obj_kris_c3.depth - 3, obj_bulletboard_kf);
        instance_create_depth(obj_kris_c3.x - 12, obj_kris_c3.y + 12, obj_kris_c3.depth - 4, obj_SOUL_battle);
    }
}
else
{
    soulsubimgback++;
    
    if (global.turn > 1 && soulsubimgback <= 6)
        draw_sprite_ext(spr_SOUL_jumpout, soulsubimgback, obj_kris_c3.x - 12, obj_kris_c3.y + 12, 1, 1, 0, c_white, 1);
}

if (textmenu)
{
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    
    if (charactertalking)
        draw_sprite_ext(sKreidDialogueSprite, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 401, 1, 1, 0, c_white, 1);
    
    var text_x, text_y;
    
    if (!(menudialogue == 1300))
    {
        text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 174) : (camera_get_view_x(view_camera[0]) + 30);
        
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
            
            if (global.turn == 1)
                current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_0"), 31);
            
            if (global.turn <= 7 && global.turn > 1)
            {
                switch (randompick)
                {
                    case 1:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_1"), 31);
                        break;
                    case 2:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_2"), 31);
                        break;
                    case 3:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_3"), 31);
                        break;
                    case 4:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_4"), 31);
                        break;
                    case 5:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_5"), 31);
                        break;
                    case 6:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_6"), 31);
                        break;
                    case 7:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_7"), 31);
                        break;
                    default:
                        current_dialogue = translation_get_string("gml_Object_obj_battle_kf_Draw_73_8");
                        break;
                }
            }
            
            if (global.turn == 8)
                current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_9"), 31);
            
            if (global.turn >= 9 && global.turn < 15)
            {
                switch (randompick)
                {
                    case 1:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_10"), 31);
                        break;
                    case 2:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_11"), 31);
                        break;
                    case 3:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_12"), 31);
                        break;
                    case 4:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_13"), 31);
                        break;
                    case 5:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_14"), 31);
                        break;
                    case 6:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_15"), 31);
                        break;
                    case 7:
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_16"), 31);
                        break;
                    default:
                        current_dialogue = translation_get_string("gml_Object_obj_battle_kf_Draw_73_17");
                        break;
                }
            }
            
            if (global.turn >= 15)
                current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_18"), 31);
            
            typing_speed = 1;
            break;
        default:
            current_dialogue = translation_get_string("gml_Object_obj_battle_kf_Draw_73_19");
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : translation_get_string("gml_Object_obj_battle_kf_Draw_73_20");
                
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
                        if (kreidtalk)
                            audio_play_sound(snd_kreid, 1, false);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
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
            if (menudialogue == 1)
            {
                textmenu = false;
            }
            else
            {
                menudialogue += 1;
                reset_dialogue_normal();
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
    var text_x = obj_kreid_c3.x - 220;
    var text_y = obj_kreid_c3.y - 36;
    draw_sprite_ext(spr_c3_dialoguebubble, 0, obj_kreid_c3.x - 30, obj_kreid_c3.y, 1, 1, 0, c_white, 1);
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    
    if (!destroy)
    {
        draw_set_color(c_black);
        draw_text(text_x, text_y, displayed_text);
    }
    
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    
    switch (enemydialogue)
    {
        case 1:
            kreidtalk = true;
            texttalk = false;
            dialogueicon = 1;
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_21"), 17);
            typing_speed = 1;
            break;
        case 2:
            kreidtalk = true;
            texttalk = false;
            dialogueicon = 1;
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_22"), 17);
            typing_speed = 1;
            break;
        case 3:
            kreidtalk = true;
            texttalk = false;
            dialogueicon = 1;
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_23"), 17);
            typing_speed = 1;
            break;
        case 4:
            kreidtalk = true;
            texttalk = false;
            dialogueicon = 1;
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_24"), 17);
            typing_speed = 1;
            break;
        case 5:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_25"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 6:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_26"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 7:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_27"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 8:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_28"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 9:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_29"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 10:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_30"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 11:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_31"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 12:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_32"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 13:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_33"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 14:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_34"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 15:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_35"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 16:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_36"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 17:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_37"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 18:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_38"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 19:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_39"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 20:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_40"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 21:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_41"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 22:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_42"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 23:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_43"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        case 24:
            current_dialogue = format_text_battle(translation_get_string("gml_Object_obj_battle_kf_Draw_73_44"), 17);
            kreidtalk = true;
            texttalk = false;
            break;
        default:
            current_dialogue = translation_get_string("gml_Object_obj_battle_kf_Draw_73_45");
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : translation_get_string("gml_Object_obj_battle_kf_Draw_73_46");
                
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
                        if (kreidtalk)
                            audio_play_sound(snd_kreid, 1, false);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
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
    
    var end_cases = [2, 4, 6, 7, 8, 9, 10, 11, 12, 14, 16, 18, 19, 21, 24];
    
    if ((advance_pressed && !blockprogress) || (skiptimer == 2 && !blockprogress))
    {
        flashpercent = 0;
        obj_kreid_c3.flashalpha = 0;
        
        if (text_complete)
        {
            if (array_contains(end_cases, enemydialogue))
            {
                textenemy = false;
                global.enemyturn = true;
                enemydialogue += 1;
                texttalk = true;
                kreidtalk = false;
            }
            else
            {
                enemydialogue += 1;
                reset_dialogue_normal();
            }
        }
    }
    else if ((skip_pressed && !advance_pressed && !blockprogress) || (skiptimer == 1 && !blockprogress))
    {
        displayed_text = format_text_replacements(current_dialogue);
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
}

if (keyboard_check(ord("C")) && !blockprogress)
    skiptext = true;

if (keyboard_check_released(ord("C")) || blockprogress)
{
    skiptext = false;
    skiptimer = 0;
}

if (skiptext && !blockprogress)
    skiptimer++;

if (textact)
{
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
    
    if (used_item == krispykreid)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_47");
    else if (used_item == shadowdonut)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_48");
    else if (used_item == adultsoda)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_49");
    else if (used_item == shotglass)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_50");
    else if (used_item == puffpastry)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_51");
    else if (used_item == spincake)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_52");
    else if (used_item == rottentea)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_53");
    else if (used_item == craftyglue)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_54");
    else if (used_item == empty)
        itemfullname = translation_get_string("gml_Object_obj_battle_kf_Draw_73_55");
    
    switch (actdialogue)
    {
        case 1:
            randomize();
            texttalk = true;
            dialogueicon = 1;
            
            if (krisitem)
            {
                current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_56") + string(itemfullname) + translation_get_string("gml_Object_obj_battle_kf_Draw_73_57"), 31);
            }
            else if (krismercy)
            {
                current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_58"), 60);
            }
            else if (krisactoptions == 0)
            {
                current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_59"), 31);
            }
            else if (global.turn > 7 && global.silence1)
            {
                current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_60"), 31);
            }
            else if (global.turn > 7)
            {
                current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_61"), 31);
            }
            else
            {
                if (reason == 1)
                    current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_62"), 31);
                
                if (reason == 2)
                    current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_63"), 31);
                
                if (reason == 3)
                    current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_64"), 31);
                
                if (reason == 4)
                    current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_65"), 31);
                
                if (reason == 5)
                    current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_66"), 31);
                
                if (reason == 6)
                    current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_67"), 31);
                
                if (reason >= 7)
                    current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_68"), 31);
            }
            
            typing_speed = 1;
            break;
        case 2:
            texttalk = false;
            
            if (global.turn > 7)
                texttalk = true;
            else
                kreidtalk = true;
            
            if (global.turn <= 7)
                charactertalking = true;
            
            if (krisactoptions == 1)
            {
                if (reason > 6 || global.turn > 7)
                {
                    charactertalking = false;
                    
                    if (!global.silence1 || global.turn <= 7)
                    {
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_69"), 28);
                    }
                    else
                    {
                        texttalk = true;
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_70"), 31);
                    }
                }
                else
                {
                    switch (reason)
                    {
                        case 1:
                            dialogueicon = 2;
                            current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_71"), 28);
                            break;
                        case 2:
                            dialogueicon = 14;
                            current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_72"), 28);
                            break;
                        case 3:
                            dialogueicon = 4;
                            current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_73"), 28);
                            break;
                        case 4:
                            dialogueicon = 4;
                            current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_74"), 28);
                            break;
                        case 5:
                            dialogueicon = 1;
                            current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_75"), 28);
                            break;
                        case 6:
                            dialogueicon = 9;
                            current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_76"), 28);
                            charactertalking = true;
                            break;
                        default:
                            break;
                    }
                }
            }
            
            break;
        case 3:
            texttalk = false;
            kreidtalk = true;
            dialogueicon = 1;
            charactertalking = true;
            
            if (krisactoptions == 1)
            {
                switch (reason)
                {
                    case 1:
                        dialogueicon = 1;
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_77"), 28);
                        break;
                    case 3:
                        dialogueicon = 3;
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_78"), 28);
                        break;
                    case 4:
                        dialogueicon = 8;
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_79"), 28);
                        break;
                    case 5:
                        dialogueicon = 10;
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_80"), 28);
                        break;
                    case 6:
                        dialogueicon = 1;
                        current_dialogue = format_text(translation_get_string("gml_Object_obj_battle_kf_Draw_73_81"), 28);
                        break;
                    default:
                        break;
                }
            }
            
            break;
        default:
            current_dialogue = translation_get_string("gml_Object_obj_battle_kf_Draw_73_82");
            break;
    }
    
    if (charactertalking)
        draw_sprite_ext(sKreidDialogueSprite, dialogueicon, camera_get_view_x(view_camera[0]) + 84, camera_get_view_y(view_camera[0]) + 426, 1, 1, 0, c_white, 1);
    
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : translation_get_string("gml_Object_obj_battle_kf_Draw_73_83");
                
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
                        if (kreidtalk)
                            audio_play_sound(snd_kreid, 1, false);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
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
    
    if (krisitem)
    {
        end_cases = [1];
    }
    else if (krisactoptions == 0)
    {
        end_cases = [1];
    }
    else if (global.turn > 7 || reason > 6)
    {
        end_cases = [2];
    }
    else
    {
        if (reason == 2)
            end_cases = [2];
        
        if (reason == 1 || reason == 3 || reason == 4 || reason == 5 || reason == 6)
            end_cases = [3];
    }
    
    if (global.turn < 7)
    {
        if (actdialogue == 1 && reason == 6 && text_complete)
        {
            actdialogue = 2;
            reset_dialogue_normal();
        }
    }
    
    var textx = camera_get_view_x(view_camera[0]) + 30;
    var texty = camera_get_view_y(view_camera[0]) + 376;
    
    if (actdialogue == 1)
    {
        var text_parts = string_split(current_dialogue, translation_get_string("gml_Object_obj_battle_kf_Draw_73_84"));
        var x_offset = textx;
        var y_offset = texty;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, translation_get_string("gml_Object_obj_battle_kf_Draw_73_85"));
            
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
                var color;
                
                switch (i + 1)
                {
                    default:
                        color = 8388736;
                        break;
                }
                
                draw_set_color(#323200);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, c_yellow, c_yellow, 1);
                x_offset += string_width(remaining);
                
                if (string_pos(translation_get_string("gml_Object_obj_battle_kf_Draw_73_86"), remaining) > 0)
                {
                    x_offset = textx;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (!pause_for_punctuation && advance_pressed && !blockprogress)
    {
        if (text_complete)
        {
            if (array_contains(end_cases, actdialogue))
            {
                textact = false;
                textmenu = false;
                
                if (global.enemyhp > 0)
                    textenemy = true;
                else if (!instance_exists(DEVICE_OUTLAW_WARNING))
                    instance_create_depth(cam_x + 320, cam_y + 240, -6666, DEVICE_OUTLAW_WARNING);
                
                krisacting = false;
                krismercy = false;
                obj_kris_c3.image_speed = 1;
                reset_dialogue_normal();
                
                if (global.turn > 7)
                    global.silence1 = false;
                
                charactertalking = false;
                kreidtalk = false;
                texttalk = true;
                actdialogue = 1;
                krisbattleicon = 0;
            }
            else
            {
                actdialogue += 1;
                reset_dialogue_normal();
            }
        }
    }
    else if ((skip_pressed && !advance_pressed && !blockprogress) && !krisitem)
    {
        displayed_text = format_text_replacements(current_dialogue);
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
}
