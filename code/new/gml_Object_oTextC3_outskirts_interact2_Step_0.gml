var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

switch (dialogue)
{
    case 1:
        global.susietalk = true;
        current_dialogue = get_lang_string("oTextC3_outskirts_interact2_Step_0_0");
        typing_speed = 1;
        oDialogueSprite.image_index = 14;
        break;
    case 2:
        global.susietalk = true;
        current_dialogue = get_lang_string("oTextC3_outskirts_interact2_Step_0_1");
        typing_speed = 1;
        oDialogueSprite.image_index = 21;
        break;
    case 3:
        global.susietalk = true;
        current_dialogue = get_lang_string("oTextC3_outskirts_interact2_Step_0_2");
        typing_speed = 1;
        oDialogueSprite.image_index = 26;
        break;
    case 4:
        global.susietalk = true;
        destroy = true;
        current_dialogue = string(dialogue_to_display4);
        typing_speed = 1;
        break;
    case 5:
        global.texttalk = true;
        current_dialogue = string(dialogue_to_display5);
        typing_speed = 1;
        break;
    case 6:
        global.texttalk = true;
        current_dialogue = string(dialogue_to_display6);
        typing_speed = 1;
        break;
    case 7:
        global.texttalk = true;
        current_dialogue = string(dialogue_to_display7);
        typing_speed = 1;
        break;
    case 8:
        global.texttalk = true;
        current_dialogue = string(dialogue_to_display8);
        typing_speed = 1;
        break;
    case 9:
        global.texttalk = true;
        current_dialogue = string(dialogue_to_display9);
        typing_speed = 1;
        break;
    case 10:
        global.texttalk = true;
        current_dialogue = string(dialogue_to_display10);
        typing_speed = 1;
        break;
    default:
        current_dialogue = "";
        break;
}

if (destroy)
{
    blockprogress = true;
    global.texttalk = false;
    global.susietalk = false;
    obj_outskirts_interactable.timer = -2;
    global.playermove = true;
    instance_destroy(oDialogueSprite);
    instance_destroy(oDialogueBox);
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
                else if (next_char == "}" || next_char == "@" || next_char == "{")
                {
                    alarm[0] = 10;
                    pause_for_punctuation = true;
                    letter_index += 1;
                    break;
                }
                else if (next_char != " " && next_char != "*" && next_char != "?" && displayed_text != "*")
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

if (!pause_for_punctuation && advance_pressed && !blockprogress)
{
    if (text_complete)
    {
        dialogue += 1;
        reset_dialogue_normal();
    }
}
else if (!pause_for_punctuation && skip_pressed && !advance_pressed && !blockprogress)
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

if (skiptimer == 2)
{
    dialogue += 1;
    reset_dialogue_normal();
    skiptimer = 0;
}
