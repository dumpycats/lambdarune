var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, image_alpha);
d0timer++;

if (d0timer == 30)
    talking = true;

if (dialogue >= 51)
{
    if (!instance_exists(obj_battle_sio))
    {
        obj_maximike_battle.flashalpha -= 0.1;
        obj_maximike_battle.flashalphax -= 0.1;
        obj_maximike_battle.flashalpha = clamp(obj_maximike_battle.flashalpha, 0, 1);
        obj_maximike_battle.flashalphax = clamp(obj_maximike_battle.flashalphax, 0, 1);
    }
}

if (talking)
{
    if (dialogue > 1)
        image_alpha -= 0.1;
    
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
            tennatalk = true;
            miketalk = false;
            charactertalking = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_0"), 31);
            typing_speed = 1;
            break;
        case 2:
            tennatalk = false;
            miketalk = true;
            charactertalking = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_1"), 25);
            typing_speed = 1;
            break;
        case 3:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_2"), 25);
            typing_speed = 1;
            break;
        case 4:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_3"), 25);
            typing_speed = 1;
            break;
        case 5:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_4"), 25);
            break;
        case 6:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_5"), 25);
            break;
        case 7:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_6"), 25);
            break;
        case 8:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_7"), 25);
            obj_mike_sio.image_index = 2;
            break;
        case 9:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 7;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_8"), 25);
            obj_mike_sio.image_index = 0;
            break;
        case 10:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 6;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_9"), 25);
            obj_mike_sio.image_index = 1;
            break;
        case 11:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 6;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_10"), 25);
            break;
        case 12:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_11"), 25);
            obj_mike_sio.image_index = 7;
            break;
        case 13:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_12"), 25);
            break;
        case 14:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_13"), 25);
            obj_mike_sio.image_index = 7;
            obj_tenna_sio.sprite_index = spr_tenna_wary;
            obj_tenna_sio.image_index = 0;
            break;
        case 15:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_14"), 25);
            obj_tenna_sio.image_index = 2;
            break;
        case 16:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_15"), 25);
            obj_tenna_sio.image_index = 0;
            break;
        case 17:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_16"), 25);
            obj_mike_sio.image_index = 4;
            obj_tenna_sio.sprite_index = spr_tenna_down;
            break;
        case 18:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_17"), 25);
            obj_mike_sio.image_index = 8;
            break;
        case 19:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_18"), 25);
            obj_mike_sio.image_index = 9;
            break;
        case 20:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_19"), 25);
            obj_mike_sio.image_index = 6;
            break;
        case 21:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_20"), 25);
            obj_mike_sio.image_index = 7;
            break;
        case 22:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_21"), 25);
            obj_tenna_sio.sprite_index = spr_tenna_neutral;
            obj_tenna_sio.image_index = 2;
            break;
        case 23:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 7;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_22"), 25);
            obj_mike_sio.image_index = 0;
            break;
        case 24:
            ralseitalk = true;
            miketalk = false;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_23"), 25);
            break;
        case 25:
            ralseitalk = false;
            susietalk = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_24"), 25);
            break;
        case 26:
            ralseitalk = true;
            susietalk = false;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_25"), 25);
            break;
        case 27:
            ralseitalk = true;
            miketalk = false;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_26"), 25);
            break;
        case 28:
            tennatalk = true;
            ralseitalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_27"), 25);
            obj_tenna_sio.sprite_index = spr_tenna_wary;
            obj_tenna_sio.image_index = 1;
            obj_mike_sio.image_index = 6;
            break;
        case 29:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_28"), 25);
            break;
        case 30:
            tennatalk = false;
            susietalk = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 20;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_29"), 25);
            break;
        case 31:
            tennatalk = true;
            susietalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_30"), 25);
            obj_tenna_sio.sprite_index = spr_tenna_down;
            obj_tenna_sio.image_index = 1;
            break;
        case 32:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_31"), 25);
            obj_mike_sio.image_index = 7;
            break;
        case 33:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_32"), 26);
            break;
        case 34:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_33"), 25);
            obj_tenna_sio.sprite_index = spr_tenna_wary;
            obj_tenna_sio.image_index = 1;
            break;
        case 35:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_34"), 25);
            obj_tenna_sio.sprite_index = spr_tenna_neutral;
            obj_tenna_sio.image_index = 2;
            obj_mike_sio.image_index = 5;
            break;
        case 36:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 6;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_35"), 25);
            obj_tenna_sio.sprite_index = spr_tenna_down;
            obj_tenna_sio.image_index = 0;
            endcase36 = dialogue;
            break;
        case 37:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_36"), 25);
            obj_mike_sio.image_index = 7;
            break;
        case 38:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_37"), 25);
            obj_mike_sio.image_index = 6;
            during38timer++;
            
            if (during38timer == 0)
                obj_tenna_sio.image_speed = 1.4285714285714286;
            
            if (during38timer == 21)
                obj_tenna_sio.image_speed = 0;
            
            if (obj_tenna_sio.image_speed > 0 && obj_tenna_sio.image_index >= 16)
            {
                if (!audio_is_playing(snd_noise_reverb))
                    audio_play_sound(snd_noise_reverb, 1, false);
            }
            
            if (!text_complete)
            {
                blockprogress = true;
            }
            else if (text_complete)
            {
                blockprogress = false;
                advance_pressed = true;
            }
            
            break;
        case 39:
            miketalk = false;
            susietalk = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 19;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_38"), 25);
            break;
        case 40:
            tennatalk = true;
            susietalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_39"), 25);
            obj_tenna_sio.image_index = 1;
            break;
        case 41:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_40"), 25);
            break;
        case 42:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_41"), 25);
            break;
        case 43:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_42"), 25);
            break;
        case 44:
            tennatalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 12;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_43"), 31);
            break;
        case 45:
            tennatalk = true;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_44"), 31);
            break;
        case 46:
            tennatalk = true;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_45"), 31);
            break;
        case 47:
            tennatalk = true;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_46"), 31);
            break;
        case 48:
            tennatalk = true;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_47"), 31);
            break;
        case 49:
            tennatalk = true;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_48"), 31);
            break;
        case 50:
            tennatalk = true;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_49"), 31);
            break;
        case 51:
            tennatalk = true;
            ralseitalk = false;
            charactertalking = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_50"), 25);
            audio_sound_pitch(mus_GALLERY, gallerypitch);
            audio_sound_gain(mus_GALLERY, 0, 1500);
            gallerypitch -= 0.011111111111111112;
            gallerypitch = clamp(gallerypitch, 0, 1);
            break;
        default:
            current_dialogue = translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_51");
            break;
    }
    
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_52");
                
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
                    else if (next_char == "}" || next_char == "{" || next_char == "@" || next_char == "-")
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
                        else if (tennatalk)
                            audio_play_sound(snd_tenna, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.5);
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
    
    var endcase = [22, 38, 40, 43, 51, endcase36];
    
    if ((advance_pressed && !blockprogress) || skiptimer == 3)
    {
        if (text_complete)
        {
            quippercent = 0;
            
            if (array_contains(endcase, dialogue))
            {
                if (dialogue == 22)
                    d22trigger = true;
                
                if (dialogue == 38)
                    d38trigger = true;
                
                if (dialogue == 40)
                    d40trigger = true;
                
                if (dialogue == 43)
                    d43trigger = true;
                
                if (dialogue == 51)
                {
                    d51trigger = true;
                    audio_stop_sound(mus_GALLERY);
                }
                
                if (dialogue == endcase36)
                    e36trigger = true;
                
                talking = false;
            }
            else
            {
                dialogue += 1;
                reset_dialogue_normal();
            }
        }
        
        skiptimer = -1;
    }
    else if (skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_tenna);
        audio_stop_sound(snd_mike);
    }
    
    if (keyboard_check(ord("C")) && !blockprogress)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
        skiptext = false;
    
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

