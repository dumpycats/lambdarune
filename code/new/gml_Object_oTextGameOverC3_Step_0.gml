var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
var advance_held = keyboard_check(vk_enter) || keyboard_check(ord("Z"));
var skip_held = keyboard_check(vk_shift) || keyboard_check(ord("X"));

switch (global.dialogue)
{
    case 1:
        d1timer++;
        
        if (value == 1)
            global.ralseitalk = true;
        else if (value == 2)
            global.susietalk = true;
        
        global.charactertalking = true;
        
        if (value == 1)
            global.current_dialogue = get_lang_string("oTextGameOverC3_Step_0_0");
        else if (value == 2)
            global.current_dialogue = get_lang_string("oTextGameOverC3_Step_0_1");
        
        if (d1timer == 1)
            global.typing_speed = 0.5;
        
        break;
    case 2:
        d2timer++;
        
        if (value == 1)
            global.ralseitalk = true;
        else if (value == 2)
            global.susietalk = true;
        
        global.charactertalking = true;
        
        if (value == 1)
            global.current_dialogue = get_lang_string("oTextGameOverC3_Step_0_2");
        else if (value == 2)
            global.current_dialogue = get_lang_string("oTextGameOverC3_Step_0_3");
        
        if (d2timer == 1)
            global.typing_speed = 0.5;
        
        break;
    case 3:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_create_depth(320, 240, -11, obj_continue_giveup);
        instance_create_depth(320, 380, -10, obj_SOUL_blurry);
        instance_destroy();
        break;
    case 7:
        global.emptytalk = true;
        global.susietalk = false;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        global.playermove = true;
        instance_destroy();
        break;
    case 280:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
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
                    alarm[0] = 4 / global.typing_speed;
                    global.pause_for_punctuation = true;
                    global.letter_index += 1;
                    break;
                }
                else if (next_char == "}" || next_char == "@" || next_char == "{")
                {
                    alarm[0] = 10;
                    global.pause_for_punctuation = true;
                    global.letter_index += 1;
                    break;
                }
                else if (next_char != " " && next_char != "*" && next_char != "?" && next_char != "!" && global.displayed_text != "*")
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

if (!global.pause_for_punctuation && advance_pressed && !blockprogress)
{
    if (global.text_complete)
    {
        global.dialogue += 1;
        reset_dialogue();
    }
}
else if (skip_held && !advance_pressed && !blockprogress)
{
    global.typing_speed = 1.5;
    audio_stop_sound(snd_ralsei);
    audio_stop_sound(snd_susie);
    audio_stop_sound(snd_kreid);
    audio_stop_sound(snd_chairiel);
    audio_stop_sound(snd_text);
    audio_stop_sound(snd_empty);
}

if (skip_held)
{
    audio_stop_sound(snd_ralsei);
    audio_stop_sound(snd_susie);
    audio_stop_sound(snd_kreid);
    audio_stop_sound(snd_chairiel);
    audio_stop_sound(snd_text);
    audio_stop_sound(snd_empty);
}
