var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (global.enemyturn)
{
    soulsubimg++;
    soulsubimgback = -1;
    
    if (soulsubimg <= 6)
        draw_sprite_ext(spr_SOUL_jumpout, soulsubimg, PARTYMEMBER1.x - 12, PARTYMEMBER1.y + 12, 1, 1, 0, c_white, 1);
    
    if (soulsubimg == 0)
    {
        instance_create_depth(cam_x + 320, cam_y + 170, PARTYMEMBER1.depth - 3, obj_bulletboard_sio);
        instance_create_depth(PARTYMEMBER1.x - 12, PARTYMEMBER1.y + 12, PARTYMEMBER1.depth - 4, SOUL);
    }
}
else
{
    soulsubimgback++;
    
    if (global.turn > 1 && soulsubimgback <= 6)
        draw_sprite_ext(spr_SOUL_jumpout, soulsubimgback, PARTYMEMBER1.x - 12, PARTYMEMBER1.y + 12, 1, 1, 0, c_white, 1);
}

if (textmenu)
{
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    
    if (charactertalking)
    {
    }
    
    var text_x, text_y;
    
    if (!(menudialogue == 1300))
    {
        text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 134) : (camera_get_view_x(view_camera[0]) + 30);
        
        if (dialoguebottom)
            text_y = camera_get_view_y(view_camera[0]) + 376;
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
    
    switch (menudialogue)
    {
        case 1:
            randomize();
            texttalk = true;
            dialogueicon = 1;
            
            if (jammed)
            {
                if (susiepissturn == 1 && !susiedown)
                {
                    susietalk = true;
                    charactertalking = true;
                    current_dialogue = format_text("That bullet messed up my spell{ GOD DAMMIT{ Kris, try again next time!!", 25);
                    draw_sprite_ext(sSusieDialogueSprite, 5, camera_get_view_x(view_camera[0]) + 72, camera_get_view_y(view_camera[0]) + 421, 1, 1, 0, c_white, 1);
                }
                else if (jamwait == 1 && jammed && !susiejaminterrupt && !susiedown && jamphase >= 1)
                {
                    susietalk = true;
                    charactertalking = true;
                    current_dialogue = format_text("Maybe if I used RUDE BUSTER on them...", 25);
                    draw_sprite_ext(sSusieDialogueSprite, 3, camera_get_view_x(view_camera[0]) + 72, camera_get_view_y(view_camera[0]) + 421, 1, 1, 0, c_white, 1);
                }
                else if (global.enemyhp > (global.enemymaxhp - 750))
                {
                    susietalk = false;
                    
                    if (global.nohit)
                        current_dialogue = format_text("Tenna jams your signal to the max!", 31);
                    else
                        current_dialogue = format_text("Tenna jams your signal!", 31);
                }
                else
                {
                    susietalk = false;
                    
                    if (global.nohit)
                        current_dialogue = format_text("Tenna jams your signal to the max{ MAXIMIKE's defense rose greatly!", 31);
                    else
                        current_dialogue = format_text("Tenna jams your signal{ MAXIMIKE's defense rose greatly!", 36);
                }
            }
            else if (susiepissturn == 1 && !susiedown)
            {
                susietalk = true;
                charactertalking = true;
                current_dialogue = format_text("That bullet messed up my spell{ GOD DAMMIT{ Kris, try again next time!!", 25);
                draw_sprite_ext(sSusieDialogueSprite, 5, camera_get_view_x(view_camera[0]) + 72, camera_get_view_y(view_camera[0]) + 421, 1, 1, 0, c_white, 1);
            }
            else if (global.turn == 1)
            {
                current_dialogue = format_text("Maximike takes the stage!", 31);
            }
            else
            {
                susietalk = false;
                charactertalking = false;
                
                switch (randompick)
                {
                    case 1:
                        current_dialogue = format_text("Blinding lights illuminate the battlefield.", 31);
                        break;
                    case 2:
                        current_dialogue = format_text("The skyline echoes with canned laughter.", 31);
                        break;
                    case 3:
                        current_dialogue = format_text("The fountain flows freely.", 31);
                        break;
                    case 4:
                        current_dialogue = format_text("Maximike strikes a menacing pose.", 31);
                        break;
                    case 5:
                        current_dialogue = format_text("Smells like plasma.", 31);
                        break;
                    case 6:
                        current_dialogue = format_text("A ringtone echoes from the distance.", 31);
                        break;
                    case 7:
                        current_dialogue = format_text("Blinding lights illuminate the battlefield.", 31);
                        break;
                    case 8:
                        current_dialogue = format_text("The skyline echoes with canned laughter.", 31);
                        break;
                    case 9:
                        current_dialogue = format_text("The fountain flows freely.", 31);
                        break;
                    case 10:
                        current_dialogue = format_text("Maximike strikes a menacing pose.", 31);
                        break;
                    case 11:
                        current_dialogue = format_text("Smells like plasma.", 31);
                        break;
                    default:
                        current_dialogue = "";
                        break;
                }
            }
            
            typing_speed = 1;
            break;
        default:
            current_dialogue = "";
            break;
    }
    
    if (destroy)
        blockprogress = true;
    
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
                    else if (next_char != " " && next_char != "*" && next_char != "?" && displayed_text != "*")
                    {
                        if (tennatalk)
                            audio_play_sound(snd_tenna, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.6);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (emptytalk)
                            audio_play_sound(snd_empty, 1, false);
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
    
    if (!pause_for_punctuation && advance_pressed && !blockprogress)
    {
        if (text_complete)
        {
            if (menudialogue == 100)
            {
                textmenu = false;
            }
            else
            {
            }
        }
    }
    else if (!pause_for_punctuation && skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
}

if (textenemy)
{
    draw_set_font(fFight);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    charactertalking = false;
    
    switch (enemydialogue)
    {
        case 1:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("It's unfortunate things had to end this way, but we'll persevere.", 17);
            typing_speed = 1;
            break;
        case 2:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("We've rebooted the show before, we can do it again.", 17);
            typing_speed = 1;
            break;
        case 3:
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle("(bzzt) Hey hey hey ladies, gentlemen, and unidentifiable creatures! (bzzt)", 17);
            typing_speed = 1;
            break;
        case 4:
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle("(bzzt) Your host's craving VIOLENCE. (bzzt)", 17);
            typing_speed = 1;
            break;
        case 5:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("Luckily, this isn't the end for Lightners on this program.", 17);
            typing_speed = 1;
            break;
        case 6:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("We still have two more to work with.", 17);
            typing_speed = 1;
            break;
        case 7:
            tennatalk = false;
            susietalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = -10;
            
            if (!susiedown)
                current_dialogue = format_text_battle("There's no way in hell they'd listen to you!", 17);
            else
                current_dialogue = format_text_battle("There's... (cough) no way in hell they'd listen to you!", 17);
            
            typing_speed = 1;
            break;
        case 8:
            tennatalk = true;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("Toriel, maybe... but the ghost} Impressionable, easy to manipulate...", 17);
            typing_speed = 1;
            break;
        case 9:
            tennatalk = true;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("All the hallmarks of a good TV star!", 17);
            typing_speed = 1;
            break;
        case 10:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 11:
            tennatalk = false;
            ralseitalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = 44;
            
            if (!ralseidown)
                current_dialogue = format_text_battle("Do you think Mike will just allow this?", 17);
            else
                current_dialogue = format_text_battle("(...)", 17);
            
            typing_speed = 1;
            break;
        case 12:
            tennatalk = true;
            ralseitalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("My brother's sentimental, but he'll understand eventually.", 17);
            typing_speed = 1;
            break;
        case 13:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 14:
            tennatalk = false;
            ralseitalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = 44;
            
            if (!ralseidown)
                current_dialogue = format_text_battle("Understand what} Keeping Lightners trapped here forever?!", 17);
            else
                current_dialogue = format_text_battle("(...)", 17);
            
            typing_speed = 1;
            break;
        case 15:
            tennatalk = true;
            ralseitalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            
            if (!ralseidown)
                current_dialogue = format_text_battle("Uh... yes?", 17);
            else
                current_dialogue = format_text_battle("Before you ask... yes. We will keep Lightners trapped here.", 17);
            
            typing_speed = 1;
            break;
        case 16:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 17:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("You kids think I'm the bad guy, but I'm not.", 17);
            typing_speed = 1;
            
            if (global.nohit)
            {
                jammer = true;
                generator1 = true;
                generator2 = true;
                global.generator1hp = 17;
                global.generator2hp = 17;
            }
            else
            {
                jammer = true;
                generator1 = true;
                generator2 = true;
                global.generator1hp = 12;
                global.generator2hp = 12;
            }
            
            break;
        case 18:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("Everything I've done is for a good reason.", 17);
            typing_speed = 1;
            break;
        case 19:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 20:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("Bribing my enemies, forcing staff to work on holidays...", 17);
            typing_speed = 1;
            break;
        case 21:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("It was all for the prosperity of this world!", 17);
            typing_speed = 1;
            break;
        case 22:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 23:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("My people need a guiding light.", 17);
            typing_speed = 1;
            break;
        case 24:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 25:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("And when you have failed us again and again...", 17);
            typing_speed = 1;
            break;
        case 26:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("That light has to come from somewhere else.", 17);
            typing_speed = 1;
            break;
        case 27:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 28:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("The burden of putting smiles on their faces is mine to bear.", 17);
            typing_speed = 1;
            break;
        case 29:
            tennatalk = true;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("If sacrifices have to be made, so be it.", 17);
            typing_speed = 1;
            break;
        case 30:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 31:
            tennatalk = false;
            susietalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = -10;
            current_dialogue = format_text_battle("The crew was right...", 17);
            typing_speed = 1;
            
            if (global.nohit)
            {
                jammer = true;
                generator1 = true;
                generator2 = true;
                global.generator1hp = 26;
                global.generator2hp = 26;
            }
            else
            {
                jammer = true;
                generator1 = true;
                generator2 = true;
                global.generator1hp = 24;
                global.generator2hp = 24;
            }
            
            break;
        case 32:
            tennatalk = false;
            susietalk = true;
            texttalk = false;
            dialoguebubblexscale = -1;
            textxoffset = -144;
            textyoffset = -10;
            
            if (!susiedown)
                current_dialogue = format_text_battle("You're just as much of a criminal as the rest of them!", 17);
            else
                current_dialogue = format_text_battle("You're just as much of a criminal as the rest of them! (COUGH)", 17);
            
            typing_speed = 1;
            break;
        case 33:
            tennatalk = true;
            susietalk = false;
            miketalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("Incorrect. Nothing I do is a crime.", 17);
            typing_speed = 1;
            break;
        case 34:
            tennatalk = false;
            miketalk = true;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle("(bzzt) True! She's legally exempt from any wrongdoing! (bzzt)", 17);
            typing_speed = 1;
            break;
        case 35:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("It'll take a lot of work to get things back on track.", 17);
            typing_speed = 1;
            break;
        case 36:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("I've tolerated those shadowy hoodlums for too long...", 17);
            typing_speed = 1;
            break;
        case 37:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("And you ran around MY city putting false ideas in people's heads.", 17);
            typing_speed = 1;
            break;
        case 38:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 39:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("So much chaos thrown at my feet...", 17);
            typing_speed = 1;
            break;
        case 40:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("It's going to take a lot of coffee for me to organize it all.", 17);
            typing_speed = 1;
            break;
        case 41:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 42:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("All things considered, I'm optimistic about the future.", 17);
            typing_speed = 1;
            break;
        case 43:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("Your hostile and unruly behavior is just a setback.", 17);
            typing_speed = 1;
            break;
        case 44:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("A very exhausting setback.", 17);
            typing_speed = 1;
            break;
        case 45:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 46:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("A few reruns and commercial breaks should do it.", 17);
            typing_speed = 1;
            jammer = true;
            generator1 = true;
            generator2 = true;
            global.generator1hp = 20;
            global.generator2hp = 20;
            break;
        case 47:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 48:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("People will trust anything they see on TV, especially if it comes from Mike.", 17);
            typing_speed = 1;
            break;
        case 49:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("With his voice and my watchful eyes, everything will be okay.", 17);
            typing_speed = 1;
            break;
        case 50:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("The Broadcast World will become a vibrant paradise once more!", 17);
            typing_speed = 1;
            break;
        case 51:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 52:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            
            if (global.nohit)
                current_dialogue = format_text_battle("You can't be serious.", 17);
            else
                current_dialogue = format_text_battle("I guess you could say it'll be...", 17);
            
            typing_speed = 1;
            break;
        case 53:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            
            if (global.nohit)
                current_dialogue = format_text_battle("MIKE, HOW DO I ACTIVATE HARD MODE ON THIS THING!?", 17);
            else
                current_dialogue = format_text_battle("Tenna-Tastic!", 17);
            
            typing_speed = 1;
            break;
        case 54:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle("...", 17);
            typing_speed = 1;
            break;
        case 55:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            
            if (global.nohit)
                current_dialogue = format_text_battle("(bzzt) I never completed \"HARD MODE\", sis. (bzzt)", 17);
            else
                current_dialogue = format_text_battle("(bzzt) That joke was terrible, sis. (bzzt)", 17);
            
            typing_speed = 1;
            break;
        case 56:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            
            if (global.nohit)
                current_dialogue = format_text_battle("(bzzt) I didn't think they'd be able to dodge all the ", 17);
            else
                current_dialogue = format_text_battle("(bzzt) Did you pay attention at all when I ", 17);
            
            typing_speed = 1;
            
            if (text_complete)
            {
                if (!instance_exists(obj_maximike_mute))
                {
                    audio_play_sound(snd_bump, 1, false, 1.6);
                    instance_create_depth(ENEMY1.x, ENEMY1.y, ENEMY1.depth - 2, obj_maximike_mute);
                }
                
                advance_pressed = true;
            }
            
            break;
        case 57:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 0;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle("               ", 17);
            typing_speed = 1;
            d57timer++;
            
            if (d57timer == 40)
                advance_pressed = true;
            
            break;
        case 58:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("Enough about my grand plans to clean up your mess, though.", 17);
            typing_speed = 1;
            break;
        case 59:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("You're kind of eating up all the time I designated for thrashing you...", 17);
            typing_speed = 1;
            break;
        case 60:
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
            break;
        case 61:
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle("So, like, please get beaten up?", 17);
            typing_speed = 1;
            jammer = true;
            generator1 = true;
            generator2 = true;
            global.generator1hp = 20;
            global.generator2hp = 20;
            break;
    }
    
    var end_cases;
    
    if (enemydialogue >= 62)
    {
        if ((enemydialogue % 2) == 0)
        {
            tennatalk = true;
            miketalk = false;
            susietalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -34;
            textyoffset = -120;
            current_dialogue = format_text_battle(string(tennatext), 17);
            typing_speed = 1;
        }
        else
        {
            miketalk = true;
            tennatalk = false;
            texttalk = false;
            dialoguebubblexscale = 1;
            textxoffset = -60;
            textyoffset = -30;
            current_dialogue = format_text_battle(string(jamtext), 17);
            typing_speed = 1;
        }
        
        end_cases = [];
        var total = 3000;
        
        for (var n = 1; n <= total; n++)
            array_push(end_cases, (2 * n) + 61);
    }
    else
    {
        end_cases = [4, 10, 13, 16, 19, 22, 24, 27, 30, 34, 38, 41, 45, 47, 51, 57, 60, 61];
    }
    
    var text_x = (ENEMYinitialx - 220) + textxoffset;
    var text_y = (ENEMY1.y - 36) + textyoffset;
    
    if (dialoguebubblexscale == 1)
        draw_sprite_ext(spr_c3_dialoguebubble, 0, (ENEMYinitialx - 30) + textxoffset, ENEMY1.y + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
    else
        draw_sprite_ext(spr_c3_dialoguebubble, 0, (ENEMYinitialx - 250) + textxoffset, ENEMY1.y + textyoffset, dialoguebubblexscale, 1, 0, c_white, 1);
    
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    draw_set_color(c_black);
    draw_text(text_x, text_y, displayed_text);
    
    if (destroy)
        blockprogress = true;
    
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
                    if (next_char == "@" || next_char == "}" || next_char == "{")
                    {
                        alarm[0] = 10;
                        pause_for_punctuation = true;
                        
                        if (next_char == "@")
                            displayed_text += ".";
                        
                        if (next_char == "}")
                            displayed_text += "?";
                        
                        if (next_char == "{")
                            displayed_text += "!";
                        
                        letter_index += 1;
                        break;
                    }
                    
                    displayed_text += next_char;
                    
                    if (next_char == "," || next_char == ":" || next_char == ".")
                    {
                        alarm[0] = 4;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char != " " && next_char != "*" && next_char != "?")
                    {
                        if (tennatalk)
                            audio_play_sound(snd_tenna, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.7);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (emptytalk)
                            audio_play_sound(snd_empty, 1, false);
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
    
    if ((advance_pressed && !blockprogress) || (skiptimer == 2 && !blockprogress))
    {
        flashpercent = 0;
        PARTYMEMBER1.flashalpha = 0;
        PARTYMEMBER2.flashalpha = 0;
        PARTYMEMBER3.flashalpha = 0;
        
        if (text_complete)
        {
            if (array_contains(end_cases, enemydialogue))
            {
                textenemy = false;
                global.enemyturn = true;
                enemydialogue += 1;
                enemydialoguecount += 1;
                texttalk = true;
                tennatalk = false;
                miketalk = false;
            }
            else
            {
                enemydialogue += 1;
                enemydialoguecount += 1;
                reset_dialogue_normal();
            }
        }
    }
    else if ((skip_pressed && !advance_pressed && !blockprogress) || (skiptimer == 1 && !blockprogress))
    {
        displayed_text = format_text_replacements(current_dialogue);
        text_complete = true;
        audio_stop_sound(snd_tenna);
        audio_stop_sound(snd_mike);
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
}

if (keyboard_check(ord("C")) && !blockprogress)
    skiptext = true;

if (keyboard_check_released(ord("C")) || blockprogress)
{
    skiptext = false;
    skiptimer = 0;
}

if (skiptext && !blockprogress)
    skiptimer++;

if (textact)
{
    flashresettimer++;
    
    if (flashresettimer == 0)
    {
        flashpercent = 0;
        ENEMY1.flashalpha = 0;
    }
    
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 146) : (camera_get_view_x(view_camera[0]) + 30);
    var text_y = camera_get_view_y(view_camera[0]) + 376;
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
    
    if (ACTNAME == "Kris")
    {
        if (ds_map_exists(global.item_data, used_itemk))
        {
            var item_entry = ds_map_find_value(global.item_data, used_itemk);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = "error";
        }
        
        switch (itemtargetk)
        {
            case PARTYMEMBER1:
                PARTYMEMBER1.itemchoice = used_itemk;
                break;
            case PARTYMEMBER2:
                PARTYMEMBER2.itemchoice = used_itemk;
                break;
            case PARTYMEMBER3:
                PARTYMEMBER3.itemchoice = used_itemk;
                break;
        }
    }
    else if (ACTNAME == "Susie")
    {
        if (ds_map_exists(global.item_data, used_items))
        {
            var item_entry = ds_map_find_value(global.item_data, used_items);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = "error";
        }
        
        switch (itemtargets)
        {
            case PARTYMEMBER1:
                PARTYMEMBER1.itemchoice = used_items;
                break;
            case PARTYMEMBER2:
                PARTYMEMBER2.itemchoice = used_items;
                break;
            case PARTYMEMBER3:
                PARTYMEMBER3.itemchoice = used_items;
                break;
        }
    }
    else if (ACTNAME == "Ralsei")
    {
        if (ds_map_exists(global.item_data, used_itemr))
        {
            var item_entry = ds_map_find_value(global.item_data, used_itemr);
            itemfullname = ds_map_find_value(item_entry, "name");
        }
        else
        {
            itemfullname = "error";
        }
        
        switch (itemtargetr)
        {
            case PARTYMEMBER1:
                PARTYMEMBER1.itemchoice = used_itemr;
                break;
            case PARTYMEMBER2:
                PARTYMEMBER2.itemchoice = used_itemr;
                break;
            case PARTYMEMBER3:
                PARTYMEMBER3.itemchoice = used_itemr;
                break;
        }
    }
    
    susietalk = false;
    charactertalking = false;
    
    switch (actdialogue)
    {
        case 1:
            randomize();
            texttalk = true;
            dialogueicon = 1;
            
            if (krisactoptions == 0 && krisacting)
            {
                current_dialogue = format_text("MAXIMIKE - Mike's head is full of static. Can anything make him come to his senses?", 31);
            }
            else if (susieacting)
            {
                current_dialogue = format_text("Susie changed Maximike's channel!", 31);
            }
            else if (ralseiacting)
            {
                current_dialogue = format_text("Ralsei changed Maximike's channel!", 31);
            }
            else if (krismercy || susiemercy || ralseimercy)
            {
                current_dialogue = format_text(string(ACTNAME) + " spared " + string(ENEMYNAME) + "{\n* But its name wasn't YELLOW...", 60);
            }
            else if (krisitem || susieitem || ralseiitem)
            {
                current_dialogue = format_text(string(ACTNAME) + " used the " + string(itemfullname) + "!", 31);
            }
            else if (susiemagic && !(susieactoptions == 1 && jammed))
            {
                if (susieactoptions == 1)
                    current_dialogue = format_text("Susie used RUDE BUSTER!", 31);
                else if (susieactoptions == 0 && susieactoptionsvertical == 1)
                    current_dialogue = format_text("Susie used BADASS HEAL!", 31);
            }
            else if (ralseimagic)
            {
                if (ralseiactoptions == 1)
                    current_dialogue = "* Ralsei cast PACIFY{\n* But the enemy wasn't TIRED...";
                else if (ralseiactoptions == 0 && ralseiactoptionsvertical == 1)
                    current_dialogue = format_text("Ralsei used HEAL PRAYER!", 31);
            }
            else if (krisactoptions == 1)
            {
                current_dialogue = format_text("Everyone changed Maximike's channel!", 31);
            }
            
            typing_speed = 1;
            break;
        case 2:
            texttalk = false;
            tennatalk = true;
            
            if (!(global.turn >= 7))
                charactertalking = true;
            
            if (krisactoptions == 1)
            {
                if (global.turn >= 7)
                {
                    charactertalking = false;
                    current_dialogue = format_text("...", 28);
                }
                else
                {
                    switch (reason)
                    {
                        case 1:
                            dialogueicon = 2;
                            current_dialogue = format_text("That so?", 28);
                            break;
                        case 2:
                            dialogueicon = 14;
                            current_dialogue = format_text("If this is your best shot at making me feel bad, it sucks.", 28);
                            break;
                        case 3:
                            dialogueicon = 4;
                            current_dialogue = format_text("Did you say something?", 28);
                            break;
                        case 4:
                            dialogueicon = 4;
                            current_dialogue = format_text("You'd make a great commentator for the Golf Channel...", 28);
                            break;
                        case 5:
                            dialogueicon = 1;
                            current_dialogue = format_text("Hmph{ That's the worst apology I've ever heard.", 28);
                            break;
                        case 6:
                            dialogueicon = 9;
                            current_dialogue = format_text("Stop@ Just stop.", 28);
                            break;
                        default:
                            break;
                    }
                }
            }
            
            break;
        default:
            current_dialogue = "";
            break;
    }
    
    if (charactertalking)
    {
    }
    
    if (destroy)
        blockprogress = true;
    
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
                    if (next_char == "@" || next_char == "}" || next_char == "{" || next_char == ";")
                    {
                        alarm[0] = 10;
                        pause_for_punctuation = true;
                        
                        if (next_char == "@")
                            displayed_text += ".";
                        
                        if (next_char == "}")
                            displayed_text += "?";
                        
                        if (next_char == "{")
                            displayed_text += "!";
                        
                        if (next_char == ";")
                            displayed_text += ";";
                        
                        letter_index += 1;
                        break;
                    }
                    
                    displayed_text += next_char;
                    
                    if (next_char == "," || next_char == ":" || next_char == ".")
                    {
                        alarm[0] = 4;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char != " " && next_char != "*" && next_char != "?")
                    {
                        if (tennatalk)
                            audio_play_sound(snd_tenna, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.7);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (emptytalk)
                            audio_play_sound(snd_empty, 1, false);
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
    
    var end_cases;
    
    if (krisitem || susieitem || ralseiitem || global.endofbattle)
        end_cases = [1];
    else if (susiemagic && !(susieactoptions == 0 && jammed))
        end_cases = [1];
    else if (krisactoptions == 0)
        end_cases = [1];
    else
        end_cases = [1];
    
    var textx = camera_get_view_x(view_camera[0]) + 30;
    var texty = camera_get_view_y(view_camera[0]) + 376;
    
    if (actdialogue == 1)
    {
        var text_parts = string_split(current_dialogue, "YELLOW");
        var x_offset = textx;
        var y_offset = texty;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                draw_text(x_offset, y_offset, line);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = textx;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 6);
                var color;
                
                switch (i + 1)
                {
                    default:
                        color = 8388736;
                        break;
                }
                
                draw_set_color(#323200);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, c_yellow, c_yellow, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = textx;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (ralseiactoptions == 1)
    {
        var text_parts = string_split(current_dialogue, "TIRED");
        var x_offset = textx;
        var y_offset = texty;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                draw_text(x_offset, y_offset, line);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = textx;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 5);
                var color;
                
                switch (i + 1)
                {
                    default:
                        color = 8388736;
                        break;
                }
                
                draw_set_color(#03037D);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, c_blue, c_blue, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = textx;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if ((!pause_for_punctuation && advance_pressed && !blockprogress) && !PARTYMEMBER2.rudebuster && !(PARTYMEMBER3.sprite_index == spr_ralsei_magic) && !(PARTYMEMBER1.sprite_index == spr_kris_item && PARTYMEMBER1.image_speed == 1) && !(PARTYMEMBER2.sprite_index == spr_susie_item) && !(PARTYMEMBER3.sprite_index == spr_ralsei_item && PARTYMEMBER3.image_speed == 1))
    {
        if (text_complete)
        {
            flashpercent = 0;
            ENEMY1.flashalpha = 0;
            
            if (array_contains(end_cases, actdialogue))
            {
                textact = false;
                progressfinal = true;
                reset_dialogue_normal();
                charactertalking = false;
                tennatalk = false;
                miketalk = false;
                texttalk = true;
                actdialogue = 1;
                
                if (ACTNAME == "Kris")
                {
                    krisacting = false;
                    krismercy = false;
                    krisitem = false;
                    krisbattleicon = 0;
                    PARTYMEMBER1.image_speed = 1;
                    
                    if (krisactoptions == 1)
                    {
                        if (!susiedown)
                        {
                            susieacting = false;
                            
                            if (!PARTYMEMBER2.specialrude)
                                susiemagic = false;
                            
                            susiemercy = false;
                            susieitem = false;
                            susiebattleicon = 0;
                            PARTYMEMBER2.image_speed = 1;
                        }
                        
                        if (!ralseidown)
                        {
                            ralseiacting = false;
                            ralseimagic = false;
                            ralseimercy = false;
                            ralseiitem = false;
                            ralseibattleicon = 0;
                            PARTYMEMBER3.image_speed = 1;
                        }
                    }
                }
                else if (ACTNAME == "Susie")
                {
                    susieacting = false;
                    
                    if (!PARTYMEMBER2.specialrude)
                        susiemagic = false;
                    
                    susiemercy = false;
                    susieitem = false;
                    susiebattleicon = 0;
                    PARTYMEMBER2.image_speed = 1;
                }
                else if (ACTNAME == "Ralsei")
                {
                    ralseiacting = false;
                    ralseimagic = false;
                    ralseimercy = false;
                    ralseiitem = false;
                    ralseibattleicon = 0;
                    PARTYMEMBER3.image_speed = 1;
                }
            }
            else
            {
                actdialogue += 1;
                reset_dialogue_normal();
            }
        }
    }
    else if (skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = format_text_replacements(current_dialogue);
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_empty);
    }
}
