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
    var text_x, text_y;
    
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
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("When... When your friends find you...", 31);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 2:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("There'll be nothing left of you but a STAIN ON THE GROUND.", 31);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 3:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("You... YOU...", 31);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 4:
            quip = false;
            charactertalking = false;
            texttalk = true;
            kreidtalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("(Kris muttered something.)", 31);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 5:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("What'd you say?", 31);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 6:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Speak up. TALK TO ME.", 31);
            image_index = 1;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 7:
            quip = false;
            charactertalking = false;
            texttalk = true;
            kreidtalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            audio_sound_gain(mus_wind, 0, 1000);
            current_dialogue = format_text("(Kris told Kreid that they never did anything wrong.)", 31);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 8:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Oh yeah} Then what was it?", 31);
            image_index = 2;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 9:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Why did you LEAVE ME BEHIND, Kris!?", 31);
            image_index = 0;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 10:
            quip = false;
            charactertalking = false;
            texttalk = true;
            kreidtalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            audio_stop_sound(mus_wind);
            current_dialogue = format_text("(Kris realized their outward appearance would never change who they were.)", 31);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 11:
            quip = false;
            charactertalking = false;
            texttalk = true;
            kreidtalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            audio_sound_gain(mus_wind, 1, 0);
            current_dialogue = format_text("(It was a choice they had to make for themselves.)", 31);
            image_index = 1;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 12:
            quip = false;
            charactertalking = false;
            texttalk = true;
            kreidtalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("(When Kris realized that...)", 31);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 13:
            quip = false;
            charactertalking = false;
            texttalk = true;
            kreidtalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("(They didn't need Kreid to help them anymore.)", 31);
            image_index = 0;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 14:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("...", 31);
            image_index = 1;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 15:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Hah... hahahaha...", 31);
            image_index = 3;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 16:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("That's... that's so saccharine.", 31);
            image_index = 3;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 17:
            quip = false;
            charactertalking = false;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("But...", 31);
            image_index = 3;
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 18:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("You couldn't have known what would happen when you threw me away.", 25);
            dialogueicon = 16;
            typing_speed = 1;
            break;
        case 19:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("I know that.", 25);
            dialogueicon = 17;
            typing_speed = 1;
            break;
        case 20:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("But it still hurt@ It hurt a lot.", 25);
            dialogueicon = 18;
            typing_speed = 1;
            break;
        case 21:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("I was just trying to be like them@ Toriel, Asgore, Azzy...", 25);
            dialogueicon = 16;
            typing_speed = 1;
            break;
        case 22:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Just like you wanted.", 25);
            dialogueicon = 16;
            typing_speed = 1;
            break;
        case 23:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("I thought I had messed up, failed my job...", 25);
            dialogueicon = 17;
            typing_speed = 1;
            break;
        case 24:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("...", 25);
            dialogueicon = 18;
            typing_speed = 1;
            break;
        case 25:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("I think I understand now.", 25);
            dialogueicon = 16;
            typing_speed = 1;
            break;
        case 26:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("I wanted to look perfect for you, but...", 25);
            dialogueicon = 2;
            typing_speed = 1;
            break;
        case 27:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("You couldn't lean on me forever@ It wouldn't have helped us.", 25);
            dialogueicon = 4;
            typing_speed = 1;
            break;
        case 28:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Heheheh... it doesn't matter what you look like, Kris.", 25);
            dialogueicon = 13;
            typing_speed = 1;
            break;
        case 29:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("From where I stand, you're just like them now.", 25);
            dialogueicon = 12;
            typing_speed = 1;
            endcase29 = dialogue;
            break;
        case 30:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Tenna's guys will show up soon...", 25);
            dialogueicon = 8;
            typing_speed = 1;
            break;
        case 31:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("No way they'll ignore the explosion at the bottom of their tower.", 25);
            dialogueicon = 11;
            typing_speed = 1;
            break;
        case 32:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Dunno where your friends are, but I'd hurry up and find them.", 25);
            dialogueicon = 12;
            typing_speed = 1;
            
            if (sprite_index == spr_kreid_walkup)
            {
                y -= 2;
                sprite_index = spr_kreid_walkleft;
            }
            
            break;
        case 33:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("You've got a long way to the top.", 25);
            dialogueicon = 5;
            typing_speed = 1;
            break;
        case 34:
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Don't worry, my crew's done with you.", 25);
            dialogueicon = 4;
            typing_speed = 1;
            quip = true;
            quipstring = format_text_battle("(...most of them were starting to like you weirdos anyway.)", 36);
            quipicon = sKreidDialogueSprite;
            quipindex = 8;
            break;
        case 35:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("I've got a lot to think about, so... see you around?", 25);
            dialogueicon = 5;
            typing_speed = 1;
            break;
        case 36:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("...What?", 25);
            dialogueicon = 2;
            typing_speed = 1;
            break;
        case 37:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Stop giving me that look!", 25);
            dialogueicon = 8;
            typing_speed = 1;
            break;
        case 38:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("...", 25);
            dialogueicon = 19;
            typing_speed = 1;
            break;
        case 39:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            
            if (instance_exists(obj_kreid_nohitcheck))
            {
                current_dialogue = format_text("You know what} Sure.", 25);
                dialogueicon = 13;
            }
            else if (!instance_exists(obj_kreid_attackcheck))
            {
                current_dialogue = format_text("Ugh...", 25);
                dialogueicon = 19;
            }
            else
            {
                current_dialogue = format_text("Hell no@ I'm not hugging you after you beat me up like that!", 25);
                dialogueicon = 21;
            }
            
            typing_speed = 1;
            break;
        case 40:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            
            if (instance_exists(obj_kreid_nohitcheck))
            {
                current_dialogue = format_text("That's what you get.", 25);
                dialogueicon = 4;
            }
            else
            {
                current_dialogue = format_text("Get outta here.", 25);
                dialogueicon = 20;
            }
            
            typing_speed = 1;
            break;
        case 41:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("I'll distract the Luminous Guards, but it won't buy you much time.", 25);
            dialogueicon = 18;
            typing_speed = 1;
            break;
        case 42:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("You'll be fine@ You're surprisingly annoying to kill.", 25);
            dialogueicon = 12;
            typing_speed = 1;
            break;
        case 43:
            quip = false;
            charactertalking = true;
            texttalk = false;
            kreidtalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            current_dialogue = format_text("Don't make this weird.", 25);
            dialogueicon = 8;
            typing_speed = 1;
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
                        else if (kreidtalk)
                            audio_play_sound(snd_kreid, 1, false);
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
    
    var endcase;
    
    if (instance_exists(obj_kreid_attackcheck) && !instance_exists(obj_kreid_nohitcheck))
        endcase = [17, 25, 34, 35, 36, 40, 42, 43, endcase29];
    else
        endcase = [17, 25, 34, 35, 36, 39, 40, 42, 43, endcase29];
    
    if (((advance_pressed && !blockprogress) && progressallow) || (skiptimer == 2 && progressallow))
    {
        if (text_complete)
        {
            if (array_contains(endcase, dialogue))
            {
                talking = false;
                reset_dialogue_normal();
                
                if (dialogue == 17)
                    drop = true;
                
                if (dialogue == endcase29)
                    d29trigger = true;
                
                if (dialogue == 25)
                    mercy = true;
                
                if (dialogue == 34)
                    look = true;
                
                if (dialogue == 35)
                    stand = true;
                
                if (dialogue == 36)
                    stare = true;
                
                if (dialogue == 39)
                    walk = true;
                
                if (dialogue == 40)
                {
                    sprite_index = spr_kreid_walkdown;
                    y += 2;
                }
                
                if (dialogue >= 40)
                {
                    sprite_index = spr_kreid_walkdown;
                    global.playermove = true;
                }
            }
            else
            {
                dialogue += 1;
                reset_dialogue_normal();
            }
        }
    }
    else if (skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_kreid);
    }
    
    if (keyboard_check(ord("C")) && !blockprogress && progressallow)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
    {
    }
    
    if (skiptext)
    {
        skiptimer++;
        
        if (skiptimer == 1)
        {
            displayed_text = current_dialogue;
            text_complete = true;
        }
        
        if (skiptimer == 2)
            skiptext = false;
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
