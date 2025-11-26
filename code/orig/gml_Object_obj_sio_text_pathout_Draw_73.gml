var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking)
{
    interacttimer = -2;
    subimg += 0.1;
    
    if (dialoguetop)
    {
        draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 86, 1, 1, 0, c_white, 1);
        quipyoffset = -308;
    }
    else if (dialoguebottom)
    {
        draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 394, 1, 1, 0, c_white, 1);
        quipyoffset = 0;
    }
    
    draw_set_alpha(1);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x;
    
    if (!(dialogue == 1300))
    {
        text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 174) : (camera_get_view_x(view_camera[0]) + 58);
        
        if (dialoguebottom)
            text_y = camera_get_view_y(view_camera[0]) + 338;
        else if (dialoguetop)
            text_y = camera_get_view_y(view_camera[0]) + 30;
    }
    
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    
    if (!destroy)
    {
        draw_text_color(text_x + 1, text_y + 1, displayed_text, shadow_color1, shadow_color1, shadow_color, shadow_color, 1);
        draw_set_color(c_white);
        draw_text(text_x, text_y, displayed_text);
    }
    
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    
    switch (dialogue)
    {
        case 1:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text("God, can you walk any slower, or what?", 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = sSusieWalkLeft;
            break;
        case 2:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 17;
            current_dialogue = format_text("You know, despite the danger, this adventure was pretty fun!", 25);
            typing_speed = 1;
            break;
        case 3:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text("Yeah, this was an awesome sleepover after all!", 25);
            typing_speed = 1;
            break;
        case 4:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text("... Still no sign of that \"Knight\" we keep hearing about, though.", 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = sSusieWalkDown;
            break;
        case 5:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text("The Roaring Knight... what is it they truly want?", 25);
            obj_ralsei_sio.sprite_index = sRalseiWalkRight;
            obj_susie_sio.sprite_index = sSusieWalkUp;
            typing_speed = 1;
            break;
        case 6:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text("Call me crazy, but... I don't think they're trying to end the world.", 25);
            typing_speed = 1;
            obj_ralsei_sio.sprite_index = sRalseiWalkDown;
            break;
        case 7:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 12;
            current_dialogue = format_text("If that's all they wanted, they're doing a pretty crappy job at it.", 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = spr_susie_lice;
            obj_susie_sio.image_speed = 1;
            break;
        case 8:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text("Maybe they're looking for something... a means to an end?", 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = sSusieWalkUp;
            obj_susie_sio.image_speed = 0;
            obj_susie_sio.image_index = 0;
            break;
        case 9:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 11;
            current_dialogue = format_text("I guess...", 25);
            typing_speed = 1;
            break;
        case 10:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 13;
            current_dialogue = format_text("But what would even be worth risking the Roaring over?", 25);
            typing_speed = 1;
            break;
        case 11:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text("I'm sure we'll understand... when we eventually face them.", 25);
            typing_speed = 1;
            break;
        case 12:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text("Yeah@ They're going to make another fountain, and when they do...", 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = sSusieWalkDownUpset;
            obj_susie_sio.image_speed = 0;
            obj_susie_sio.image_index = 0;
            break;
        case 13:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text("We'll kick their ass!", 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = sSusieWalkDown;
            obj_susie_sio.image_speed = 0;
            obj_susie_sio.image_index = 0;
            break;
        case 14:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text("That's the spirit!", 25);
            typing_speed = 1;
            break;
        case 15:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 18;
            current_dialogue = format_text("But... you two should really get going now.", 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = sSusieWalkUp;
            obj_susie_sio.image_speed = 0;
            obj_susie_sio.image_index = 0;
            break;
        case 16:
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text("We can worry about that later@ It's time to wake up.", 25);
            typing_speed = 1;
            break;
        case 17:
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text("Heh@ Don't need to tell me twice.", 25);
            typing_speed = 1;
            endcase1 = dialogue;
            break;
        default:
            current_dialogue = "";
            break;
    }
    
    if (destroy)
    {
        blockprogress = true;
        instance_destroy();
    }
    
    if (!text_complete && !pause_for_punctuation)
    {
        typing_timer += typing_speed;
        
        while (typing_timer >= 1)
        {
            typing_timer -= 1;
            
            if (letter_index < string_length(current_dialogue))
            {
                var next_char = string_char_at(current_dialogue, letter_index + 1);
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : "";
                
                if (next_char == " " && following_char == " ")
                {
                    displayed_text += "  ";
                    letter_index += 2;
                }
                else
                {
                    displayed_text += next_char;
                    
                    if ((next_char == "," || next_char == ":") || next_char == ".")
                    {
                        alarm[0] = 4;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char == "}" || next_char == "{" || next_char == "@")
                    {
                        alarm[0] = 10;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char != " " && next_char != "*" && next_char != "?" && displayed_text != "*" && next_char != ")" && next_char != "!")
                    {
                        if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (tennatalk)
                            audio_play_sound(snd_tenna, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.6);
                    }
                    
                    letter_index += 1;
                }
            }
            else
            {
                text_complete = true;
                break;
            }
        }
    }
    
    var endcase = [endcase1];
    
    if ((advance_pressed && !blockprogress) || skiptimer == 2)
    {
        if (text_complete)
        {
            quippercent = 0;
            
            if (array_contains(endcase, dialogue))
            {
                obj_susie_sio.speed = 4;
                obj_susie_sio.sprite_index = sSusieWalkRight;
                obj_susie_sio.image_speed = 1;
                obj_kris_sio.speed = 4;
                obj_kris_sio.sprite_index = sKrisWalkRight;
                obj_kris_sio.image_speed = 1;
                triggerout = true;
                talking = false;
            }
            else
            {
                dialogue += 1;
                reset_dialogue_normal();
            }
        }
        
        skiptimer = -1;
    }
    else if (skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_tenna);
        audio_stop_sound(snd_mike);
    }
    
    if (keyboard_check(ord("C")) && !blockprogress)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
        skiptext = false;
    
    if (skiptext)
    {
        skiptimer++;
        
        if (skiptimer == 1)
        {
            displayed_text = current_dialogue;
            text_complete = true;
        }
    }
    
    if (charactertalking)
    {
        if (dialoguetop)
            draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 93, 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 401, 1, 1, 0, c_white, 1);
    }
    
    if (text_complete && quip)
    {
        draw_set_alpha(quipalpha);
        draw_set_font(fDeterminationSans_quip);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_text(cam_x + (quipx + 47) + quipxoffset, cam_y + 418 + quipyoffset, quipstring);
        draw_sprite_ext(quipicon, quipindex, cam_x + quipx + quipxoffset, cam_y + 434 + quipyoffset, 0.5, 0.5, 0, c_white, quipalpha);
        quippercent += 0.2;
        var position1 = animcurve_channel_evaluate(quiplinear, quippercent);
        var delta_quipoffset = -50;
        quipxoffset = 50 + (delta_quipoffset * position1);
        var delta_alpha = 1;
        quipalpha = 0 + (delta_alpha * position1);
        draw_set_alpha(1);
    }
    else
    {
        quippercent = 0;
        quipxoffset = 50;
    }
}

if (triggerout)
{
    triggertimer++;
    draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, triggertimer / 60);
    
    if (triggertimer == 100)
        room_goto(rm_ch3_fountain);
}
