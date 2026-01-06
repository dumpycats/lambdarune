var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking)
{
    interacttimer = -2;
    subimg += 0.1;
    
    if (dialoguetop)
    {
        draw_sprite_ext(sDialogueBoxLW, subimg, cam_x + 320, cam_y + 86, 2, 2, 0, c_white, 1);
        quipyoffset = -308;
    }
    else if (dialoguebottom)
    {
        draw_sprite_ext(sDialogueBoxLW, subimg, cam_x + 320, cam_y + 394, 2, 2, 0, c_white, 1);
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
    var shadow_red = 76;
    
    if (!destroy)
    {
        draw_set_color(c_white);
        
        if (!cloaktalk)
        {
            draw_text(text_x, text_y, displayed_text);
        }
        else
        {
            var lightred = 12171775;
            draw_text_color(text_x, text_y, displayed_text, lightred, lightred, c_white, c_white, 1);
        }
    }
    
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    
    switch (dialogue)
    {
        case 1:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_0"), 31);
            typing_speed = 2/3;
            break;
        case 2:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_1"), 31);
            typing_speed = 2/3;
            sprite_index = spr_alvin_down;
            break;
        case 3:
            texttalk = false;
            cloaktalk = true;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_2"), 31);
            typing_speed = 2/3;
            break;
        case 4:
            texttalk = false;
            cloaktalk = true;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_3"), 31);
            typing_speed = 2/3;
            sprite_index = spr_alvin_stress;
            break;
        case 5:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_4"), 31);
            typing_speed = 2/3;
            sprite_index = spr_alvin_backshot;
            break;
        case 6:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_5"), 31);
            typing_speed = 2/3;
            break;
        case 7:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_6"), 31);
            typing_speed = 2/3;
            break;
        case 8:
            texttalk = false;
            cloaktalk = true;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_7"), 31);
            typing_speed = 2/3;
            break;
        case 9:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_8"), 31);
            typing_speed = 2/3;
            image_index = 1;
            break;
        case 10:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_9"), 31);
            typing_speed = 2/3;
            break;
        case 11:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_10"), 31);
            typing_speed = 2/3;
            break;
        case 12:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_11"), 31);
            typing_speed = 2/3;
            break;
        case 13:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_12"), 31);
            typing_speed = 2/3;
            sprite_index = spr_alvin_stress;
            break;
        case 14:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_13"), 31);
            typing_speed = 2/3;
            break;
        case 15:
            texttalk = true;
            cloaktalk = false;
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_14"), 31);
            typing_speed = 2/3;
            sprite_index = spr_alvin_down;
            audio_sound_gain(mus_church_knight, 0, 100);
            audio_sound_gain(mus_menacing_rise, 0, 100);
            obj_cloak_c3.depth = obj_alvin_c3.depth - 5;
            break;
        case 16:
            texttalk = true;
            cloaktalk = false;
            d16timer++;
            
            if (d16timer == 0)
            {
                audio_play_sound(mus_menacing_rise, 1, false);
                blockprogress = true;
                obj_cloak_c3.image_speed = 1;
                audio_sound_gain(mus_menacing_rise, 0.6, 100);
                instance_create_depth(obj_cloak_c3.x, 236, obj_cloak_c3.depth + 2, obj_knight_eclipse);
            }
            
            audio_sound_pitch(mus_menacing_rise, d16timer / 22);
            
            if (text_complete)
            {
                d16endtimer++;
                
                if (d16endtimer == 20)
                {
                    blockprogress = false;
                    advance_pressed = true;
                }
            }
            
            current_dialogue = format_text(get_lang_string("obj_alvin_c3_Draw_73_15"), 31);
            typing_speed = 0.5;
            window_set_caption("");
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
                        else if (cloaktalk)
                            audio_play_sound(snd_text, 1, false, 1, false, 0.9);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.6);
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
    
    var endcase = [16];
    
    if ((advance_pressed && !blockprogress) || (skiptimer == 2 && !blockprogress))
    {
        if (text_complete)
        {
            quippercent = 0;
            
            if (array_contains(endcase, dialogue))
            {
                audio_stop_sound(mus_menacing_rise);
                obj_cloak_c3.endtrigger = true;
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
    else if ((skip_pressed && !advance_pressed && !blockprogress) || (skiptimer == 1 && !blockprogress))
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
            if (texttalk)
                audio_play_sound(snd_text, 1, false);
            else if (cloaktalk)
                audio_play_sound(snd_text, 1, false, 1, false, 0.9);
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
