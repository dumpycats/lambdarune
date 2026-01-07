var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

switch (global.dialogue)
{
    case 1:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_0");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 9;
        break;
    case 2:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_1");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 22;
        break;
    case 3:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_2");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 3;
        break;
    case 4:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_3");
        global.typing_speed = 1;
        oRalseiC3.sprite_index = sRalseiWalkLeft;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 20;
        break;
    case 5:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_4");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 20;
        break;
    case 6:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_5");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 20;
        break;
    case 7:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_6");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 1;
        break;
    case 8:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_7");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 27;
        oRalseiC3.sprite_index = sRalseiWalkDownUpset;
        oRalseiC3.image_index = 0;
        break;
    case 9:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_8");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        oRalseiC3.sprite_index = sRalseiWalkLeft;
        oRalseiC3.image_index = 0;
        break;
    case 10:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_9");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 0;
        break;
    case 11:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_10");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 33;
        break;
    case 12:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_11");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 6;
        break;
    case 13:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_12");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 24;
        oRalseiC3.sprite_index = sRalseiExpressions_rm6;
        oRalseiC3.image_index = 0;
        break;
    case 14:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_13");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 24;
        break;
    case 15:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_14");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 0;
        oRalseiC3.sprite_index = sRalseiWalkLeft;
        oRalseiC3.image_index = 0;
        break;
    case 16:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_15");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 1;
        oRalseiC3.sprite_index = sRalseiWalkLeftUpset;
        oRalseiC3.image_index = 0;
        break;
    case 17:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_16");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 6;
        oRalseiC3.sprite_index = sRalseiWalkDownUpset;
        oRalseiC3.image_index = 0;
        break;
    case 18:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_17");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 13;
        break;
    case 19:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_18");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 21;
        break;
    case 20:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_19");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 2;
        oRalseiC3.sprite_index = sRalseiWalkLeft;
        oRalseiC3.image_index = 0;
        break;
    case 21:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_20");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 21;
        break;
    case 22:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_21");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 2;
        break;
    case 23:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_22");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 13;
        oRalseiC3.sprite_index = sRalseiExpressions_rm6;
        oRalseiC3.image_index = 0;
        break;
    case 24:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_23");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 26;
        break;
    case 25:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_24");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 20;
        break;
    case 26:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_25");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 24;
        break;
    case 27:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_26");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 25;
        oRalseiC3.sprite_index = sRalseiExpressions_rm6;
        oRalseiC3.image_index = 1;
        break;
    case 28:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_27");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 2;
        break;
    case 29:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_28");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 19;
        oRalseiC3.image_index = 2;
        break;
    case 30:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_29");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 19;
        break;
    case 31:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_30");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 2;
        break;
    case 32:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_31");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 33;
        break;
    case 33:
        global.ralseitalk = false;
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 34:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_32");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 10;
        break;
    case 35:
        global.ralseitalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("oTextC3R6_Step_0_33");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 3;
        break;
    case 36:
        global.ralseitalk = false;
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 280:
        global.ralseitalk = false;
        global.susietalk = false;
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
                    else if (global.kreidtalk)
                        audio_play_sound(snd_kreid, 1, false);
                    else if (global.chairieltalk)
                        audio_play_sound(snd_chairiel, 1, false);
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
    audio_stop_sound(snd_kreid);
    audio_stop_sound(snd_text);
    audio_stop_sound(snd_empty);
}

if (keyboard_check(ord("C")) && !blockprogress)
    skiptext = true;

if (keyboard_check_released(ord("C")) || blockprogress)
    skiptext = false;

if (skiptext)
    skiptimer++;
