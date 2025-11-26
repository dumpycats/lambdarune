var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

switch (global.dialogue)
{
    case 1:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...You want to know what\n  I think about your...\n  friend?";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 2;
        break;
    case 2:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* That is a weird\n  request... but alright.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 5;
        break;
    case 3:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 4:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* What can I even say that\n  hasn't been said before?";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 5;
        break;
    case 5:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The brilliance of Loomi\n  Neus can still be felt\n  to this day.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 11;
        break;
    case 6:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Even after her...\n  tragedy.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 7:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Her hopes and dreams\n  outshone the world\n  itself.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 12;
        break;
    case 8:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Heh... you can even say\n  that she still shines\n  through you and me.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 13;
        break;
    case 9:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Wouldn't you agree...\n  Mike?";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 8;
        break;
    case 10:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* It is her power that\n  we're both borrowing,\n  after all.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 3;
        break;
    case 11:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 12:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Do you remember that\n  kind flower lady?";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 12;
        break;
    case 13:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The thing I found back\n  then... what she used\n  to make my mantle.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 5;
        break;
    case 14:
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* She called it the\n  fragment of a Shadow\n  Crystal.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        d14timer++;
        
        if (d14timer == 1)
            instance_create_depth(320, 240, -61, obj_shadowcrystaltext1);
        
        if (skip_pressed)
            obj_shadowcrystaltext1.image_index = 48;
        
        if (advance_pressed && global.text_complete)
            instance_destroy(obj_shadowcrystaltext1);
        
        break;
    case 15:
        audio_stop_sound(mus_THE_GREATEST_COMEDY);
        global.kreidtalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Your sister wouldn't\n  happen to know anything\n  about that... would she?";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 14;
        d15timer++;
        
        if (d15timer == 1)
            instance_create_depth(320, 240, -61, obj_sistertext1);
        
        if (skip_pressed)
            obj_sistertext1.image_index = 12;
        
        if (advance_pressed && global.text_complete)
            instance_destroy(obj_sistertext1);
        
        if (instance_exists(obj_shadowcrystaltext1))
            instance_destroy(obj_shadowcrystaltext1);
        
        break;
    case 16:
        oDialogueBox.image_alpha = 0;
        oDialogueSprite.image_alpha = 0;
        global.current_dialogue = "";
        blockprogress = true;
        
        if (instance_exists(obj_sistertext1))
            instance_destroy(obj_sistertext1);
        
        d16timer++;
        
        if (d16timer == 10)
        {
            oPersistent.androidsavetimer = -1;
            
            if (!global.c3kreidcompleted)
            {
                instance_create_depth(0, 0, -59, obj_memorandum_notice_c3);
                obj_memorandum_notice_c3.image_index = 1;
                global.c3kreidcompleted = true;
            }
            
            room_goto(rLambdaruneLogoToC3);
        }
        
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
