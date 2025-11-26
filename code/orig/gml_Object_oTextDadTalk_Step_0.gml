switch (global.daddialogue)
{
    case 1:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Oh... my little Susie@\n  Why are you crying?";
        global.typing_speed = 0.5;
        break;
    case 2:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...They're back at it again@\n  I see.";
        global.typing_speed = 0.5;
        break;
    case 3:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...Susie, listen carefully\n  now.";
        global.typing_speed = 0.5;
        break;
    case 4:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Being different from others\n  doesn't make you worse than\n  the rest, you know?";
        global.typing_speed = 0.5;
        break;
    case 5:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* You're not a curse, you're\n  a gift.";
        global.typing_speed = 0.5;
        break;
    case 6:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Don't forget, true\n  strength   LIES IN DISCOVERY THROUGH EXPERIENCE INSTEAD OF DATAMINING";
        global.typing_speed = 0.25;
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
                else if (next_char == "?" || next_char == "@")
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

var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (!global.pause_for_punctuation && !(global.daddialogue == 6) && advance_pressed)
{
    if (global.text_complete)
    {
        global.daddialogue += 1;
        reset_dialogue();
    }
}
else if (global.daddialogue < 6 && skip_pressed && !advance_pressed)
{
    global.displayed_text = global.current_dialogue;
    global.text_complete = true;
    audio_stop_sound(snd_ralsei);
    audio_stop_sound(snd_susie);
    audio_stop_sound(snd_text);
}
