var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

switch (global.dialogue)
{
    case 1:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_0");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 2:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_1");
        oDialogueSprite.image_index = 17;
        oSusieC3.image_speed = 3;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 3:
        global.emptytalk = true;
        global.susietalk = false;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 4:
        dialogue4timer++;
        
        if (dialogue4timer == 4)
        {
            global.emptytalk = false;
            global.susietalk = true;
        }
        
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_2");
        oDialogueSprite.image_index = 20;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 5:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_3");
        oDialogueSprite.image_index = 21;
        global.typing_speed = 1;
        blockprogress = false;
        asknighttexttimer++;
        
        if (asknighttexttimer == 3)
            instance_create_depth(cam_x + 320, cam_y + 240, -60, oAsKnightText);
        
        break;
    case 6:
        global.emptytalk = true;
        global.susietalk = false;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 7:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_4");
        oDialogueSprite.image_index = 26;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 8:
        global.susietalk = false;
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_5");
        instance_destroy(oDialogueSprite);
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 9:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_6");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 10:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_7");
        global.typing_speed = 1;
        blockprogress = false;
        oShadowmanIdle3.image_xscale = 2;
        break;
    case 11:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_8");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 12:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_9");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 13:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_10");
        global.typing_speed = 1;
        blockprogress = false;
        oShadowmanIdle3.image_xscale = -2;
        break;
    case 14:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_11");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 15:
        global.emptytalk = true;
        global.texttalk = false;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 16:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_12");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 17:
        global.texttalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_13");
        oDialogueSprite.image_index = 6;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 18:
        global.texttalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_14");
        oDialogueSprite.image_index = 6;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 19:
        instance_destroy(oDialogueSprite);
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_15");
        global.typing_speed = 1;
        oSusieC3.image_index = 4;
        blockprogress = false;
        break;
    case 20:
        global.emptytalk = true;
        global.texttalk = false;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 21:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_16");
        oDialogueSprite.image_index = 26;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 22:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_17");
        oDialogueSprite.image_index = 22;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 23:
        global.susietalk = true;
        global.ralseitalk = false;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_18");
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 20;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 24:
        global.susietalk = false;
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_19");
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 26;
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 25:
        oRalseiC3.sprite_index = sRalseiWalkLeft;
        global.ralseitalk = false;
        global.susietalk = false;
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_20");
        instance_destroy(oDialogueSprite);
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 26:
        global.ralseitalk = false;
        global.susietalk = false;
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_21");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 27:
        global.ralseitalk = false;
        global.susietalk = false;
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_22");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 28:
        global.ralseitalk = false;
        global.susietalk = false;
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("gml_Object_oTextC3R5_Step_0_23");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 29:
        global.emptytalk = true;
        global.texttalk = false;
        global.susietalk = false;
        global.ralseitalk = false;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        
        if (global.demo)
        {
            instance_create_depth(320, 240, -66, oBlackScreen1Room5);
            audio_play_sound(snd_weaponpull_fast, 1, false);
        }
        
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 300:
        global.emptytalk = true;
        global.charactertalking = true;
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
                
                if (next_char == "," || next_char == ".")
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

if (!global.pause_for_punctuation && advance_pressed && !blockprogress)
{
    if (global.text_complete)
    {
        global.dialogue += 1;
        reset_dialogue();
        
        if (instance_exists(oAsKnightText))
            instance_destroy(oAsKnightText);
    }
}
else if (skiptimer == 2)
{
    if (instance_exists(oAsKnightText))
        instance_destroy(oAsKnightText);
    
    global.dialogue += 1;
    reset_dialogue();
    skiptimer = 0;
}
else if (!global.pause_for_punctuation && skip_pressed && !advance_pressed && !blockprogress)
{
    global.displayed_text = global.current_dialogue;
    global.text_complete = true;
    
    if (instance_exists(oAsKnightText))
    {
        oAsKnightText.image_index = 64;
        oAsKnightText.image_speed = 0;
    }
    
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
