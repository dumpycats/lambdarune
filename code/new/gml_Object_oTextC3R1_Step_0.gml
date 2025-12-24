var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

switch (global.dialogue)
{
    case 1:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_0");
        global.typing_speed = 1;
        break;
    case 2:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_1");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 3:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_2");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 4:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_3");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 5:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_4");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 6:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_5");
        global.typing_speed = 1;
        blockprogress = true;
        oKrisPlayerC3.sprite_index = sKrisWalkLeft;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 7:
        global.susietalk = false;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_6");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 8:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_7");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 9:
        global.susietalk = true;
        oDialogueSprite.image_index = 17;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_8");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 10:
        global.susietalk = true;
        oDialogueSprite.image_index = 0;
        oSusieC3.sprite_index = sSusieTiltForward;
        oSusieC3.x = 320;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_9");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 11:
        global.susietalk = true;
        oDialogueSprite.image_index = 20;
        oSusieC3.sprite_index = sSusieTiltRight;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_10");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 12:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_11");
        global.typing_speed = 1;
        blockprogress = true;
        oKrisPlayerC3.sprite_index = sKrisWalkRight;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 13:
        global.susietalk = true;
        oDialogueSprite.image_index = 34;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_12");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 14:
        global.susietalk = true;
        oDialogueSprite.image_index = 4;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_13");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 15:
        global.susietalk = true;
        oDialogueSprite.image_index = 3;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_14");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 16:
        global.susietalk = true;
        oDialogueSprite.image_index = 26;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_15");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 17:
        global.susietalk = true;
        oDialogueSprite.image_index = 12;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_16");
        global.typing_speed = 1;
        blockprogress = false;
        knighttexttimer++;
        
        if (knighttexttimer == 1)
            instance_create_depth(cam_x2 + 320, cam_y2 + 240, -60, oKnightText);
        
        if (instance_exists(oKnightText) && skip_pressed)
        {
            oKnightText.image_index = 21;
            oKnightText.image_speed = 0;
        }
        
        break;
    case 18:
        global.susietalk = true;
        oDialogueSprite.image_index = 4;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_17");
        global.typing_speed = 1;
        blockprogress = false;
        
        if (instance_exists(oKnightText))
            instance_destroy(oKnightText);
        
        break;
    case 19:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_18");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 20:
        global.susietalk = true;
        oDialogueSprite.image_index = 1;
        global.dialoguebottom = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_19");
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 21:
        global.susietalk = true;
        oDialogueSprite.image_index = 17;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_20");
        global.typing_speed = 1;
        blockprogress = false;
        window_set_caption(lang("oTextC3R1_Step_0_21"));
        knightastexttimer++;
        
        if (knightastexttimer == 1)
            instance_create_depth(cam_x + 320, cam_y + 240, -60, oKnightAsText);
        
        if (instance_exists(oKnightAsText) && skip_pressed)
        {
            oKnightAsText.image_index = 26;
            oKnightAsText.image_speed = 0;
        }
        
        break;
    case 22:
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3R1_Step_0_22");
        global.typing_speed = 1;
        global.playermove = true;
        blockprogress = true;
        window_set_caption(lang("oTextC3R1_Step_0_23"));
        
        if (instance_exists(oKnightText))
            instance_destroy(oKnightText);
        
        if (instance_exists(oKnightAsText))
            instance_destroy(oKnightAsText);
        
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    default:
        global.current_dialogue = lang("oTextC3R1_Step_0_24");
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
            var following_char = ((global.letter_index + 2) <= string_length(global.current_dialogue)) ? string_char_at(global.current_dialogue, global.letter_index + 2) : lang("oTextC3R1_Step_0_25");
            
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
                else if (next_char == "}" || next_char == "@")
                {
                    alarm[0] = 10;
                    global.pause_for_punctuation = true;
                    global.letter_index += 1;
                    break;
                }
                else if (next_char != " " && next_char != "*" && global.displayed_text != "*")
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

if (advance_pressed && !blockprogress)
{
    if (global.text_complete)
    {
        global.dialogue += 1;
        reset_dialogue();
    }
}
else if (skiptimer == 2 && !blockprogress)
{
    global.dialogue += 1;
    reset_dialogue();
    
    if (instance_exists(oKnightText))
        instance_destroy(oKnightText);
    
    if (instance_exists(oKnightAsText))
        instance_destroy(oKnightAsText);
    
    skiptimer = 0;
}
else if (skip_pressed && !advance_pressed && !blockprogress)
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
