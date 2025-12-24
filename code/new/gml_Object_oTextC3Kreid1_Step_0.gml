var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

switch (global.dialogue)
{
    case 1:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_0");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 18;
        break;
    case 2:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_1");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 3:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_2");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 11;
        break;
    case 4:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_3");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 1;
        break;
    case 5:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_4");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 6:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_5");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 20;
        break;
    case 7:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_6");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 5;
        break;
    case 8:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_7");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 18;
        break;
    case 9:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_8");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 10:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_9");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 1;
        break;
    case 11:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_10");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 12:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_11");
        global.typing_speed = 1;
        break;
    case 13:
        global.kreidtalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_12");
        global.typing_speed = 1;
        
        if (!(oRalseiC3.y <= 170))
            oRalseiC3.sprite_index = sRalseiWalkUp;
        
        break;
    case 14:
        global.kreidtalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_13");
        global.typing_speed = 1;
        blockprogress = true;
        d14timer++;
        
        if (d14timer == 1)
            instance_create_depth(obj_KreidKR.x, obj_KreidKR.y, -15, obj_KreidKR2);
        
        if (d14timer == 120)
        {
            global.dialogue = 15;
            reset_dialogue();
        }
        
        break;
    case 15:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_14");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 16:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_15");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 12;
        break;
    case 17:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_16");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 26;
        blockprogress = true;
        d17timer++;
        
        if (d17timer == 80)
        {
            blockprogress = false;
            global.dialogue = 18;
            reset_dialogue();
        }
        
        break;
    case 18:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_17");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 21;
        break;
    case 19:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_18");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 2;
        blockprogress = true;
        break;
    case 20:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_19");
        global.typing_speed = 1;
        blockprogress = false;
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 0;
        break;
    case 21:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_20");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 0;
        break;
    case 22:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_21");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 23:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_22");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 5;
        break;
    case 24:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_23");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        oSusieC3.image_index = 1;
        break;
    case 25:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_24");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        oSusieC3.image_index = 0;
        oSusieC3.sprite_index = sSusieWalkUp;
        break;
    case 26:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_25");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 8;
        break;
    case 27:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_26");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 9;
        break;
    case 28:
        global.dialogue += 1;
        break;
    case 29:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_27");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 30:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_28");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 31:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_29");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 10;
        break;
    case 32:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_30");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 33:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_31");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 26;
        break;
    case 34:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_32");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 33;
        break;
    case 35:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_33");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 36:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_34");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 37:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_35");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 3;
        break;
    case 38:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_36");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 39:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_37");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 33;
        oSusieC3.sprite_index = sSusieWalkUp;
        oRalseiC3.sprite_index = sRalseiWalkUp;
        break;
    case 40:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_38");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 25;
        break;
    case 41:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_39");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 25;
        break;
    case 42:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_40");
        global.typing_speed = 1;
        blocktimer1++;
        
        if (blocktimer1 <= 31)
            blockprogress = true;
        else
            blockprogress = false;
        
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 8;
        break;
    case 43:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_41");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 3;
        
        if (instance_exists(obj_shadowmankr1) && instance_exists(obj_shadowmankr2))
        {
            xx1 = obj_shadowmankr1.x;
            yy1 = obj_shadowmankr1.y;
            xx2 = obj_shadowmankr2.x;
            yy2 = obj_shadowmankr2.y;
        }
        
        blockprogress = false;
        break;
    case 44:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_42");
        global.typing_speed = 1;
        blockprogress = true;
        
        if (instance_exists(obj_KreidKR2))
            obj_KreidKR2.sprite_index = spr_kreideyesclosed;
        
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 45:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_43");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        oDialogueBox.image_alpha = 0;
        break;
    case 46:
        global.kreidtalk = false;
        global.chairieltalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_44");
        global.typing_speed = 1;
        oDialogueSprite.image_alpha = 0;
        d46timer++;
        
        if (d46timer < 117)
            blockprogress = true;
        
        if (d46timer == 117)
        {
            blockprogress = false;
            global.dialogue = 47;
            reset_dialogue();
        }
        
        break;
    case 47:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_45");
        global.typing_speed = 1;
        blockprogress = true;
        oDialogueSprite.image_alpha = 1;
        oDialogueSprite.image_index = 4;
        oDialogueBox.image_alpha = 1;
        
        if (global.text_complete)
            global.dialogue = 48;
        
        break;
    case 48:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_46");
        global.typing_speed = 1;
        blockprogress = true;
        d48timer++;
        audio_stop_sound(mus_kreid_overworld);
        obj_KreidKR2.sprite_index = spr_kreididle_unamused;
        
        if (d48timer == 1)
            obj_chairiel.image_speed = 1;
        
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 49:
        global.kreidtalk = false;
        global.emptytalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_47");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 2;
        break;
    case 50:
        global.kreidtalk = true;
        global.emptytalk = false;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_48");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 9;
        break;
    case 51:
        global.kreidtalk = true;
        global.emptytalk = false;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_49");
        global.typing_speed = 1;
        oDialogueSprite.image_index = 1;
        break;
    case 52:
        global.kreidtalk = false;
        global.chairieltalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_50");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sChairielDialogueSprite;
        oDialogueSprite.image_index = 0;
        d52timer++;
        
        if (d52timer == 1)
            audio_play_sound(snd_smallswing, 1, false);
        
        break;
    case 53:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_51");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 54:
        global.kreidtalk = true;
        global.emptytalk = false;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_52");
        global.typing_speed = 1;
        oKrisPlayerC3.sprite_index = sKrisWalkUp;
        oSusieC3.sprite_index = sSusieWalkUp;
        oRalseiC3.sprite_index = sRalseiWalkUp;
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 4;
        break;
    case 55:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_53");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 56:
        global.kreidtalk = true;
        global.emptytalk = false;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_54");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 0;
        break;
    case 57:
        global.kreidtalk = true;
        global.emptytalk = false;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_55");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 0;
        break;
    case 58:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_56");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 59:
        global.kreidtalk = true;
        global.emptytalk = false;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_57");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 6;
        break;
    case 60:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_58");
        global.typing_speed = 1;
        blockprogress = true;
        window_set_caption(lang("oTextC3Kreid1_Step_0_59"));
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 61:
        global.kreidtalk = false;
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_60");
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 4;
        break;
    case 62:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_61");
        global.typing_speed = 1;
        blockprogress = true;
        room_goto(rChapter3KreidRoomBonus);
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 280:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_62");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    default:
        global.current_dialogue = lang("oTextC3Kreid1_Step_0_63");
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
            var following_char = ((global.letter_index + 2) <= string_length(global.current_dialogue)) ? string_char_at(global.current_dialogue, global.letter_index + 2) : lang("oTextC3Kreid1_Step_0_64");
            
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
else if (skiptimer == 2 && !blockprogress)
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
