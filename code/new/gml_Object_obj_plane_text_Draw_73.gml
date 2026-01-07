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
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_0"), 25);
            typing_speed = 1;
            break;
        case 2:
            quip = false;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_1"), 25);
            typing_speed = 1;
            dialogueicon = 5;
            break;
        case 3:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_2"), 25);
            dialogueicon = 0;
            typing_speed = 1;
            break;
        case 4:
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_3"), 25);
            typing_speed = 1;
            dialogueicon = 10;
            break;
        case 5:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 20;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_4"), 25);
            typing_speed = 1;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 6:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_5"), 25);
            dialogueicon = 7;
            typing_speed = 1;
            break;
        case 7:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 22;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_6"), 25);
            typing_speed = 1;
            break;
        case 8:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_7"), 25);
            dialogueicon = 15;
            typing_speed = 1;
            break;
        case 9:
            dialogueiconchoice = spr_empty;
            susietalk = false;
            ralseitalk = false;
            texttalk = true;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_8"), 25);
            typing_speed = 1;
            obj_susie_plane.image_index = 1;
            obj_ralsei_plane.image_index = 1;
            break;
        case 10:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_9"), 25);
            dialogueicon = 5;
            typing_speed = 1;
            break;
        case 11:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_10"), 25);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 12:
            quip = true;
            quipstring = translation_get_string("obj_plane_text_Draw_73_11");
            quipicon = sSusieDialogueSprite;
            quipindex = 4;
            kreidtalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_12"), 25);
            dialogueicon = 12;
            typing_speed = 1;
            break;
        case 13:
            quip = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_13"), 25);
            dialogueicon = 12;
            typing_speed = 1;
            break;
        case 14:
            quip = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_14"), 25);
            dialogueicon = 8;
            typing_speed = 1;
            break;
        case 15:
            quip = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_15"), 25);
            dialogueicon = 13;
            typing_speed = 1;
            break;
        case 16:
            quip = false;
            kreidtalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_16"), 25);
            dialogueicon = 12;
            typing_speed = 1;
            break;
        case 17:
            quip = false;
            kreidtalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_17"), 25);
            dialogueicon = 2;
            typing_speed = 1;
            break;
        case 18:
            angertimer++;
            quip = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_18"), 25);
            dialogueicon = 9;
            typing_speed = 1;
            
            if (angertimer == 0)
                obj_kreid_plane.sprite_index = spr_kreid_peanutthrow;
            
            break;
        case 19:
            quip = false;
            kreidtalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 18;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_19"), 25);
            typing_speed = 1;
            blockprogress = true;
            d19timer++;
            
            if (d19timer == 30)
            {
                dialogue = 20;
                reset_dialogue_normal();
            }
            
            break;
        case 20:
            quip = false;
            kreidtalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 30;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_20"), 25);
            typing_speed = 1;
            blockprogress = true;
            d20timer++;
            
            if (d20timer == 50)
            {
                obj_kris_plane.sprite_index = sKrisWalkLeft;
                talking = false;
                waitbit = true;
                reset_dialogue_normal();
            }
            
            break;
        case 21:
            quip = false;
            kreidtalk = false;
            texttalk = true;
            ralseitalk = false;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_21"), 31);
            typing_speed = 1;
            blockprogress = false;
            
            if ((!pause_for_punctuation && advance_pressed && !blockprogress && text_complete) || keyboard_check(ord("C")))
                hit = true;
            
            break;
        case 22:
            quip = false;
            kreidtalk = false;
            texttalk = true;
            ralseitalk = false;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_22"), 31);
            typing_speed = 1;
            blockprogress = false;
            
            if ((!pause_for_punctuation && advance_pressed && !blockprogress && text_complete) || keyboard_check(ord("C")))
                parachute = true;
            
            break;
        case 23:
            charactertalking = true;
            quip = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_23"), 25);
            dialogueicon = 1;
            typing_speed = 1;
            audio_sound_gain(mus_midnightmeeting, 0, 2500);
            break;
        case 24:
            charactertalking = true;
            quip = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_24"), 25);
            dialogueicon = 10;
            typing_speed = 1;
            break;
        case 25:
            charactertalking = true;
            quip = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_25"), 25);
            dialogueicon = 9;
            typing_speed = 1;
            
            if ((!pause_for_punctuation && advance_pressed && !blockprogress && text_complete) || keyboard_check(ord("C")))
                kreidtokris = true;
            
            break;
        case 26:
            charactertalking = true;
            quip = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_26"), 25);
            dialogueicon = 14;
            typing_speed = 1;
            
            if ((!pause_for_punctuation && advance_pressed && !blockprogress && text_complete) || keyboard_check(ord("C")))
                kreidshove = true;
            
            break;
        case 27:
            charactertalking = true;
            quip = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_plane_text_Draw_73_27"), 25);
            dialogueicon = 15;
            typing_speed = 1;
            
            if (!text_complete)
            {
                blockprogress = true;
            }
            else
            {
                if (obj_kreid_plane.sprite_index == spr_kreid_angryshove)
                    obj_kreid_plane.image_speed = 0.5;
                
                blockprogress = false;
            }
            
            if (obj_kreid_plane.image_speed == 1 && obj_kreid_plane.sprite_index == spr_kreid_angryleft)
            {
                obj_kreid_plane.image_speed = 0;
                obj_kreid_plane.image_index = 0;
            }
            
            if ((!pause_for_punctuation && advance_pressed && !blockprogress && text_complete) || (keyboard_check(ord("C")) && !blockprogress))
            {
                obj_kreid_plane.sprite_index = spr_kreid_rageleft;
                firespawn = true;
            }
            
            break;
        default:
            current_dialogue = "";
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
    
    var endcase = [8, 9, 10, 15, 18, 21, 22, 25, 26, 27, 35];
    var whistlecase = [8];
    var gigcase = [9];
    var kreidspawncase = [10];
    var closeincase = [15];
    var kreidnut = [18];
    
    if ((advance_pressed && !blockprogress) || (skiptimer == 2 && !blockprogress))
    {
        if (text_complete)
        {
            quippercent = 0;
            skiptimer = 0;
            
            if (array_contains(endcase, dialogue))
            {
                talking = false;
                
                if (array_contains(whistlecase, dialogue))
                {
                    audio_play_sound(snd_whistle, 1, false);
                    whistle = true;
                    charactertalking = false;
                }
                
                if (array_contains(gigcase, dialogue))
                {
                    obj_plane_shadowman.image_speed = 1;
                    audio_play_sound(snd_grab, 1, false);
                    reveal = true;
                    window_set_caption(translation_get_string("obj_plane_text_Draw_73_28"));
                }
                
                if (array_contains(kreidspawncase, dialogue))
                {
                    charactertalking = false;
                    obj_kris_plane.image_index = 1;
                    obj_susie_plane.sprite_index = sSusieWalkRightUpset;
                    obj_ralsei_plane.sprite_index = sRalseiWalkRight;
                    obj_kreid_plane.move1 = true;
                }
                
                if (array_contains(closeincase, dialogue))
                    obj_plane_shadowman.closein = true;
                
                if (array_contains(kreidnut, dialogue))
                    obj_kreid_plane.kreidnut = true;
            }
            else
            {
                skiptimer = 0;
                dialogue += 1;
                reset_dialogue_normal();
            }
        }
    }
    else if ((skip_pressed && !advance_pressed && !blockprogress) || (skiptimer == 1 && !blockprogress))
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_kreid);
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
