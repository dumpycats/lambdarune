var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);

switch (global.dialogue)
{
    case 1:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_0");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 1;
        break;
    case 2:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_1");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 11;
        break;
    case 3:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_2");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 33;
        break;
    case 4:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_3");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 0;
        break;
    case 5:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_4");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 3;
        break;
    case 6:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_5");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 13;
        break;
    case 7:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_6");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 12;
        break;
    case 8:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 9:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_7");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.image_index = 11;
        break;
    case 10:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_8");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.image_index = 3;
        break;
    case 11:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        oKrisPlayerC3.playeronlymove = true;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 12:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_9");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.image_index = 12;
        oSusieC3.sprite_index = sSusieWalkRight;
        break;
    case 13:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_10");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.image_index = 26;
        break;
    case 14:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_11");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.image_index = 2;
        break;
    case 15:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 16:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_12");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.image_index = 7;
        break;
    case 17:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        oKrisPlayerC3.playeronlymove = true;
        d16timer++;
        
        if (d16timer == 1)
        {
            instance_destroy(oDialogueSprite);
            instance_destroy(oDialogueBox);
            instance_destroy();
        }
        
        break;
    case 18:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_13");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.image_index = 12;
        oSusieC3.sprite_index = sSusieWalkRight;
        oKrisPlayerC3.sprite_index = sKrisWalkLeft;
        d16timer = 0;
        break;
    case 19:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_14");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.image_index = 17;
        oSusieC3.sprite_index = sSusieWalkRight;
        break;
    case 20:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        oKrisPlayerC3.playeronlymove = true;
        d16timer++;
        
        if (d16timer == 1)
        {
            instance_destroy(oDialogueSprite);
            instance_destroy(oDialogueBox);
            instance_destroy();
        }
        
        break;
    case 21:
        global.current_dialogue = "";
        break;
    case 22:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_15");
        global.typing_speed = 1;
        blockprogress = false;
        oKrisPlayerC3.image_speed = 0;
        break;
    case 23:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_16");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 20;
        blockprogress = false;
        break;
    case 24:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_17");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 25;
        blockprogress = false;
        break;
    case 25:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_18");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 10;
        blockprogress = false;
        break;
    case 26:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_19");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 2;
        blockprogress = false;
        break;
    case 27:
        global.susietalk = false;
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_20");
        global.typing_speed = 1;
        instance_destroy(oDialogueSprite);
        blockprogress = false;
        break;
    case 28:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_21");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 29:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_22");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 30:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_23");
        global.typing_speed = 1;
        
        if (d30timer == 0)
            blockprogress = true;
        
        d30timer++;
        
        if (d30timer == 1)
        {
            instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
            oDialogueSprite.image_yscale = 0.8;
            oDialogueSprite.sprite_index = sSusieDialogueSprite;
            oDialogueSprite.image_index = 26;
            blockprogress = false;
        }
        
        break;
    case 31:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
    case 32:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_24");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 33:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_25");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 12;
        oSusieC3.sprite_index = sSusieWalkLeftUpset;
        global.susieout = true;
        blockprogress = false;
        break;
    case 34:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 35:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_26");
        global.typing_speed = 1;
        global.savesusie = true;
        blockprogress = false;
        break;
    case 36:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        global.playermove = true;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 37:
        global.susietalk = false;
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_27");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 38:
        global.susietalk = false;
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = get_lang_string("oTextC3R2_Step_0_28");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 39:
        global.susietalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
        global.typing_speed = 1;
        global.playermove = true;
        blockprogress = true;
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 400:
        global.susietalk = false;
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
    audio_stop_sound(snd_text);
    audio_stop_sound(snd_empty);
}

if (keyboard_check(ord("C")) && !blockprogress)
    skiptext = true;

if (keyboard_check_released(ord("C")) || blockprogress)
    skiptext = false;

if (skiptext)
    skiptimer++;
