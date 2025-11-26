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
        instance_create_depth(cam_x + 320, cam_y + 170, PARTYMEMBER1.depth - 3, obj_bulletboard_sio);
        instance_create_depth(PARTYMEMBER1.x - 12, PARTYMEMBER1.y + 12, PARTYMEMBER1.depth - 4, SOUL);
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
            
            if (jammed)
            {
                if (susiepissturn == 1 && !susiedown)
                {
                    susietalk = true;
                    charactertalking = true;
                    current_dialogue = format_text(lang("obj_battle_sio_Draw_73_0"), 25);
                    draw_sprite_ext(sSusieDialogueSprite, 5, camera_get_view_x(view_camera[0]) + 72, camera_get_view_y(view_camera[0]) + 421, 1, 1, 0, c_white, 1);
                }
                else if (jamwait == 1 && jammed && !susiejaminterrupt && !susiedown && jamphase >= 1)
                {
                    susietalk = true;
                    charactertalking = true;
                    current_dialogue = format_text(lang("obj_battle_sio_Draw_73_1"), 25);
                    draw_sprite_ext(sSusieDialogueSprite, 3, camera_get_view_x(view_camera[0]) + 72, camera_get_view_y(view_camera[0]) + 421, 1, 1, 0, c_white, 1);
                }
                else if (global.enemyhp > (global.enemymaxhp - 750))
                {
                    susietalk = false;
                    
                    if (global.nohit)
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_2"), 31);
                    else
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_3"), 31);
                }
                else
                {
                    susietalk = false;
                    
                    if (global.nohit)
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_4"), 31);
                    else
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_5"), 36);
                }
            }
            else if (susiepissturn == 1 && !susiedown)
            {
                susietalk = true;
                charactertalking = true;
                current_dialogue = format_text(lang("obj_battle_sio_Draw_73_6"), 25);
                draw_sprite_ext(sSusieDialogueSprite, 5, camera_get_view_x(view_camera[0]) + 72, camera_get_view_y(view_camera[0]) + 421, 1, 1, 0, c_white, 1);
            }
            else if (global.turn == 1)
            {
                current_dialogue = format_text(lang("obj_battle_sio_Draw_73_7"), 31);
            }
            else
            {
                susietalk = false;
                charactertalking = false;
                
                switch (randompick)
                {
                    case 1:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_8"), 31);
                        break;
                    case 2:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_9"), 31);
                        break;
                    case 3:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_10"), 31);
                        break;
                    case 4:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_11"), 31);
                        break;
                    case 5:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_12"), 31);
                        break;
                    case 6:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_13"), 31);
                        break;
                    case 7:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_14"), 31);
                        break;
                    case 8:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_15"), 31);
                        break;
                    case 9:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_16"), 31);
                        break;
                    case 10:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_17"), 31);
                        break;
                    case 11:
                        current_dialogue = format_text(lang("obj_battle_sio_Draw_73_18"), 31);
                        break;
                    default:
                        current_dialogue = lang("obj_battle_sio_Draw_73_19");
                        break;
                }
            }
            
            typing_speed = 1;
            break;
        default:
            current_dialogue = lang("obj_battle_sio_Draw_73_20");
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : lang("obj_battle_sio_Draw_73_21");
                
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
                            audio_play_sound(snd_mike, 1, false, 0.6);
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
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    charactertalking = false;
    
    switch (enemydialogue)
    {
        case 1:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_22"), 17);
            typing_speed = 1;
            break;
        case 2:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_23"), 17);
            typing_speed = 1;
            break;
        case 3:
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_24"), 17);
            typing_speed = 1;
            break;
        case 4:
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_25"), 17);
            typing_speed = 1;
            break;
        case 5:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_26"), 17);
            typing_speed = 1;
            break;
        case 6:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_27"), 17);
            typing_speed = 1;
            break;
        case 7:
            tennatalk = false;
            susietalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = -10;
            
            if (!susiedown)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_28"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_29"), 17);
            
            typing_speed = 1;
            break;
        case 8:
            tennatalk = true;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_30"), 17);
            typing_speed = 1;
            break;
        case 9:
            tennatalk = true;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_31"), 17);
            typing_speed = 1;
            break;
        case 10:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 11:
            tennatalk = false;
            ralseitalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = 44;
            
            if (!ralseidown)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_32"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_33"), 17);
            
            typing_speed = 1;
            break;
        case 12:
            tennatalk = true;
            ralseitalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_34"), 17);
            typing_speed = 1;
            break;
        case 13:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 14:
            tennatalk = false;
            ralseitalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = 44;
            
            if (!ralseidown)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_35"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_36"), 17);
            
            typing_speed = 1;
            break;
        case 15:
            tennatalk = true;
            ralseitalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            
            if (!ralseidown)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_37"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_38"), 17);
            
            typing_speed = 1;
            break;
        case 16:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 17:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_39"), 17);
            typing_speed = 1;
            
            if (global.nohit)
            {
                jammer = true;
                generator1 = true;
                generator2 = true;
                global.generator1hp = 17;
                global.generator2hp = 17;
            }
            else
            {
                jammer = true;
                generator1 = true;
                generator2 = true;
                global.generator1hp = 12;
                global.generator2hp = 12;
            }
            
            break;
        case 18:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_40"), 17);
            typing_speed = 1;
            break;
        case 19:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 20:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_41"), 17);
            typing_speed = 1;
            break;
        case 21:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_42"), 17);
            typing_speed = 1;
            break;
        case 22:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 23:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_43"), 17);
            typing_speed = 1;
            break;
        case 24:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 25:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_44"), 17);
            typing_speed = 1;
            break;
        case 26:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_45"), 17);
            typing_speed = 1;
            break;
        case 27:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 28:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_46"), 17);
            typing_speed = 1;
            break;
        case 29:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_47"), 17);
            typing_speed = 1;
            break;
        case 30:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 31:
            tennatalk = false;
            susietalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = -10;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_48"), 17);
            typing_speed = 1;
            
            if (global.nohit)
            {
                jammer = true;
                generator1 = true;
                generator2 = true;
                global.generator1hp = 26;
                global.generator2hp = 26;
            }
            else
            {
                jammer = true;
                generator1 = true;
                generator2 = true;
                global.generator1hp = 24;
                global.generator2hp = 24;
            }
            
            break;
        case 32:
            tennatalk = false;
            susietalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = -10;
            
            if (!susiedown)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_49"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_50"), 17);
            
            typing_speed = 1;
            break;
        case 33:
            tennatalk = true;
            susietalk = false;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_51"), 17);
            typing_speed = 1;
            break;
        case 34:
            tennatalk = false;
            miketalk = true;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_52"), 17);
            typing_speed = 1;
            break;
        case 35:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_53"), 17);
            typing_speed = 1;
            break;
        case 36:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_54"), 17);
            typing_speed = 1;
            break;
        case 37:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_55"), 17);
            typing_speed = 1;
            break;
        case 38:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 39:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_56"), 17);
            typing_speed = 1;
            break;
        case 40:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_57"), 17);
            typing_speed = 1;
            break;
        case 41:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 42:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_58"), 17);
            typing_speed = 1;
            break;
        case 43:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_59"), 17);
            typing_speed = 1;
            break;
        case 44:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_60"), 17);
            typing_speed = 1;
            break;
        case 45:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 46:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_61"), 17);
            typing_speed = 1;
            jammer = true;
            generator1 = true;
            generator2 = true;
            global.generator1hp = 20;
            global.generator2hp = 20;
            break;
        case 47:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 48:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_62"), 17);
            typing_speed = 1;
            break;
        case 49:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_63"), 17);
            typing_speed = 1;
            break;
        case 50:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_64"), 17);
            typing_speed = 1;
            break;
        case 51:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 52:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            
            if (global.nohit)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_65"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_66"), 17);
            
            typing_speed = 1;
            break;
        case 53:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            
            if (global.nohit)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_67"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_68"), 17);
            
            typing_speed = 1;
            break;
        case 54:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_69"), 17);
            typing_speed = 1;
            break;
        case 55:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            
            if (global.nohit)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_70"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_71"), 17);
            
            typing_speed = 1;
            break;
        case 56:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            
            if (global.nohit)
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_72"), 17);
            else
                current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_73"), 17);
            
            typing_speed = 1;
            
            if (text_complete)
            {
                if (!instance_exists(obj_maximike_mute))
                {
                    audio_play_sound(snd_bump, 1, false, 1.6);
                    instance_create_depth(ENEMY1.x, ENEMY1.y, ENEMY1.depth - 2, obj_maximike_mute);
                }
                
                advance_pressed = true;
            }
            
            break;
        case 57:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 0;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_74"), 17);
            typing_speed = 1;
            d57timer++;
            
            if (d57timer == 40)
                advance_pressed = true;
            
            break;
        case 58:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_75"), 17);
            typing_speed = 1;
            break;
        case 59:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_76"), 17);
            typing_speed = 1;
            break;
        case 60:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 61:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(lang("obj_battle_sio_Draw_73_77"), 17);
            typing_speed = 1;
            jammer = true;
            generator1 = true;
            generator2 = true;
            global.generator1hp = 20;
            global.generator2hp = 20;
            break;
    }
    
    var end_cases;
    
    if (enemydialogue >= 62)
    {
        if ((enemydialogue % 2) == 0)
        {
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(string(tennatext), 17);
            typing_speed = 1;
        }
        else
        {
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
        }
        
        end_cases = [];
        var total = 3000;
        
        for (var n = 1; n <= total; n++)
            array_push(end_cases, (2 * n) + 61);
    }
    else
    {
        end_cases = [4, 10, 13, 16, 19, 22, 24, 27, 30, 34, 38, 41, 45, 47, 51, 57, 60, 61];
    }
    
    var text_x = (ENEMYinitialx - 220) + textxoffset;
    var text_y = (ENEMY1.y - 36) + textyoffset;
    
    if (dialoguebubblexscale == 1)
        draw_sprite_ext(spr_c3_dialoguebubble, 0, (ENEMYinitialx - 30) + textxoffset, ENEMY1.y + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
    else
        draw_sprite_ext(spr_c3_dialoguebubble, 0, (ENEMYinitialx - 250) + textxoffset, ENEMY1.y + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
    
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : lang("obj_battle_sio_Draw_73_78");
                
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
            }
            else
            {
                enemydialogue += 1;
                enemydialoguecount += 1;
                reset_dialogue_normal();
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
    
    if (ACTNAME == lang("obj_battle_sio_Draw_73_79"))
    {
        if (ds_map_exists(global.item_data, used_itemk))
        {
            var item_entry = ds_map_find_value(global.item_data, used_itemk);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = lang("obj_battle_sio_Draw_73_80");
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
    else if (ACTNAME == lang("obj_battle_sio_Draw_73_81"))
    {
        if (ds_map_exists(global.item_data, used_items))
        {
            var item_entry = ds_map_find_value(global.item_data, used_items);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = lang("obj_battle_sio_Draw_73_82");
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
    else if (ACTNAME == lang("obj_battle_sio_Draw_73_83"))
    {
        if (ds_map_exists(global.item_data, used_itemr))
        {
            var item_entry = ds_map_find_value(global.item_data, used_itemr);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = lang("obj_battle_sio_Draw_73_84");
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
                current_dialogue = format_text(lang("obj_battle_sio_Draw_73_85"), 31);
            }
            else if (susieacting)
            {
                current_dialogue = format_text(lang("obj_battle_sio_Draw_73_86"), 31);
            }
            else if (ralseiacting)
            {
                current_dialogue = format_text(lang("obj_battle_sio_Draw_73_87"), 31);
            }
            else if (krismercy || susiemercy || ralseimercy)
            {
                current_dialogue = format_text(string(ACTNAME) + lang("obj_battle_sio_Draw_73_88") + string(ENEMYNAME) + lang("obj_battle_sio_Draw_73_89"), 60);
            }
            else if (krisitem || susieitem || ralseiitem)
            {
                current_dialogue = format_text(string(ACTNAME) + lang("obj_battle_sio_Draw_73_90") + string(itemfullname) + lang("obj_battle_sio_Draw_73_91"), 31);
            }
            else if (susiemagic && !(susieactoptions == 1 && jammed))
            {
                if (susieactoptions == 1)
                    current_dialogue = format_text(lang("obj_battle_sio_Draw_73_92"), 31);
                else if (susieactoptions == 0 && susieactoptionsvertical == 1)
                    current_dialogue = format_text(lang("obj_battle_sio_Draw_73_93"), 31);
            }
            else if (ralseimagic)
            {
                if (ralseiactoptions == 1)
                    current_dialogue = lang("obj_battle_sio_Draw_73_94");
                else if (ralseiactoptions == 0 && ralseiactoptionsvertical == 1)
                    current_dialogue = format_text(lang("obj_battle_sio_Draw_73_95"), 31);
            }
            else if (krisactoptions == 1)
            {
                current_dialogue = format_text(lang("obj_battle_sio_Draw_73_96"), 31);
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
                    current_dialogue = format_text(lang("obj_battle_sio_Draw_73_97"), 28);
                }
                else
                {
                    switch (reason)
                    {
                        case 1:
                            dialogueicon = 2;
                            current_dialogue = format_text(lang("obj_battle_sio_Draw_73_98"), 28);
                            break;
                        case 2:
                            dialogueicon = 14;
                            current_dialogue = format_text(lang("obj_battle_sio_Draw_73_99"), 28);
                            break;
                        case 3:
                            dialogueicon = 4;
                            current_dialogue = format_text(lang("obj_battle_sio_Draw_73_100"), 28);
                            break;
                        case 4:
                            dialogueicon = 4;
                            current_dialogue = format_text(lang("obj_battle_sio_Draw_73_101"), 28);
                            break;
                        case 5:
                            dialogueicon = 1;
                            current_dialogue = format_text(lang("obj_battle_sio_Draw_73_102"), 28);
                            break;
                        case 6:
                            dialogueicon = 9;
                            current_dialogue = format_text(lang("obj_battle_sio_Draw_73_103"), 28);
                            break;
                        default:
                            break;
                    }
                }
            }
            
            break;
        default:
            current_dialogue = lang("obj_battle_sio_Draw_73_104");
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : lang("obj_battle_sio_Draw_73_105");
                
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
    
    if (actdialogue == 1)
    {
        var text_parts = string_split(current_dialogue, lang("obj_battle_sio_Draw_73_106"));
        var x_offset = textx;
        var y_offset = texty;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, lang("obj_battle_sio_Draw_73_107"));
            
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
                
                if (string_pos(lang("obj_battle_sio_Draw_73_108"), remaining) > 0)
                {
                    x_offset = textx;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (ralseiactoptions == 1)
    {
        var text_parts = string_split(current_dialogue, lang("obj_battle_sio_Draw_73_109"));
        var x_offset = textx;
        var y_offset = texty;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, lang("obj_battle_sio_Draw_73_110"));
            
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
                
                if (string_pos(lang("obj_battle_sio_Draw_73_111"), remaining) > 0)
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
                
                if (ACTNAME == lang("obj_battle_sio_Draw_73_112"))
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
                else if (ACTNAME == lang("obj_battle_sio_Draw_73_113"))
                {
                    susieacting = false;
                    
                    if (!PARTYMEMBER2.specialrude)
                        susiemagic = false;
                    
                    susiemercy = false;
                    susieitem = false;
                    susiebattleicon = 0;
                    PARTYMEMBER2.image_speed = 1;
                }
                else if (ACTNAME == lang("obj_battle_sio_Draw_73_114"))
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