if (d22trigger)
{
    d22timer++;
    
    if (d22timer == 0)
    {
        obj_tenna_sio.sprite_index = spr_tenna_neutral;
        obj_tenna_sio.image_index = 1;
        obj_mike_sio.image_index = 1;
        instance_create_depth(-40, 230, -198, obj_kris_sio);
        instance_create_depth(-20, 274, -199, obj_susie_sio);
        instance_create_depth(-40, 312, -200, obj_ralsei_sio);
        obj_kris_sio.speed = 6;
        obj_susie_sio.speed = 6;
        obj_ralsei_sio.speed = 6;
        obj_kris_sio.image_xscale = 2;
        obj_susie_sio.image_xscale = 2;
        obj_ralsei_sio.image_xscale = 2;
        obj_kris_sio.image_yscale = 2;
        obj_susie_sio.image_yscale = 2;
        obj_ralsei_sio.image_yscale = 2;
        obj_kris_sio.sprite_index = sKrisWalkRight;
        obj_susie_sio.sprite_index = sSusieWalkRight;
        obj_ralsei_sio.sprite_index = sRalseiWalkRight;
        obj_kris_sio.image_speed = 2;
        obj_susie_sio.image_speed = 2;
        obj_ralsei_sio.image_speed = 2;
    }
    
    if (d22timer == 38)
    {
        obj_kris_sio.speed = 0;
        obj_susie_sio.speed = 0;
        obj_ralsei_sio.speed = 0;
        obj_kris_sio.image_speed = 0;
        obj_susie_sio.image_speed = 0;
        obj_ralsei_sio.image_speed = 0;
        obj_kris_sio.image_index = 0;
        obj_susie_sio.image_index = 0;
        obj_ralsei_sio.image_index = 0;
    }
    
    if (d22timer == 60)
    {
        talking = true;
        dialogue = 23;
        reset_dialogue_normal();
    }
}

