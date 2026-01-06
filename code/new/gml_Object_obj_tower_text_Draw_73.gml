var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking)
{
    interacttimer = -2;
    subimg += 0.1;
    
    if (dialoguetop)
    {
        draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 86, 1, 1, 0, c_white, 1);
        quipyoffset = -308;
    }
    else if (dialoguebottom)
    {
        draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 394, 1, 1, 0, c_white, 1);
        quipyoffset = 0;
    }
    
    draw_set_alpha(1);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x, text_y;
    
    if (!(dialogue == 1300))
    {
        text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 174) : (camera_get_view_x(view_camera[0]) + 58);
        
        if (dialoguebottom)
            text_y = camera_get_view_y(view_camera[0]) + 338;
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
    
    switch (dialogue)
    {
        case 2:
            quip = false;
            charactertalking = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_0"), 31);
            dialogueicon = 0;
            typing_speed = 1;
            endcaseintro = dialogue;
            break;
        case 3:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_1"), 25);
            dialogueicon = 7;
            typing_speed = 1;
            break;
        case 4:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_2"), 25);
            dialogueicon = 20;
            typing_speed = 1;
            break;
        case 5:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_3"), 25);
            dialogueicon = 17;
            typing_speed = 1;
            break;
        case 6:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_4"), 25);
            dialogueicon = 26;
            typing_speed = 1;
            break;
        case 7:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_5"), 25);
            dialogueicon = 17;
            typing_speed = 1;
            break;
        case 8:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_6"), 25);
            dialogueicon = 10;
            typing_speed = 1;
            break;
        case 9:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_7"), 25);
            dialogueicon = 9;
            typing_speed = 1;
            break;
        case 10:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_8"), 25);
            dialogueicon = 2;
            typing_speed = 1;
            break;
        case 11:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_9"), 25);
            dialogueicon = 26;
            typing_speed = 1;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 12:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_10"), 25);
            dialogueicon = 5;
            typing_speed = 1;
            SUSIE.sprite_index = sSusieWalkDown;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 13:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_11"), 25);
            dialogueicon = 5;
            typing_speed = 1;
            SUSIE.sprite_index = sSusieWalkLeft;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 14:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_12"), 25);
            dialogueicon = 22;
            typing_speed = 1;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 15:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_13"), 25);
            dialogueicon = 7;
            typing_speed = 1;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 16:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_14"), 25);
            dialogueicon = 25;
            typing_speed = 1;
            SUSIE.sprite_index = sSusieWalkRight;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 17:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_15"), 25);
            dialogueicon = 21;
            typing_speed = 1;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 18:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_16"), 25);
            dialogueicon = 15;
            typing_speed = 0.5;
            endcasespeed = dialogue;
            SUSIE.sprite_index = sSusieWalkDownUpset;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 19:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_17"), 25);
            dialogueicon = 27;
            typing_speed = 1;
            break;
        case 20:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_18"), 25);
            dialogueicon = 24;
            typing_speed = 1;
            break;
        case 21:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_19"), 25);
            dialogueicon = 25;
            typing_speed = 1;
            break;
        case 22:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_20"), 25);
            dialogueicon = 3;
            typing_speed = 1;
            SUSIE.sprite_index = sSusieWalkRightUpset;
            break;
        case 23:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_21"), 25);
            dialogueicon = 2;
            typing_speed = 1;
            break;
        case 24:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_22"), 25);
            dialogueicon = 13;
            typing_speed = 1;
            SUSIE.sprite_index = sSusieWalkDownUpset;
            break;
        case 25:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_23"), 25);
            dialogueicon = 21;
            typing_speed = 1;
            SUSIE.sprite_index = sSusieWalkLeft;
            endcaseleave = dialogue;
            break;
        case 26:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_24"), 25);
            dialogueicon = 9;
            typing_speed = 1;
            break;
        case 27:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_25"), 25);
            dialogueicon = 5;
            typing_speed = 1;
            break;
        case 28:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_tower_text_Draw_73_26"), 25);
            dialogueicon = 26;
            typing_speed = 1;
            endcasefinal = dialogue;
            break;
        default:
            current_dialogue = "";
            break;
    }
    
    var endcase = [endcaseintro, endcasespeed, endcaseleave, endcasefinal];
    
    if (destroy)
    {
        blockprogress = true;
        instance_destroy();
    }
    
    if (!text_complete && !pause_for_punctuation)
    {
        typing_timer += typing_speed;
        
        while (typing_timer >= 1)
        {
            typing_timer -= 1;
            
            if (letter_index < string_length(current_dialogue))
            {
                var next_char = string_char_at(current_dialogue, letter_index + 1);
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : "";
                
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
                    else if (next_char != " " && next_char != "*" && next_char != "?" && displayed_text != "*" && next_char != ")" && next_char != "!")
                    {
                        if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (kreidtalk)
                            audio_play_sound(snd_kreid, 1, false);
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
    
    if (((advance_pressed && !blockprogress) && progressallow) || (skiptimer == 3 && progressallow))
    {
        if (text_complete)
        {
            if (array_contains(endcase, dialogue))
            {
                talking = false;
                reset_dialogue_normal();
                
                if (dialogue == endcaseintro)
                    walk = true;
                
                if (dialogue == endcaseleave)
                    out = true;
                
                if (dialogue == endcasespeed)
                    speeding = true;
                
                if (dialogue == endcasefinal)
                    ending = true;
            }
            else
            {
                dialogue += 1;
                reset_dialogue_normal();
            }
        }
    }
    else if (skiptext)
    {
        skiptimer++;
        
        if (skiptimer == 2)
        {
            displayed_text = current_dialogue;
            text_complete = true;
        }
    }
    else if (skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_kreid);
    }
    
    if (keyboard_check(ord("C")) && !blockprogress && progressallow)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
    {
        skiptext = false;
        skiptimer = 0;
    }
    
    if (charactertalking)
    {
        if (dialoguetop)
            draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 93, 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 401, 1, 1, 0, c_white, 1);
    }
    
    if (text_complete && quip)
    {
        draw_set_alpha(quipalpha);
        draw_set_font(fDeterminationSans_quip);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_text(cam_x + (quipx + 47) + quipxoffset, cam_y + 418 + quipyoffset, quipstring);
        draw_sprite_ext(quipicon, quipindex, cam_x + quipx + quipxoffset, cam_y + 434 + quipyoffset, 0.5, 0.5, 0, c_white, quipalpha);
        quippercent += 0.2;
        var position1 = animcurve_channel_evaluate(quiplinear, quippercent);
        var delta_quipoffset = -50;
        quipxoffset = 50 + (delta_quipoffset * position1);
        var delta_alpha = 1;
        quipalpha = 0 + (delta_alpha * position1);
        draw_set_alpha(1);
    }
    else
    {
        quippercent = 0;
        quipxoffset = 50;
    }
}
