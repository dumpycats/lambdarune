var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (fe)
{
    global.foanetalk = false;
    global.feighlinetalk = true;
}
else if (fo)
{
    global.foanetalk = true;
    global.feighlinetalk = false;
}

switch (global.dialogue)
{
    case 1:
        fe = false;
        fo = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_0");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 2:
        fe = false;
        fo = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_1");
        global.typing_speed = 1;
        pitchtimer = 0;
        break;
    case 3:
        oDialogueBox.image_alpha = 0;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_2");
        blockprogress = true;
        d3timer++;
        
        if (d3timer == 15)
            obj_foane_spacechannel.sprite_index = spr_foane_turning;
        
        if (d3timer == 30)
            obj_foane_spacechannel.sprite_index = spr_foane_feighline_down;
        
        if (d3timer == 45)
        {
            blockprogress = false;
            advance_pressed = true;
        }
        
        break;
    case 4:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_3");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 5:
        fe = false;
        fo = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_4");
        global.typing_speed = 1;
        break;
    case 6:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_5");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 7:
        fe = true;
        fo = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_6");
        global.typing_speed = 1;
        
        if (!global.text_complete)
        {
            obj_foane_spacechannel.sprite_index = spr_foane_feighline_down;
            obj_foane_spacechannel.image_speed = 1;
        }
        else
        {
            obj_foane_spacechannel.image_speed = 0;
        }
        
        break;
    case 8:
        fe = true;
        fo = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_7");
        global.typing_speed = 1;
        
        if (!global.text_complete)
        {
            obj_foane_spacechannel.sprite_index = spr_foane_feighline_down;
            obj_foane_spacechannel.image_speed = 1;
        }
        else
        {
            obj_foane_spacechannel.image_speed = 0;
        }
        
        break;
    case 9:
        oDialogueBox.image_alpha = 0;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_8");
        blockprogress = true;
        obj_foane_spacechannel.image_speed = 0;
        break;
    case 10:
        fe = true;
        fo = false;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_9");
        global.typing_speed = 1;
        
        if (!global.text_complete)
        {
            obj_foane_spacechannel.sprite_index = spr_foane_feighline_whine;
            obj_foane_spacechannel.image_speed = 1;
        }
        else
        {
            obj_foane_spacechannel.image_speed = 0;
        }
        
        break;
    case 11:
        fe = true;
        fo = false;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_10");
        global.typing_speed = 1;
        
        if (!global.text_complete)
        {
            obj_foane_spacechannel.sprite_index = spr_foane_feighline_whine;
            obj_foane_spacechannel.image_speed = 1;
        }
        else
        {
            obj_foane_spacechannel.image_speed = 0;
        }
        
        break;
    case 12:
        fe = true;
        fo = false;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_11");
        global.typing_speed = 1;
        
        if (!global.text_complete)
        {
            obj_foane_spacechannel.sprite_index = spr_foane_feighline_whine;
            obj_foane_spacechannel.image_speed = 1;
        }
        else
        {
            obj_foane_spacechannel.image_speed = 0;
        }
        
        break;
    case 13:
        oDialogueBox.image_alpha = 0;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_12");
        blockprogress = true;
        
        if (obj_foane_spacechannel.sprite_index == spr_foane_feighline_whine)
        {
            obj_foane_spacechannel.sprite_index = spr_foane_feighline_lay;
            obj_foane_spacechannel.image_index = 0;
            obj_foane_spacechannel.image_speed = 0;
        }
        
        d13timer++;
        
        if (d13timer == 60)
            oKrisPlayerC3.image_index = 2;
        
        if (d13timer == 90)
            oKrisPlayerC3.image_index = 3;
        
        if (d13timer == 150)
            obj_foane_spacechannel.image_index = 1;
        
        if (d13timer == 190)
        {
            obj_foane_spacechannel.image_index = 2;
            obj_foane_spacechannel.feighlinesleeping = true;
        }
        
        if (d13timer == 250)
            obj_foane_spacechannel.image_index = 3;
        
        if (d13timer == 280)
        {
            blockprogress = false;
            advance_pressed = true;
        }
        
        break;
    case 14:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_13");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 15:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_14");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 16:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_15");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 17:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_16");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 18:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_17");
        global.typing_speed = 1;
        break;
    case 19:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_18");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        oKrisPlayerC3.image_index = 2;
        break;
    case 20:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_19");
        global.typing_speed = 1;
        break;
    case 21:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_20");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 22:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_21");
        global.typing_speed = 1;
        obj_foane_spacechannel.image_index = 2;
        break;
    case 23:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_22");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 24:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_23");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 25:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_24");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 26:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_25");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 27:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_26");
        global.typing_speed = 1;
        break;
    case 28:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_27");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        obj_foane_spacechannel.image_index = 3;
        break;
    case 29:
        oDialogueBox.image_alpha = 1;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_28");
        blockprogress = true;
        d29timer++;
        
        if (d29timer == 1)
            instance_create_depth(cam_x + 320, cam_y + 240, -60, obj_menu_SOUL);
        
        if (d29timerend == 0)
        {
            blockprogress = false;
            advance_pressed = true;
        }
        
        break;
    case 30:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_29");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        obj_foane_spacechannel.image_index = 2;
        
        if (global.text_complete)
        {
            global.dialogue += 1;
            reset_dialogue();
        }
        
        break;
    case 31:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_30");
        global.typing_speed = 1;
        obj_foane_spacechannel.image_index = 3;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 32:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_31");
        global.typing_speed = 1;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 33:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_32");
        global.typing_speed = 1;
        obj_foane_spacechannel.image_index = 2;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 34:
        oDialogueBox.image_alpha = 1;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_33");
        blockprogress = true;
        d34timer++;
        
        if (d34timer == 1)
            instance_create_depth(cam_x + 320, cam_y + 240, -60, obj_menu_SOUL);
        
        if (d34timerend == 0)
        {
            blockprogress = false;
            advance_pressed = true;
        }
        
        break;
    case 35:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_34");
        global.typing_speed = 1;
        obj_foane_spacechannel.image_index = 3;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 36:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_35");
        global.typing_speed = 1;
        obj_foane_spacechannel.image_index = 2;
        break;
    case 37:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_36");
        global.typing_speed = 1;
        obj_foane_spacechannel.image_index = 3;
        oKrisPlayerC3.sprite_index = sKrisWalkLeft;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 38:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_37");
        global.typing_speed = 1;
        obj_foane_spacechannel.image_index = 2;
        audio_sound_pitch(snd_foane, 1);
        break;
    case 39:
        fe = false;
        fo = true;
        oDialogueBox.image_alpha = 1;
        blockprogress = false;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_38");
        global.typing_speed = 1;
        obj_foane_spacechannel.image_index = 3;
        break;
    case 40:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_39");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy();
        break;
    case 300:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_40");
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    default:
        global.current_dialogue = lang("oTextC3_spacechannel4_Step_0_41");
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
            var following_char = ((global.letter_index + 2) <= string_length(global.current_dialogue)) ? string_char_at(global.current_dialogue, global.letter_index + 2) : lang("oTextC3_spacechannel4_Step_0_42");
            
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
    audio_stop_sound(snd_foane);
    audio_stop_sound(snd_feighline);
    audio_stop_sound(snd_text);
    audio_stop_sound(snd_empty);
}

if (keyboard_check(ord("C")) && !blockprogress)
    skiptext = true;

if (keyboard_check_released(ord("C")) || blockprogress)
{
    skiptext = false;
    skiptimer = 0;
}

if (skiptext)
    skiptimer++;
