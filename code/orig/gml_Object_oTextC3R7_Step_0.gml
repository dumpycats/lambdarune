var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);

switch (global.dialogue)
{
    case 1:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...Woah, what a view...";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 0;
        break;
    case 2:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Indeed@ I've never\n  seen a Dark World like\n  this before.";
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 5;
        break;
    case 3:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Hey, what's wrong with\n  the fountain?";
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 11;
        break;
    case 4:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* It looks kinda... hard,\n  compared to the last\n  two.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 12;
        break;
    case 5:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...You're right.";
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 6;
        break;
    case 6:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* We've arrived at a very\n  unfortunate time.";
        global.typing_speed = 1;
        oRalseiC3.sprite_index = sRalseiWalkLeftUpset;
        oDialogueSprite.image_index = 4;
        break;
    case 7:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* When the darkness of\n  night covers the Light\n  World,";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 4;
        break;
    case 8:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Dark Fountains emit\n  considerably more\n  Darkness.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 6;
        break;
    case 9:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* But that's not all.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 8;
        break;
    case 10:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The usually liquid\n  Fountains get covered in\n  solid Darkness...";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 7;
        break;
    case 11:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...Rendering them nearly\n  impossible to close.";
        global.typing_speed = 1;
        audio_stop_sound(mus_wind);
        oDialogueSprite.image_index = 29;
        break;
    case 12:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Impossible to close!?";
        global.typing_speed = 1;
        oSusieC3.sprite_index = sSusieShocked;
        oSusieC3.image_xscale = -2;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 29;
        break;
    case 13:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Wouldn't the Roaring\n  just happen no matter\n  what we do now??";
        global.typing_speed = 1;
        oSusieC3.sprite_index = sSusieWalkRightUpset;
        oSusieC3.image_xscale = 2;
        oDialogueSprite.image_index = 28;
        break;
    case 14:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Impossible to close for\n  now.";
        global.typing_speed = 1;
        oRalseiC3.sprite_index = sRalseiWalkLeft;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 9;
        break;
    case 15:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* When the light of day\n  strikes the Light World,";
        global.typing_speed = 1;
        oRalseiC3.sprite_index = sRalseiWalkUp;
        oDialogueSprite.image_index = 18;
        break;
    case 16:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The solid Darkness will\n  shatter.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 10;
        break;
    case 17:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Then and only then will\n  Kris be able to seal it.";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 3;
        break;
    case 18:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...So we have to survive\n  a whole night here, huh?";
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 3;
        break;
    case 19:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Damn, this is just like\n  Five Nights At ICE-E's";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 23;
        
        if (!instance_exists(oMikeScreenC3R7))
            oSusieC3.sprite_index = sSusieWalkUp;
        
        blockprogress = true;
        
        if (global.text_complete)
            global.dialogue = 20;
        
        break;
    case 20:
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
    case 21:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* Hey hey hey ladies, gentlemen,\n  and unidentifiable creatures{\n  It's me!";
        global.typing_speed = 1;
        blockprogress = false;
        break;
    case 22:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* Everybody's favorite showman...";
        global.typing_speed = 1;
        break;
    case 23:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* Miiike!!!";
        global.typing_speed = 1;
        break;
    case 24:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* It's been quite a while, hasn't\n  it!?";
        global.typing_speed = 1;
        break;
    case 25:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* BUT NO NEED TO WORRY.";
        global.typing_speed = 1;
        break;
    case 26:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* I'm back... and I'm not going\n  anywhere!";
        global.typing_speed = 1;
        break;
    case 27:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* And tonight I'm announcing...";
        global.typing_speed = 1;
        break;
    case 28:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 29:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* A WORLD PREMIERE!";
        global.typing_speed = 1;
        break;
    case 30:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* That's right{ Our show is\n  coming back!";
        global.typing_speed = 1;
        break;
    case 31:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* And this time it'll be better\n  than ever before!";
        global.typing_speed = 1;
        break;
    case 32:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* More tears and drama!!";
        global.typing_speed = 1;
        break;
    case 33:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* More BLOODSHED and ACTION!!!";
        global.typing_speed = 1;
        break;
    case 34:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* And even... Lightners!?";
        global.typing_speed = 1;
        break;
    case 35:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* That's right{ They have\n  returned!";
        global.typing_speed = 1;
        break;
    case 36:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* Now, now... I know some of you\n  hold grudges against them.";
        global.typing_speed = 1;
        break;
    case 37:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* BUT they're a crucial part of\n  today's show!";
        global.typing_speed = 1;
        break;
    case 38:
        global.texttalk = true;
        global.charactertalking = false;
        audio_sound_gain(mus_screen_theme, 0.1, 500);
        global.current_dialogue = "* And I don't let anyone\n  interrupt my shows.";
        global.typing_speed = 1;
        break;
    case 39:
        global.emptytalk = true;
        global.charactertalking = false;
        audio_sound_gain(mus_screen_theme, 1, 500);
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 40:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* Anyway, anticipate the WORLD\n  PREMIERE... NOW!";
        global.typing_speed = 1;
        break;
    case 41:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* We're already on air, folks!";
        global.typing_speed = 1;
        break;
    case 42:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* EVERY SINGLE ONE OF YOU is a\n  part of today's program!";
        global.typing_speed = 1;
        break;
    case 43:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* So don't sit around like pipis\n  and go get 'em, tigers!";
        global.typing_speed = 1;
        break;
    case 44:
        global.texttalk = true;
        global.charactertalking = false;
        global.current_dialogue = "* Mike out!";
        global.typing_speed = 1;
        break;
    case 45:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
        instance_destroy(oDialogueBox);
        instance_destroy();
        break;
    case 46:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Oh dear.";
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 6;
        break;
    case 47:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I've got a bad feeling\n  about this World\n  Premiere...";
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 4;
        break;
    case 48:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Come on, Ralsei@";
        global.typing_speed = 1;
        oSusieC3.sprite_index = sSusieWalkRight;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 21;
        break;
    case 49:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* A game show instead of\n  a world domination\n  obsessed robot...?";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 2;
        break;
    case 50:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* SIGN ME THE HELL UP!!";
        global.typing_speed = 1;
        oDialogueSprite.image_index = 17;
        break;
    case 51:
        global.ralseitalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* What even is a \"game\n  show\"?";
        global.typing_speed = 1;
        oRalseiC3.sprite_index = sRalseiWalkLeft;
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 20;
        break;
    case 52:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Heh, you'll see.";
        global.typing_speed = 1;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 2;
        break;
    case 53:
        global.susietalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* We're on one now.";
        global.typing_speed = 1;
        audio_stop_sound(mus_wind);
        oDialogueSprite.image_index = 21;
        break;
    case 54:
        global.emptytalk = true;
        global.charactertalking = false;
        global.current_dialogue = "";
        global.typing_speed = 1;
        blockprogress = true;
        instance_destroy(oDialogueSprite);
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
