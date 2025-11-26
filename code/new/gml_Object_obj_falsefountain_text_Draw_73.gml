var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking)
{
    interacttimer = -2;
    subimg += 0.1;
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    
    if (charactertalking)
        draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 401, 1, 1, 0, c_white, 1);
    
    var text_x, text_y;
    
    if (!(dialogue == 1300))
    {
        text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 174) : (camera_get_view_x(view_camera[0]) + 98);
        text_y = camera_get_view_y(view_camera[0]) + 79;
    }
    
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    
    if (!destroy)
    {
        draw_color_with_tracking(text_x + 1, text_y + 1, displayed_text, shadow_color1, shadow_color1, shadow_color, shadow_color, 1, 2, 0);
        draw_set_color(c_white);
        draw_text_with_tracking(text_x, text_y, displayed_text, 16777215, 2, 0);
    }
    
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    
    switch (dialogue)
    {
        case 1:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_0"), 25);
            typing_speed = 1/3;
            break;
        case 2:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_1"), 25);
            typing_speed = 1/3;
            break;
        case 3:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_2"), 25);
            typing_speed = 1/3;
            break;
        case 4:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_3"), 25);
            typing_speed = 1/3;
            break;
        case 5:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_4"), 25);
            typing_speed = 1/3;
            obj_susie_c3.sprite_index = sSusieWalkRight;
            break;
        case 6:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_5"), 25);
            typing_speed = 1/3;
            obj_susie_c3.sprite_index = sSusieWalkDown;
            break;
        case 7:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_6"), 25);
            typing_speed = 1/3;
            obj_susie_c3.sprite_index = sSusieWalkLeft;
            break;
        case 8:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_7"), 25);
            typing_speed = 1/3;
            obj_susie_c3.sprite_index = sSusieWalkUp;
            break;
        case 9:
            susietalk = true;
            current_dialogue = format_text_battle(lang("obj_falsefountain_text_Draw_73_8"), 25);
            typing_speed = 1/3;
            break;
        default:
            current_dialogue = lang("obj_falsefountain_text_Draw_73_9");
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
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : lang("obj_falsefountain_text_Draw_73_10");
                
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
                        alarm[0] = 4 * typing_speed;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char == "}" || next_char == "{" || next_char == "@")
                    {
                        alarm[0] = 10 * typing_speed;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char != " " && next_char != "*" && next_char != "?" && displayed_text != "*")
                    {
                        if (susietalk)
                            audio_play_sound(snd_susie, 1, false, 0);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
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
    
    var endcase = [8, 9];
    
    if ((advance_pressed && !blockprogress) || (skiptimer == 2 && !blockprogress))
    {
        skiptimer = 0;
        
        if (text_complete)
        {
            if (array_contains(endcase, dialogue))
            {
                talking = false;
                move = true;
                
                if (dialogue == 9)
                    interrupt = true;
            }
            else
            {
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
        audio_stop_sound(snd_empty);
    }
    
    if (keyboard_check(ord("C")) && !blockprogress)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
        skiptext = false;
    
    if (skiptext)
        skiptimer++;
}