if (e36trigger)
{
    e36timer++;
    
    if (e36timer == 0)
    {
        obj_tenna_sio.sprite_index = spr_tenna_remote;
        obj_tenna_sio.image_speed = 1;
        window_set_caption(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_53"));
    }
    
    if (e36timer == 52)
        obj_tenna_sio.image_speed = 0;
    
    if (e36timer == 60)
    {
        talking = true;
        dialogue = 37;
        reset_dialogue_normal();
    }
}

if (d38trigger)
{
    d38timer++;
    
    if (d38timer == 0)
    {
        obj_maximike_foreground.image_index = 1;
        obj_mike_sio.image_index = 0;
        obj_mike_sio.sprite_index = spr_mike_stunned;
        obj_mike_sio.image_speed = 1;
        audio_play_sound(snd_car_doorslam, 1, false);
        audio_sound_pitch(mus_f_noise, 1);
        audio_sound_gain(mus_f_noise, 1, 0);
        audio_play_sound(mus_f_noise, 1, true, 0.7);
        obj_susie_sio.image_xscale = -2;
        obj_susie_sio.sprite_index = sSusieShocked;
        obj_ralsei_sio.sprite_index = sRalseiShocked;
    }
    
    switch (d38timer)
    {
        case 0:
            camera_set_view_pos(view_camera[0], 26, 20);
            window_set_caption(translation_get_string("gml_Object_obj_sio_text_prelude_Draw_73_54"));
            break;
        case 2:
            camera_set_view_pos(view_camera[0], 14, 20);
            break;
        case 4:
            camera_set_view_pos(view_camera[0], 24, 20);
            break;
        case 6:
            camera_set_view_pos(view_camera[0], 16, 20);
            break;
        case 8:
            camera_set_view_pos(view_camera[0], 22, 20);
            break;
        case 10:
            camera_set_view_pos(view_camera[0], 18, 20);
            break;
        case 12:
            camera_set_view_pos(view_camera[0], 21, 20);
            break;
        case 14:
            camera_set_view_pos(view_camera[0], 19, 20);
            break;
        case 16:
            camera_set_view_pos(view_camera[0], 20, 20);
            break;
        case 60:
            audio_play_sound(snd_impact, 1, false);
            obj_mike_sio.sprite_index = spr_mike_fall;
            obj_tenna_sio.sprite_index = spr_tenna_down;
            obj_tenna_sio.image_index = 0;
            obj_mike_sio.xoffset = 4;
            break;
        case 62:
            obj_mike_sio.xoffset = -4;
            break;
        case 64:
            obj_mike_sio.xoffset = 3;
            break;
        case 66:
            obj_mike_sio.xoffset = -3;
            break;
        case 68:
            obj_mike_sio.xoffset = 2;
            break;
        case 70:
            obj_mike_sio.xoffset = -2;
            break;
        case 72:
            obj_mike_sio.xoffset = 1;
            break;
        case 74:
            obj_mike_sio.xoffset = 0;
            break;
        default:
            break;
    }
    
    if (d38timer == 100)
    {
        audio_stop_sound(mus_f_noise);
        audio_play_sound(snd_weaponpull, 1, false);
        obj_ralsei_sio.sprite_index = sRalseiWalkRightUpset;
        obj_susie_sio.image_xscale = 2;
        obj_susie_sio.rush = true;
        obj_susie_sio.y -= 8;
    }
    
    if (d38timer == 130)
    {
        audio_sound_gain(mus_GALLERY, 1, 0);
        audio_sound_pitch(mus_GALLERY, 1);
        audio_play_sound(mus_GALLERY, 1, true, 0.8);
        talking = true;
        dialogue = 39;
        reset_dialogue_normal();
    }
}

if (d40trigger)
{
    d40timer++;
    
    if (d40timer == 0)
    {
        obj_maximike_background.shaking = true;
        audio_play_sound(snd_rumble, 1, true);
    }
    
    if (d40timer == 30)
    {
        talking = true;
        dialogue = 41;
        reset_dialogue_normal();
    }
}

if (d43trigger)
{
    d43timer++;
    
    if (d43timer == 0)
    {
        obj_susie_sio.sprite_index = sSusieWalkRightUpset;
        obj_susie_sio.y += 8;
        obj_susie_sio.x += 8;
        obj_maximike_background.breaking = true;
        audio_play_sound(snd_screenshake, 1, false, 1.4);
        audio_stop_sound(snd_rumble);
    }
    
    switch (d43timer)
    {
        case 0:
            camera_set_view_pos(view_camera[0], 20, 26);
            break;
        case 2:
            camera_set_view_pos(view_camera[0], 20, 14);
            break;
        case 4:
            camera_set_view_pos(view_camera[0], 20, 24);
            break;
        case 6:
            camera_set_view_pos(view_camera[0], 20, 16);
            break;
        case 8:
            camera_set_view_pos(view_camera[0], 20, 22);
            break;
        case 10:
            camera_set_view_pos(view_camera[0], 20, 18);
            break;
        case 12:
            camera_set_view_pos(view_camera[0], 20, 21);
            break;
        case 14:
            camera_set_view_pos(view_camera[0], 20, 19);
            break;
        case 16:
            camera_set_view_pos(view_camera[0], 20, 20);
            break;
        default:
            break;
    }
    
    if (d43timer == 100)
    {
        var maxi = instance_create_depth(580, 655, obj_maximike_foreground.depth + 2, obj_maximike_battle);
        maxi.rise = true;
        audio_play_sound(snd_chain_extend, 1, true);
    }
    
    if (d43timer == 250)
    {
        talking = true;
        dialogue = 44;
        reset_dialogue_normal();
    }
}

if (d51trigger)
{
    d51timer++;
    
    if (d51timer == 0)
    {
        obj_kris_sio.battlestart = true;
        obj_kris_sio.image_speed = 1;
        obj_susie_sio.image_speed = 1;
        obj_ralsei_sio.image_speed = 1;
        global.battle = true;
    }
    
    if (d51timer == 50)
        instance_destroy();
}
