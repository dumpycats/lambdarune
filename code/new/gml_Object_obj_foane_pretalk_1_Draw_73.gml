var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking)
{
    interacttimer = -2;
    subimg += 0.1;
    
    if (dialoguetop)
        quipyoffset = -308;
    else if (dialoguebottom)
        quipyoffset = 0;
    
    draw_set_alpha(1);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x;
    
    if (!(dialogue == 1300))
    {
        text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 174 + textxoffset) : (camera_get_view_x(view_camera[0]) + 58 + textxoffset);
        
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
            foanetalk = false;
            reverbtalk = true;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_foane_pretalk_1_Draw_73_0"), 31);
            typing_speed = 1;
            break;
        case 2:
            foanetalk = false;
            reverbtalk = true;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_foane_pretalk_1_Draw_73_1"), 31);
            typing_speed = 1;
            break;
        case 3:
            foanetalk = false;
            reverbtalk = true;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_foane_pretalk_1_Draw_73_2"), 31);
            typing_speed = 1;
            break;
        case 4:
            window_set_caption(translation_get_string("obj_foane_pretalk_1_Draw_73_3"));
            foanetalk = false;
            reverbtalk = true;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_foane_pretalk_1_Draw_73_4"), 31);
            typing_speed = 0.5;
            blockprogress = true;
            dsongtrigger = true;
            obj_SOUL_sof_prebattle.image_alpha += 1/30;
            obj_SOUL_sof_prebattle.blendvalue -= 4;
            obj_SOUL_sof_prebattle.image_alpha = clamp(obj_SOUL_sof_prebattle.image_alpha, 0, 1);
            obj_SOUL_sof_prebattle.krisalpha = clamp(obj_SOUL_sof_prebattle.krisalpha, 1/3, 1);
            obj_SOUL_sof_prebattle.blendvalue = clamp(obj_SOUL_sof_prebattle.blendvalue, 64, 192);
            break;
        case 5:
            foanetalk = false;
            reverbtalk = true;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_foane_pretalk_1_Draw_73_5"), 31);
            typing_speed = 0.5;
            break;
        case 6:
            foanetalk = false;
            reverbtalk = true;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_foane_pretalk_1_Draw_73_6"), 31);
            typing_speed = 0.5;
            break;
        case 7:
            foanetalk = true;
            reverbtalk = false;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_foane_pretalk_1_Draw_73_7"), 31);
            typing_speed = 2/3;
            blockprogress = false;
            audio_sound_pitch(snd_foane, 1);
            
            if (dsongtimer == 750)
            {
                advance_pressed = true;
                
                if (!instance_exists(obj_stringenter))
                    instance_create_depth(320, 240, 100, obj_stringenter);
            }
            
            break;
        case 8:
            foanetalk = false;
            texttalk = true;
            charactertalking = false;
            textxoffset = -26;
            current_dialogue = translation_get_string("obj_foane_pretalk_1_Draw_73_8");
            typing_speed = 1;
            break;
        case 9:
            foanetalk = false;
            texttalk = true;
            textxoffset = 150;
            charactertalking = false;
            current_dialogue = translation_get_string("obj_foane_pretalk_1_Draw_73_9");
            typing_speed = 1;
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
                        else if (reverbtalk)
                            audio_play_sound(snd_foane, 1, false);
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
    
    if (dialogue == 2)
    {
        var separator = translation_get_string("obj_foane_pretalk_1_Draw_73_10");
        var text_parts = string_split(current_dialogue, separator);
        var gradient_len = string_length(separator);
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
                var remaining = string_copy(current_displayed, 1, gradient_len);
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
    
    if (dialogue == 6)
    {
        var separator = translation_get_string("obj_foane_pretalk_1_Draw_73_11");
        var text_parts = string_split(current_dialogue, separator);
        var gradient_len = string_length(separator);
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
                var remaining = string_copy(current_displayed, 1, gradient_len);
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
    
    if (dialogue == 8)
    {
        var separator = translation_get_string("obj_foane_pretalk_1_Draw_73_12");
        var text_parts = string_split(current_dialogue, separator);
        var gradient_len = string_length(separator);
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
                var remaining = string_copy(current_displayed, 1, gradient_len);
                var color;
                
                switch (i + 1)
                {
                    default:
                        color = 8388736;
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
    
    var endcase = [7, 9];
    
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
                
                if (dialogue == 7)
                {
                    d7trigger = true;
                    
                    if (!instance_exists(obj_stringenter))
                        instance_create_depth(320, 240, 20, obj_stringenter);
                }
                
                if (dialogue == 9)
                    d9trigger = true;
                
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

if (d1trigger)
    d1timer++;

if (dsongtrigger)
{
    dsongtimer++;
    
    if (dsongtimer == 0)
        audio_play_sound(mus_strings, 1, false, 1);
    
    if (dsongtimer == 153)
    {
        dialogue = 5;
        reset_dialogue_normal();
    }
    
    if (dsongtimer == 312)
    {
        dialogue = 6;
        reset_dialogue_normal();
    }
    
    if (dsongtimer == 630)
    {
        dialogue = 7;
        reset_dialogue_normal();
    }
}

if (d7trigger)
{
    d7timer++;
    obj_SOUL_sof_prebattle.krisalpha -= 0.1;
}
