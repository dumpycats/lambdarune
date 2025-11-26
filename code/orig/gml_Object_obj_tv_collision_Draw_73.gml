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
            current_dialogue = format_text("Flight to Cathode Tower@ Departing...", 31);
            typing_speed = 1;
            break;
        case 2:
            current_dialogue = format_text("NOW{ What are you doing reading this} Go! Go! Go!!", 31);
            typing_speed = 1;
            break;
        case 3:
            texttalk = true;
            current_dialogue = format_text("...You don't} Aw, shoot.", 31);
            typing_speed = 1;
            break;
        case 4:
            texttalk = true;
            current_dialogue = format_text("Maybe a nice, long book would work...} Lemme check if I packed one...", 31);
            typing_speed = 1;
            break;
        case 5:
            texttalk = true;
            current_dialogue = format_text("Will I escape the airport?!?!? Will my car escape the airport?!?!?!", 31);
            typing_speed = 1;
            break;
        case 6:
            texttalk = true;
            current_dialogue = format_text("Tune in next time for answers to these questions and more!!!", 31);
            typing_speed = 1;
            break;
        case 7:
            texttalk = true;
            current_dialogue = "";
            typing_speed = 1;
            break;
        case 8:
            texttalk = true;
            current_dialogue = "";
            typing_speed = 1;
            break;
        case 9:
            texttalk = true;
            current_dialogue = "";
            typing_speed = 1;
            break;
        case 10:
            texttalk = true;
            current_dialogue = "";
            typing_speed = 1;
            break;
        default:
            current_dialogue = "";
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
                    else if (next_char != " " && next_char != "*" && next_char != "?" && next_char != ")" && displayed_text != "*")
                    {
                        if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
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
    
    if (advance_pressed && !blockprogress)
    {
        if (text_complete)
        {
            if (dialogue == 2)
            {
                global.playermove = true;
                talking = false;
            }
            else
            {
                dialogue++;
                reset_dialogue_normal();
            }
        }
    }
    else if (skiptimer == 2)
    {
        if (dialogue == 2)
        {
            global.playermove = true;
            talking = false;
            reset_dialogue_normal();
        }
        else
        {
            dialogue++;
            reset_dialogue_normal();
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
        skiptext = false;
    
    if (skiptext)
        skiptimer++;
}
