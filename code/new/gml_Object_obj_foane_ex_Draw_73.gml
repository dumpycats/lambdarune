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
            audio_stop_sound(mus_wind);
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 18;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_0"), 25);
            typing_speed = 1;
            break;
        case 2:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_1"), 31);
            typing_speed = 1;
            break;
        case 3:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_2"), 31);
            typing_speed = 1;
            break;
        case 4:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_3"), 31);
            typing_speed = 1;
            break;
        case 5:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_4"), 31);
            typing_speed = 1;
            break;
        case 6:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_5"), 31);
            typing_speed = 1;
            break;
        case 7:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_6"), 31);
            typing_speed = 1;
            break;
        case 8:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_7"), 31);
            typing_speed = 1;
            break;
        case 9:
            susietalk = true;
            foanetalk = false;
            charactertalking = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 27;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_8"), 25);
            typing_speed = 1;
            break;
        case 10:
            susietalk = false;
            emptytalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_9"), 31);
            typing_speed = 1/3;
            
            if (text_complete)
                blockprogress = false;
            
            d9alpha -= 0.05;
            break;
        case 11:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_10"), 31);
            typing_speed = 1;
            break;
        case 12:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_11"), 31);
            typing_speed = 1;
            break;
        case 13:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_12"), 31);
            typing_speed = 1;
            sprite_index = spr_foane_ex_raise;
            image_index = 0;
            break;
        case 14:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_13"), 31);
            typing_speed = 1;
            break;
        case 15:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_14"), 31);
            typing_speed = 1;
            sprite_index = spr_foane_ex_down;
            image_index = 2;
            break;
        case 16:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = get_lang_string("gml_Object_obj_foane_ex_Draw_73_15");
            typing_speed = 1;
            break;
        case 17:
            susietalk = true;
            foanetalk = false;
            charactertalking = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 19;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_16"), 25);
            typing_speed = 1;
            break;
        case 18:
            susietalk = true;
            foanetalk = false;
            charactertalking = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 35;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_17"), 25);
            typing_speed = 1;
            break;
        case 19:
            susietalk = true;
            foanetalk = false;
            charactertalking = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 18;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_18"), 25);
            typing_speed = 1;
            image_index = 2;
            break;
        case 20:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_19"), 31);
            typing_speed = 1;
            break;
        case 21:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_20"), 31);
            typing_speed = 1;
            break;
        case 22:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_21"), 31);
            typing_speed = 1;
            image_index = 0;
            break;
        case 23:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_22"), 31);
            typing_speed = 1;
            break;
        case 24:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_23"), 31);
            typing_speed = 1;
            image_index = 2;
            break;
        case 25:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_24"), 31);
            typing_speed = 1;
            image_index = 0;
            break;
        case 26:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_25"), 31);
            typing_speed = 1;
            break;
        case 27:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_26"), 31);
            typing_speed = 1;
            image_index = 0;
            sprite_index = spr_foane_ex_laugh_2;
            break;
        case 28:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_27"), 31);
            typing_speed = 1;
            break;
        case 29:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_28"), 31);
            typing_speed = 1;
            break;
        case 30:
            susietalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_29"), 31);
            typing_speed = 1;
            image_index = 0;
            break;
        case 31:
            ralseitalk = true;
            foanetalk = false;
            charactertalking = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 34;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_30"), 25);
            typing_speed = 1;
            break;
        case 32:
            ralseitalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_31"), 31);
            typing_speed = 1;
            break;
        case 33:
            ralseitalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_32"), 31);
            typing_speed = 1;
            break;
        case 34:
            ralseitalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_33"), 31);
            typing_speed = 1;
            sprite_index = spr_foane_ex_raise;
            image_index = 3;
            break;
        case 35:
            ralseitalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_34"), 31);
            typing_speed = 1;
            audio_stop_sound(mus_revolution);
            sprite_index = spr_foane_ex_down;
            image_index = 2;
            break;
        case 36:
            ralseitalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_35"), 31);
            typing_speed = 1;
            break;
        case 37:
            ralseitalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_36"), 31);
            typing_speed = 1;
            break;
        case 38:
            ralseitalk = true;
            foanetalk = false;
            charactertalking = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 35;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_37"), 25);
            typing_speed = 1;
            break;
        case 39:
            ralseitalk = false;
            foanetalk = true;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_foane_ex_Draw_73_38"), 31);
            typing_speed = 1;
            obj_pathway_sof.image_index = 1;
            obj_pathway_sof.sprite_index = spr_screenroom_shatter;
            obj_susie_sof.sprite_index = sSusieShockedFront2;
            obj_susie_sof.image_index = 0;
            obj_ralsei_sof.sprite_index = sRalseiShockedFront;
            obj_ralsei_sof.image_index = 0;
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
                        else if (foanetalk)
                            audio_play_sound(snd_foane, 1, false);
                        else if (emptytalk)
                            audio_play_sound(snd_mike, 1, false, 0);
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
    
    if (dialogue == 4)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_foane_ex_Draw_73_39"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 3);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 2:
                        color = color2;
                        audio_sound_pitch(snd_foane, 0.995);
                        break;
                    case 3:
                        color = color3;
                        audio_sound_pitch(snd_foane, 0.99);
                        break;
                    case 4:
                        color = color4;
                        audio_sound_pitch(snd_foane, 0.985);
                        break;
                    case 5:
                        color = color5;
                        audio_sound_pitch(snd_foane, 0.98);
                        break;
                    case 6:
                        color = color6;
                        audio_sound_pitch(snd_foane, 0.975);
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (dialogue == 12)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_foane_ex_Draw_73_40"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 4);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 2:
                        color = color2;
                        audio_sound_pitch(snd_foane, 0.995);
                        break;
                    case 3:
                        color = color3;
                        audio_sound_pitch(snd_foane, 0.99);
                        break;
                    case 4:
                        color = color4;
                        audio_sound_pitch(snd_foane, 0.985);
                        break;
                    case 5:
                        color = color5;
                        audio_sound_pitch(snd_foane, 0.98);
                        break;
                    case 6:
                        color = color6;
                        audio_sound_pitch(snd_foane, 0.975);
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (dialogue == 16)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_foane_ex_Draw_73_41"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
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
                        color = 255;
                        break;
                }
                
                draw_set_color(#320000);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (dialogue == 23)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_foane_ex_Draw_73_42"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 3);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 2:
                        color = color2;
                        audio_sound_pitch(snd_foane, 0.995);
                        break;
                    case 3:
                        color = color3;
                        audio_sound_pitch(snd_foane, 0.99);
                        break;
                    case 4:
                        color = color4;
                        audio_sound_pitch(snd_foane, 0.985);
                        break;
                    case 5:
                        color = color5;
                        audio_sound_pitch(snd_foane, 0.98);
                        break;
                    case 6:
                        color = color6;
                        audio_sound_pitch(snd_foane, 0.975);
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (dialogue == 26)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_foane_ex_Draw_73_43"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 4);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 2:
                        color = color2;
                        audio_sound_pitch(snd_foane, 0.995);
                        break;
                    case 3:
                        color = color3;
                        audio_sound_pitch(snd_foane, 0.99);
                        break;
                    case 4:
                        color = color4;
                        audio_sound_pitch(snd_foane, 0.985);
                        break;
                    case 5:
                        color = color5;
                        audio_sound_pitch(snd_foane, 0.98);
                        break;
                    case 6:
                        color = color6;
                        audio_sound_pitch(snd_foane, 0.975);
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    var endcase = [1, 6, 8, 9, 10, 15, 19, 27, 34, 37, 39];
    
    if ((advance_pressed && !blockprogress) || skiptimer == 2)
    {
        audio_sound_pitch(snd_foane, 1);
        
        if (text_complete)
        {
            quippercent = 0;
            
            if (array_contains(endcase, dialogue))
            {
                if (dialogue == 1)
                    d1trigger = true;
                
                if (dialogue == 6)
                {
                    d6trigger = true;
                    
                    if (!audio_is_playing(snd_screenglitch))
                        audio_play_sound(snd_screenglitch, 1, false, 0.7);
                    
                    obj_tv_background.sprite_index = spr_tv_background_off;
                    obj_tv_background.image_speed = 0;
                    obj_tv_background.image_index = 0;
                }
                
                if (dialogue == 8)
                    d8trigger = true;
                
                if (dialogue == 9)
                {
                    d9trigger = true;
                    sprite_index = spr_foane_ex_down;
                    image_index = 0;
                }
                
                if (dialogue == 10)
                {
                    d10trigger = true;
                    audio_sound_gain(mus_revolution, 0, 0);
                    audio_play_sound(mus_revolution, 1, true, 0.6, false, 0.9);
                    audio_play_sound(snd_foane_laugh, 1, false);
                    sprite_index = spr_foane_ex_laugh;
                    image_speed = 1;
                }
                
                if (dialogue == 15)
                {
                    d13trigger = true;
                    sprite_index = spr_foane_ex_raise;
                    image_index = 0;
                }
                
                if (dialogue == 19)
                    d17trigger = true;
                
                if (dialogue == 27)
                {
                    d25trigger = true;
                    audio_play_sound(snd_foane_laugh, 1, false, 0.5);
                    sprite_index = spr_foane_ex_laugh_2;
                    image_speed = 1;
                }
                
                if (dialogue == 34)
                    d32trigger = true;
                
                if (dialogue == 37)
                    d35trigger = true;
                
                if (dialogue == 39)
                {
                    d37trigger = true;
                    obj_pathway_sof.sprite_index = spr_screenroom_shatter;
                    obj_pathway_sof.image_speed = 1;
                    audio_play_sound(snd_explosion, 1, false);
                    image_index = 3;
                    obj_kris_sof.sprite_index = spr_kris_fall;
                    obj_kris_sof.image_speed = 1;
                    obj_susie_sof.sprite_index = spr_susie_fall;
                    obj_susie_sof.image_speed = 1;
                    obj_ralsei_sof.sprite_index = spr_ralsei_fall;
                    obj_ralsei_sof.image_speed = 1;
                }
                
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

if (dialogue < 37)
{
    x = xx + xoffset;
    y = yy + yoffset;
}

if (image_xscale == 2)
    xx = 320;
else
    xx = 322;

if (d1trigger)
{
    d1timer++;
    
    if (d1timer <= 120)
    {
        var position = animcurve_channel_evaluate(curveease, d1timer / 120);
        var campanup = lerp(1440, 0, position);
        camera_set_view_pos(view_camera[0], 0, campanup);
    }
    
    if (d1timer == 160)
    {
        talking = true;
        dialogue = 2;
        reset_dialogue_normal();
    }
}

if (d6trigger)
{
    d6timer++;
    
    if (d6timer == 28)
        obj_tv_background.image_index = 1;
    
    if (d6timer == 60)
    {
        talking = true;
        dialogue = 7;
        reset_dialogue_normal();
    }
}

if (d8trigger)
{
    d8timer++;
    
    if (d8timer >= 30)
    {
        if (d8timer <= 120)
        {
            var position = animcurve_channel_evaluate(curveease, (d8timer - 30) / 80);
            var campandown = lerp(0, 240, position);
            camera_set_view_pos(view_camera[0], 0, campandown);
        }
        
        obj_kris_sof.y = 600;
        obj_kris_sof.x = 220;
        obj_susie_sof.y = 580;
        obj_susie_sof.x = 320;
        obj_ralsei_sof.y = 600;
        obj_ralsei_sof.x = 420;
    }
    
    if (d8timer == 150)
    {
        talking = true;
        dialogue = 9;
        reset_dialogue_normal();
        d8trigger = false;
    }
}

if (d9trigger)
{
    d9timer++;
    
    switch (d9timer)
    {
        case 0:
            audio_play_sound(snd_undynestep, 1, false, 1, false, 0.9);
            xoffset = 4;
            break;
        case 2:
            xoffset = -3;
            break;
        case 4:
            xoffset = 2;
            break;
        case 6:
            xoffset = -2;
            break;
        case 8:
            xoffset = 1;
            break;
        case 10:
            xoffset = -1;
            break;
        case 12:
            xoffset = 0;
            break;
    }
    
    if (d9timer == 50)
    {
        talking = true;
        dialogue = 10;
        reset_dialogue_normal();
        blockprogress = true;
    }
}

if (d10trigger)
{
    d10timer++;
    
    if (d10timer == 1)
        audio_sound_gain(mus_revolution, 1, 1000);
    
    if (d10timer == 45)
    {
        audio_stop_sound(snd_foane_laugh);
        audio_play_sound(snd_glitchbuffer, 1, true, 0.5);
        sprite_index = spr_foane_ex_laugh_glitch;
        image_index = 0;
    }
}

if (d10endtrigger)
{
    d10endtimer++;
    
    if (d10endtimer == 2)
        xoffset = 0;
    
    if (d10endtimer == 20)
    {
        talking = true;
        dialogue = 11;
        reset_dialogue_normal();
    }
}

if (d13trigger)
{
    d13timer++;
    
    if (d13timer == 0)
        image_speed = 1;
    
    if (image_index >= 3)
        image_speed = 0;
    
    if (d13timer == 30)
    {
        talking = true;
        dialogue = 16;
        reset_dialogue_normal();
        d13trigger = false;
    }
}

if (d17trigger)
{
    d17timer++;
    
    if (d17timer == 30)
    {
        sprite_index = spr_foane_ex_down;
        image_index = 2;
    }
    
    if (d17timer == 60)
    {
        talking = true;
        dialogue = 20;
        reset_dialogue_normal();
    }
}

if (d25trigger)
{
    d25timer++;
    
    if (d25timer == 30)
    {
        audio_stop_sound(snd_foane_laugh);
        audio_play_sound(snd_glitchbuffer, 1, true, 0.5);
        sprite_index = spr_foane_ex_laugh_glitch_2;
        image_index = 0;
    }
}

if (d25endtrigger)
{
    d25endtimer++;
    
    if (d25endtimer == 2)
    {
        xoffset = 0;
        yoffset = 0;
    }
    
    if (d25endtimer == 27)
    {
        talking = true;
        dialogue = 28;
        reset_dialogue_normal();
    }
}

if (d32trigger)
{
    d32timer++;
    
    if (d32timer == 90)
    {
        talking = true;
        dialogue = 35;
        reset_dialogue_normal();
    }
}

if (d35trigger)
{
    d35timer++;
    randomize();
    var randomxoffset1 = irandom_range(-7, 7);
    var randomxoffset2 = irandom_range(-7, 7);
    var randomxoffset3 = irandom_range(-7, 7);
    var randomxoffset4 = irandom_range(-7, 7);
    var randomxoffset5 = irandom_range(-7, 7);
    
    if (d35timer == 0)
    {
        audio_play_sound(snd_spearappear, 1, false);
        var a = instance_create_depth(x - 10, y - 96, depth + 1, obj_string_c3);
        var ab = instance_create_depth(x - 8, y - 96, depth + 1, obj_string_c3);
        ab.image_blend = c_gray;
        ab.image_xscale = 0.5;
        var b = instance_create_depth(x - 4, y - 96, depth + 1, obj_string_c3);
        b.image_blend = c_gray;
        b.image_xscale = 0.5;
        var c = instance_create_depth(x - 2, y - 96, depth + 3, obj_string_c3);
        c.image_blend = c_gray;
        c.image_xscale = 0.5;
        var d = instance_create_depth(x + 2, y - 96, depth + 1, obj_string_c3);
        var e = instance_create_depth(x + 4, y - 96, depth + 3, obj_string_c3);
        e.image_blend = c_gray;
        e.image_xscale = 0.5;
        var f = instance_create_depth(x + 9, y - 96, depth + 1, obj_string_c3);
    }
    
    if (d35timer == 30)
        obj_string_c3.flashtrigger = true;
    
    if (d35timer == 40)
        obj_string_c3.image_speed = 1;
    
    if (d35timer == 120)
    {
        talking = true;
        dialogue = 38;
        reset_dialogue_normal();
    }
}

if (dialogue >= 39)
{
    camera_set_view_pos(view_camera[0], campx + xoffset, campy + yoffset);
    d37during++;
    
    switch (d37during)
    {
        case 0:
            audio_play_sound(snd_car_doorslam, 1, false);
            audio_play_sound(snd_damage, 1, false);
            xoffset = 4;
            break;
        case 2:
            xoffset = -4;
            break;
        case 4:
            xoffset = 3;
            break;
        case 6:
            xoffset = -3;
            break;
        case 8:
            xoffset = 2;
            break;
        case 10:
            xoffset = -2;
            break;
        case 12:
            xoffset = 1;
            break;
        case 14:
            xoffset = 0;
            break;
    }
}

if (d37trigger)
{
    d37timer++;
    
    switch (d37timer)
    {
        case 0:
            yoffset = 10;
            break;
        case 1:
            yoffset = -10;
            break;
        case 2:
            yoffset = 9;
            break;
        case 3:
            yoffset = -9;
            break;
        case 4:
            yoffset = 8;
            break;
        case 5:
            yoffset = -8;
            break;
        case 6:
            yoffset = 7;
            break;
        case 7:
            yoffset = -7;
            break;
        case 8:
            yoffset = 6;
            break;
        case 9:
            yoffset = -6;
            break;
        case 10:
            yoffset = 5;
            break;
        case 11:
            yoffset = -5;
            break;
        case 12:
            yoffset = 4;
            break;
        case 13:
            yoffset = -4;
            break;
        case 14:
            yoffset = 3;
            break;
        case 15:
            yoffset = -3;
            break;
        case 16:
            yoffset = 2;
            break;
        case 17:
            yoffset = -2;
            break;
        case 18:
            yoffset = 1;
            break;
        case 19:
            yoffset = -1;
            break;
        case 20:
            yoffset = 0;
            break;
        case 29:
            audio_sound_gain(mus_f_noise, 0, 0);
            audio_play_sound(mus_f_noise, 1, true);
            break;
        case 30:
            audio_sound_gain(mus_f_noise, 1, 3000);
            break;
    }
    
    var position = animcurve_channel_evaluate(curvefaster, d37timer / 90);
    campy = lerp(240, 700, position);
    obj_kris_sof.y += 1 + (d37timer / 24);
    obj_susie_sof.y += 1 + (d37timer / 22);
    obj_ralsei_sof.y += 1 + (d37timer / 20);
    
    if (d37timer > 90)
    {
        draw_sprite_ext(sBlackScreen, 0, cam_x + 0, cam_y + 0, 2, 2, 0, c_white, 1);
        audio_stop_all();
    }
    
    if (d37timer == 140)
        room_goto(rm_ch3_foane);
}
