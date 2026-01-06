var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

switch (global.dialogue)
{
    case 1:
        global.foanetalk = false;
        global.feighlinetalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3_spacechannel2_Step_0_0");
        global.typing_speed = 1;
        pitchtimer++;
        
        if (pitchtimer == 1)
            audio_sound_pitch(snd_foane, 1);
        
        break;
    case 2:
        global.foanetalk = true;
        global.feighlinetalk = false;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3_spacechannel2_Step_0_1");
        global.typing_speed = 1;
        pitchtimer = 0;
        break;
    case 3:
        global.foanetalk = false;
        global.feighlinetalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3_spacechannel2_Step_0_2");
        global.typing_speed = 1;
        pitchtimer++;
        
        if (pitchtimer == 1)
            audio_sound_pitch(snd_foane, 1);
        
        break;
    case 4:
        global.foanetalk = true;
        global.feighlinetalk = false;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3_spacechannel2_Step_0_3");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 5:
        global.foanetalk = true;
        global.feighlinetalk = false;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3_spacechannel2_Step_0_4");
        global.typing_speed = 1;
        break;
    case 6:
        global.foanetalk = true;
        global.feighlinetalk = false;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3_spacechannel2_Step_0_5");
        global.typing_speed = 1;
        break;
    case 7:
        global.emptytalk = true;
        global.foanetalk = false;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        global.playermove = true;
        blockprogress = true;
        instance_create_depth(320, 240, -50, obj_spacechannel_textcheck);
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
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
                    alarm[0] = 4;
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
                else if (next_char != " " && next_char != "*" && next_char != "?" && global.displayed_text != "*")
                {
                    if (global.susietalk)
                        audio_play_sound(snd_susie, 1, false);
                    else if (global.ralseitalk)
                        audio_play_sound(snd_ralsei, 1, false);
                    else if (global.texttalk)
                        audio_play_sound(snd_text, 1, false);
                    else if (global.foanetalk)
                        audio_play_sound(snd_foane, 1, false);
                    else if (global.feighlinetalk)
                        audio_play_sound(snd_feighline, 1, false);
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
        pitchtimer = 0;
        global.dialogue += 1;
        reset_dialogue();
    }
}
else if (skiptimer == 2)
{
    global.dialogue += 1;
    reset_dialogue();
    skiptimer = 0;
}
else if (!global.pause_for_punctuation && skip_pressed && !advance_pressed && !blockprogress)
{
    global.displayed_text = global.current_dialogue;
    global.text_complete = true;
    audio_stop_sound(snd_ralsei);
    audio_stop_sound(snd_susie);
    audio_stop_sound(snd_foane);
    audio_stop_sound(snd_feighline);
    audio_stop_sound(snd_text);
    audio_stop_sound(snd_empty);
}

if (keyboard_check(ord("C")) && !blockprogress)
    skiptext = true;

if (keyboard_check_released(ord("C")) || blockprogress)
    skiptext = false;

if (skiptext)
    skiptimer++;
