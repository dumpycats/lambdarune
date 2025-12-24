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
    draw_set_font(fDeterminationMW_small);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x = 190;
    var text_y = 234;
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    
    if (!destroy)
    {
        draw_text_color(text_x + 0.5, text_y + 0.5, displayed_text, shadow_color1, shadow_color1, shadow_color, shadow_color, 1);
        draw_set_color(c_white);
        draw_text(text_x, text_y, displayed_text);
    }
    
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    
    switch (dialogue)
    {
        case 1:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_0"), 32);
            typing_speed = 0.5;
            break;
        case 2:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_1"), 32);
            typing_speed = 0.5;
            
            if (displayed_text >= format_text("...g", 32))
                audio_stop_sound(mus_f_noise);
            
            break;
        case 3:
            foanetalk = false;
            feighlinetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_2"), 32);
            typing_speed = 0.5;
            foanegain = 1.5;
            break;
        case 4:
            foanetalk = false;
            feighlinetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_3"), 32);
            typing_speed = 0.5;
            foanegain = 1.5;
            break;
        case 5:
            foanetalk = true;
            feighlinetalk = false;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_4"), 32);
            typing_speed = 0.5;
            break;
        case 6:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_5"), 32);
            typing_speed = 0.5;
            break;
        case 7:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_6"), 32);
            typing_speed = 0.5;
            break;
        case 8:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_7"), 32);
            typing_speed = 0.5;
            break;
        case 9:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_8"), 32);
            typing_speed = 0.5;
            break;
        case 10:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_9"), 32);
            typing_speed = 0.6;
            break;
        case 11:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_10"), 32);
            typing_speed = 0.7;
            break;
        case 12:
            foanetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_11"), 32);
            typing_speed = 0.8;
            break;
        case 13:
            foanetalk = false;
            feighlinetalk = true;
            current_dialogue = format_text(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_12"), 32);
            typing_speed = 1;
            audio_stop_sound(mus_revolution);
            window_set_caption(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_13"));
            break;
        default:
            current_dialogue = translation_get_string("gml_Object_obj_foanetv_2_Draw_73_14");
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : translation_get_string("gml_Object_obj_foanetv_2_Draw_73_15");
                
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
                        else if (feighlinetalk)
                            audio_play_sound(snd_feighline, 1, false, 0.8);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (foanetalk)
                            audio_play_sound(snd_foane, 1, false, 0.5 * foanegain);
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
    
    var endcase = [2, 4, 12, 13];
    
    if (advance_pressed && !blockprogress)
    {
        if (text_complete)
        {
            quippercent = 0;
            
            if (array_contains(endcase, dialogue))
            {
                talking = false;
                
                if (dialogue == 2)
                {
                    audio_sound_gain(mus_revolution, 1, 0);
                    audio_play_sound(mus_revolution, 1, true);
                    window_set_caption(translation_get_string("gml_Object_obj_foanetv_2_Draw_73_16"));
                    d2trigger = true;
                }
                
                if (dialogue == 4)
                    d4trigger = true;
                
                if (dialogue == 12)
                    d12trigger = true;
                
                if (dialogue == 13)
                {
                    audio_sound_gain(mus_f_noise, 0, 0);
                    audio_play_sound(mus_f_noise, 1, true);
                    outro = true;
                }
            }
            else
            {
                dialogue += 1;
                reset_dialogue_normal();
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
        audio_stop_sound(snd_kreid);
    }
    
    if (keyboard_check(ord("C")) && !blockprogress)
    {
    }
    
    if (keyboard_check_released(ord("C")) || blockprogress)
    {
    }
    
    if (skiptext)
    {
    }
    
    if (skiptimer == 2)
    {
        quippercent = 0;
        
        if (array_contains(endcase, dialogue))
        {
            talking = false;
        }
        else
        {
            dialogue += 1;
            reset_dialogue_normal();
        }
    }
}
