var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking)
{
    interacttimer = -2;
    subimg += 0.1;
    draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 394, 1, 1, 0, c_white, 1);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x;
    
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
        case 1:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_0"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            break;
        case 2:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_1"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 6;
            break;
        case 3:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_2"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 5;
            break;
        case 4:
            texttalk = false;
            susietalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_3"), 25);
            typing_speed = 1;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 4;
            break;
        case 5:
            susietalk = false;
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_4"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            break;
        case 6:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_5"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 1;
            break;
        case 7:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_6"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 1;
            break;
        case 8:
            texttalk = false;
            ralseitalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_7"), 25);
            typing_speed = 1;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 4;
            break;
        case 9:
            texttalk = true;
            ralseitalk = false;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_8"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            break;
        case 10:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_9"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 5;
            break;
        case 11:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_10"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            break;
        case 12:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_11"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            break;
        case 13:
            texttalk = true;
            current_dialogue = format_text("Apparently, that's no longer the case.", 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 1;
            break;
        case 14:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_12"), 25);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 6;
            break;
        case 15:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_13"), 25);
            typing_speed = 1;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 13;
            break;
        case 16:
            charactertalking = false;
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_14"), 31);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 9;
            break;
        case 17:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_15"), 31);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 9;
            break;
        case 18:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_16"), 31);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 9;
            break;
        case 19:
            texttalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_17"), 31);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 9;
            image_index = 1;
            break;
        case 20:
            texttalk = false;
            emptytalk = true;
            current_dialogue = format_text(lang("obj_tenna_sof_Draw_73_18"), 31);
            typing_speed = 1;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 9;
            image_index = 2;
            sleep = true;
            break;
        default:
            current_dialogue = lang("obj_tenna_sof_Draw_73_19");
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : lang("obj_tenna_sof_Draw_73_20");
                
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
                        if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_tenna, 1, false, 0.5);
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
    
    if ((advance_pressed && !blockprogress) || skiptimer == 2)
    {
        if (text_complete)
        {
            if (dialogue == 15 || dialogue == 20)
            {
                global.playermove = true;
                talking = false;
                skiptimer = -1;
            }
            else
            {
                dialogue += 1;
                reset_dialogue_normal();
                skiptimer = -1;
            }
        }
    }
    else if (skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
    
    if (keyboard_check(ord("C")) && !blockprogress)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
    {
        skiptext = false;
        skiptimer = 0;
    }
    
    if (skiptext)
    {
        skiptimer++;
        
        if (skiptimer == 1)
        {
            displayed_text = current_dialogue;
            text_complete = true;
        }
    }
    
    if (charactertalking)
    {
        if (dialoguetop)
            draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 93, 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 401, 1, 1, 0, c_white, 1);
    }
}
