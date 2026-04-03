var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking && !obj_primflowershop.selectedbuy)
{
    interacttimer = -2;
    subimg += 0.1;
    draw_set_alpha(1);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x, text_y;
    
    if (!dialogueinbox)
    {
        text_x = camera_get_view_x(view_camera[0]) + 30;
        text_y = camera_get_view_y(view_camera[0]) + 270;
    }
    else
    {
        text_x = camera_get_view_x(view_camera[0]) + 438;
        text_y = camera_get_view_y(view_camera[0]) + 260;
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
            primtalk = true;
            current_dialogue = translation_get_string("obj_primflower_Draw_73_0");
            typing_speed = 1;
            progressallow = false;
            break;
        case 2:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_1"), 21);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 3:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_2"), 31);
            typing_speed = 1;
            break;
        case 4:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_3"), 31);
            typing_speed = 1;
            break;
        case 5:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_4"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 6:
            primtalk = true;
            current_dialogue = format_text_battle(translation_get_string("obj_primflower_Draw_73_5"), 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 7:
            primtalk = true;
            current_dialogue = translation_get_string("obj_primflower_Draw_73_6");
            typing_speed = 1;
            break;
        case 8:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_7"), 31);
            typing_speed = 1;
            break;
        case 9:
            primtalk = true;
            current_dialogue = translation_get_string("obj_primflower_Draw_73_8");
            typing_speed = 1;
            break;
        case 10:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_9"), 31);
            typing_speed = 1;
            break;
        case 11:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_10"), 31);
            typing_speed = 1;
            break;
        case 12:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_11"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 13:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_12"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 14:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_13"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            
            with (obj_primflowershop)
                yourselftalked = true;
            
            break;
        case 15:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_14"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 16:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_15"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 17:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_16"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 18:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_17"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 19:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_18"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 20:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_19"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            audio_sound_gain(mus_primflower, 0, 0);
            break;
        case 21:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_20"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 22:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_21"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 23:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_22"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 24:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_23"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 25:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_24"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 26:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_25"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 27:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_26"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 28:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_27"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 29:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_28"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 30:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_29"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 31:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_30"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 32:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_31"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 33:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_32"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 34:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_33"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 35:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_34"), 40);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 36:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_35"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 37:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_36"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 38:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_37"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 39:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_38"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 40:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_39"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 41:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_40"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 42:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_41"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 43:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_42"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 44:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_43"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 45:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_44"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 46:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_45"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 47:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_46"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 48:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_47"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 49:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_48"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 50:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_49"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 51:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_50"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            
            with (obj_primflowershop)
                freedomtalked = true;
            
            break;
        case 52:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_51"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 53:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_52"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 54:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_53"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 55:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_54"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            
            if ((!pause_for_punctuation && advance_pressed && !blockprogress && text_complete) || (keyboard_check(ord("C")) && !blockprogress))
            {
            }
            
            break;
        case 56:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_55"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 57:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_56"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 58:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_57"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 59:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_58"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 60:
            texttalk = true;
            primtalk = false;
            current_dialogue = translation_get_string("obj_primflower_Draw_73_59");
            global.finished = true;
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            d45timer++;
            
            if (d45timer == 0)
                audio_play_sound(snd_item, 1, false);
            
            break;
        case 61:
            texttalk = false;
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_60"), 31);
            avatar.sprite_index = spr_primflower;
            typing_speed = 1;
            global.finished = true;
            break;
        case 62:
            primtalk = true;
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_61"), 31);
            avatar.sprite_index = spr_primflower_laugh;
            typing_speed = 1;
            mantlereceived = true;
            global.finished = true;
            break;
        case 63:
            primtalk = true;
            current_dialogue = format_text_battle(translation_get_string("obj_primflower_Draw_73_62"), 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 64:
            primtalk = true;
            audio_stop_sound(mus_primflower);
            current_dialogue = format_text(translation_get_string("obj_primflower_Draw_73_63"), 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            
            if (text_complete && advance_pressed)
            {
                talking = false;
                reset_dialogue_normal();
                instance_create_depth(x, y, depth - 500, obj_primflowershop_fadeout);
            }
            
            break;
        case 65:
            primtalk = false;
            ralseitalk = true;
            current_dialogue = "";
            displayed_text = "";
            typing_speed = 1;
            break;
        case 80:
            primtalk = true;
            current_dialogue = format_text_battle(translation_get_string("obj_primflower_Draw_73_64"), 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 81:
            primtalk = true;
            current_dialogue = format_text_battle(translation_get_string("obj_primflower_Draw_73_65"), 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 82:
            primtalk = true;
            current_dialogue = format_text_battle(translation_get_string("obj_primflower_Draw_73_66"), 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 83:
            primtalk = true;
            current_dialogue = format_text_battle(translation_get_string("obj_primflower_Draw_73_67"), 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 84:
            primtalk = true;
            current_dialogue = format_text_battle(translation_get_string("obj_primflower_Draw_73_68"), 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
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
                    
                    if ((next_char == "," || next_char == ":") || next_char == "." || next_char == "?")
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
                            audio_play_sound(snd_empty, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (primtalk)
                            audio_play_sound(snd_primflower_sfx, 1, false, 0.5, false, 0.98);
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
    
    var endcase = [5];
    var talkendcase;
    
    if (!global.finished)
        talkendcase = [14, 16, 20, 31, 38, 51, 62];
    else
        talkendcase = [14, 16, 20, 31, 38, 51, 54, 62];
    
    var textx = camera_get_view_x(view_camera[0]) + 30;
    var texty = camera_get_view_y(view_camera[0]) + 270;
    
    if (dialogue == 60)
    {
        var text_parts = string_split(current_dialogue, translation_get_string("obj_primflower_Draw_73_69"));
        var x_offset = textx;
        var y_offset = texty;
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
                var remaining = string_copy(current_displayed, 1, 13);
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
                    x_offset = textx;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (dialogue == 29)
    {
        var separator = translation_get_string("obj_primflower_Draw_73_70");
        var text_parts = string_split(current_dialogue, separator);
        var color_len = string_length(separator);
        var x_offset = textx;
        var y_offset = texty;
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
                var remaining = string_copy(current_displayed, 1, color_len);
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
                    x_offset = textx;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (((advance_pressed && !blockprogress) && progressallow) || (skiptimer == 2 && progressallow))
    {
        if (text_complete)
        {
            if (array_contains(endcase, dialogue))
            {
                progressallow = false;
                sprite_index = spr_primflower;
                reset_dialogue_normal();
                dialogue = 2;
                dialogueinbox = false;
                
                with (obj_primflowershop)
                {
                    mainmenu = true;
                    image_index = 0;
                    showmoney = true;
                }
            }
            else if (array_contains(talkendcase, dialogue))
            {
                obj_primflowershop.talkedonce = true;
                texttalk = false;
                primtalk = true;
                progressallow = false;
                sprite_index = spr_primflower;
                reset_dialogue_normal();
                dialogueinbox = true;
                dialogue = 6;
                audio_sound_gain(mus_primflower, 1, 0);
                
                with (obj_primflowershop)
                {
                    talkmenu = true;
                    image_index = 0;
                    showmoney = true;
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
    
    if (keyboard_check(ord("C")) && !blockprogress && progressallow)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
    {
    }
    
    if (skiptext)
    {
        skiptimer++;
        
        if (skiptimer == 1)
        {
            displayed_text = current_dialogue;
            text_complete = true;
        }
        
        if (skiptimer == 3)
        {
            skiptext = false;
            skiptimer = 0;
        }
    }
}
