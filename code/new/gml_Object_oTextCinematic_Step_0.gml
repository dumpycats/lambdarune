switch (global.cinematicdialogue)
{
    case 1:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextCinematic_Step_0_0");
        global.typing_speed = 0.5;
        break;
    case 2:
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextCinematic_Step_0_1");
        global.typing_speed = 0.5;
        global.shoptalkmenu = false;
        break;
    case 3:
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextCinematic_Step_0_2");
        global.typing_speed = 1;
        global.shoptalkmenu = false;
        break;
    case 4:
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        global.shoptalkmenu = false;
        break;
    case 5:
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextCinematic_Step_0_3");
        global.typing_speed = 0.5;
        global.shoptalkmenu = false;
        break;
    case 6:
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextCinematic_Step_0_4");
        global.typing_speed = 0.5;
        global.shoptalkmenu = false;
        break;
    case 7:
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextCinematic_Step_0_5");
        global.typing_speed = 0.5;
        global.shoptalkmenu = false;
        break;
    case 8:
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 0.5;
        global.shoptalkmenu = false;
        break;
    case 9:
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextCinematic_Step_0_6");
        global.typing_speed = 0.5;
        global.shoptalkmenu = false;
        break;
    case 10:
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextCinematic_Step_0_7");
        global.typing_speed = 0.5;
        global.shoptalkmenu = false;
        break;
    default:
        global.current_dialogue = "";
        break;
}

if (!global.text_complete && !global.pause_for_punctuation)
{
    global.typing_timer += global.typing_speed;
    
    while (global.typing_timer >= 1)
    {
        global.typing_timer -= 1;
        
        if (global.letter_index < string_length(global.current_dialogue))
        {
            var next_char = string_char_at(global.current_dialogue, global.letter_index + 1);
            var following_char = ((global.letter_index + 2) <= string_length(global.current_dialogue)) ? string_char_at(global.current_dialogue, global.letter_index + 2) : "";
            
            if (next_char == " " && following_char == " ")
            {
                global.displayed_text += "  ";
                global.letter_index += 2;
            }
            else
            {
                global.displayed_text += next_char;
                
                if ((next_char == "," || next_char == ":") || next_char == ".")
                {
                    alarm[0] = 4;
                    global.pause_for_punctuation = true;
                    global.letter_index += 1;
                    break;
                }
                else if (next_char == "?")
                {
                    alarm[0] = 10;
                    global.pause_for_punctuation = true;
                    global.letter_index += 1;
                    break;
                }
                else if (next_char != " " || next_char != "*")
                {
                    if (global.susietalk)
                        audio_play_sound(snd_susie, 1, false);
                    else if (global.ralseitalk)
                        audio_play_sound(snd_ralsei, 1, false);
                    else if (global.texttalk)
                        audio_play_sound(snd_text, 1, false);
                    else if (global.emptytalk)
                        audio_play_sound(snd_empty, 1, false);
                }
                
                global.letter_index += 1;
            }
        }
        else
        {
            global.text_complete = true;
            break;
        }
    }
}
