var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking && !obj_primflowershop.selectedbuy)
{
    interacttimer = -2;
    subimg += 0.1;
    draw_set_alpha(1);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x, text_y;
    
    if (!dialogueinbox)
    {
        text_x = camera_get_view_x(view_camera[0]) + 30;
        text_y = camera_get_view_y(view_camera[0]) + 270;
    }
    else
    {
        text_x = camera_get_view_x(view_camera[0]) + 438;
        text_y = camera_get_view_y(view_camera[0]) + 260;
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
            primtalk = true;
            current_dialogue = "* Well hello~          \n* I don't think we\n  have met before.";
            typing_speed = 1;
            progressallow = false;
            break;
        case 2:
            primtalk = true;
            current_dialogue = format_text("It is certainly weird to see new faces around here~", 21);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 3:
            primtalk = true;
            current_dialogue = format_text("Ah, you are very forward, are you not?", 31);
            typing_speed = 1;
            break;
        case 4:
            primtalk = true;
            current_dialogue = format_text("But please, do take a look around you.", 31);
            typing_speed = 1;
            break;
        case 5:
            primtalk = true;
            current_dialogue = format_text("Do you not think I have enough garbage already?", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 6:
            primtalk = true;
            current_dialogue = format_text_battle("Seems great for passing time~", 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 7:
            primtalk = true;
            current_dialogue = "* My name is Primflower, but my\n  friends call me Prim@\n* Pleased to make your acquaintance~";
            typing_speed = 1;
            break;
        case 8:
            primtalk = true;
            current_dialogue = format_text("As you may have gathered already, I am not from around here.", 31);
            typing_speed = 1;
            break;
        case 9:
            primtalk = true;
            current_dialogue = "* A while ago, I decided to go\n  on a journey of self-discovery.";
            typing_speed = 1;
            break;
        case 10:
            primtalk = true;
            current_dialogue = format_text("Meeting people here and there, and even teaching some of them~", 31);
            typing_speed = 1;
            break;
        case 11:
            primtalk = true;
            current_dialogue = format_text("But as you can see, I am not in the best of situations right now.", 31);
            typing_speed = 1;
            break;
        case 12:
            primtalk = true;
            current_dialogue = format_text("Is that not so sad? haha~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 13:
            primtalk = true;
            current_dialogue = format_text("Nowadays, I just relax in this place, selling whatever I can sell...", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 14:
            primtalk = true;
            current_dialogue = format_text("And talking to whoever I can talk to~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            
            with (obj_primflowershop)
                yourselftalked = true;
            
            break;
        case 15:
            primtalk = true;
            current_dialogue = format_text("You sure seem interested in little old me...", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 16:
            primtalk = true;
            current_dialogue = format_text("How about I invite you to a cup of tea before we talk any further?", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 17:
            primtalk = true;
            current_dialogue = format_text("Hm?", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 18:
            primtalk = true;
            current_dialogue = format_text("Well, is that not interesting~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 19:
            primtalk = true;
            current_dialogue = format_text("You need not ask me the reason for my journey.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 20:
            primtalk = true;
            current_dialogue = format_text("You will understand the need to find yourself sooner than you think~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            audio_sound_gain(mus_primflower, 0, 0);
            break;
        case 21:
            primtalk = true;
            current_dialogue = format_text("A curious duo, they are.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 22:
            primtalk = true;
            current_dialogue = format_text("You see, the story of this world is neck deep in conflict~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 23:
            primtalk = true;
            current_dialogue = format_text("Imagine being watched all the time by a whole family...", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 24:
            primtalk = true;
            current_dialogue = format_text("Only for said family to be torn apart.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 25:
            primtalk = true;
            current_dialogue = format_text("The TV- The Cathode was by all means abandoned.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 26:
            primtalk = true;
            current_dialogue = format_text("That was what led Loomi Neus to such desperation.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 27:
            primtalk = true;
            current_dialogue = format_text("And desperation... Haha~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 28:
            primtalk = true;
            current_dialogue = format_text("It leads to obsession.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 29:
            primtalk = true;
            current_dialogue = format_text("But you already knew that.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 30:
            primtalk = true;
            current_dialogue = format_text("...Hmm? You did not know?", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 31:
            primtalk = true;
            current_dialogue = format_text("Haha, you are right, how silly of me~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 32:
            primtalk = true;
            current_dialogue = format_text("Ah, The Roaring Knight in Golden Armor...", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 33:
            primtalk = true;
            current_dialogue = format_text("It is very interesting, is it not?", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 34:
            primtalk = true;
            current_dialogue = format_text("The power of will, the power to stand unfazed in front of the insurmountable.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 35:
            primtalk = true;
            current_dialogue = format_text("This power of... Determination.", 40);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 36:
            primtalk = true;
            current_dialogue = format_text("You have so many questions about them~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 37:
            primtalk = true;
            current_dialogue = format_text("But do not worry... You both are fated to clash.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 38:
            primtalk = true;
            current_dialogue = format_text("I hope that, by then, you are... Determined enough, to confront impending destiny~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 39:
            primtalk = true;
            current_dialogue = format_text("As you can see, I enjoy freedom@ I do as I please~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 40:
            primtalk = true;
            current_dialogue = format_text("...Pfft.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 41:
            primtalk = true;
            current_dialogue = format_text("I am jesting.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 42:
            primtalk = true;
            current_dialogue = format_text("That is not what you mean, do you?", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 43:
            primtalk = true;
            current_dialogue = format_text("Knowledge is dangerous, Kris@ It can bring someone to insanity with ease.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 44:
            primtalk = true;
            current_dialogue = format_text("And this insanity... is born from obsession.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 45:
            primtalk = true;
            current_dialogue = format_text("To be something more, to achieve a goal they didn't know existed before...", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 46:
            primtalk = true;
            current_dialogue = format_text("These hopes and dreams... they can take physical form.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 47:
            primtalk = true;
            current_dialogue = format_text("Shadow Crystals.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 48:
            primtalk = true;
            current_dialogue = format_text("One of the rarest materials across the Dark Dimension, precious to both Lightners and Darkners...", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 49:
            primtalk = true;
            current_dialogue = format_text("However... obsession can also give someone an intense drive.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 50:
            primtalk = true;
            current_dialogue = format_text("It could even turn an inoffensive person into a formidable foe, you know?~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 51:
            primtalk = true;
            current_dialogue = format_text("You will find out more... in due time.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            
            with (obj_primflowershop)
                freedomtalked = true;
            
            break;
        case 52:
            primtalk = true;
            current_dialogue = format_text("That stuffed cat is still blind? Haha~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 53:
            primtalk = true;
            current_dialogue = format_text("It is difficult not to see these crystals, with the darkness they ooze.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 54:
            primtalk = true;
            current_dialogue = format_text("Then again, only purification was that cat's forte~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 55:
            primtalk = true;
            current_dialogue = format_text("But do not worry. Artisanship is my specialty~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            
            if ((!pause_for_punctuation && advance_pressed && !blockprogress && text_complete) || (keyboard_check(ord("C")) && !blockprogress))
            {
            }
            
            break;
        case 56:
            primtalk = true;
            current_dialogue = format_text("I will help you make a new Shadow Mantle.", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 57:
            primtalk = true;
            current_dialogue = format_text("Do keep your eyes on it, lest you lose it again~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 58:
            primtalk = true;
            current_dialogue = format_text("Think of it as a favor, considering I am going to stay in your town from now on~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            break;
        case 59:
            primtalk = true;
            current_dialogue = format_text("...You do not mind, do you?", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 60:
            texttalk = true;
            primtalk = false;
            current_dialogue = "* (You received the Shadow Mantle.)";
            global.finished = true;
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            d45timer++;
            
            if (d45timer == 0)
                audio_play_sound(snd_item, 1, false);
            
            break;
        case 61:
            texttalk = false;
            primtalk = true;
            current_dialogue = format_text("Whenever you need to make something with these crystals, come find me.", 31);
            avatar.sprite_index = spr_primflower;
            typing_speed = 1;
            global.finished = true;
            break;
        case 62:
            primtalk = true;
            current_dialogue = format_text("Nothing can escape my sight~", 31);
            avatar.sprite_index = spr_primflower_laugh;
            typing_speed = 1;
            mantlereceived = true;
            global.finished = true;
            break;
        case 63:
            primtalk = true;
            current_dialogue = format_text_battle("What would you like to buy?", 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 64:
            primtalk = true;
            audio_stop_sound(mus_primflower);
            current_dialogue = format_text("Take care... we will see each other very, very soon~", 31);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_direct;
            
            if (text_complete && advance_pressed)
            {
                talking = false;
                reset_dialogue_normal();
                instance_create_depth(x, y, depth - 500, obj_primflowershop_fadeout);
            }
            
            break;
        case 65:
            primtalk = false;
            ralseitalk = true;
            current_dialogue = "";
            displayed_text = "";
            typing_speed = 1;
            break;
        case 80:
            primtalk = true;
            current_dialogue = format_text_battle("This one is on the house~", 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 81:
            primtalk = true;
            current_dialogue = format_text_battle("Thanks, haha~", 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_laugh;
            break;
        case 82:
            primtalk = true;
            current_dialogue = format_text_battle("That's a shame...", 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
            break;
        case 83:
            primtalk = true;
            current_dialogue = format_text_battle("You're out of luck...", 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower_tense;
            break;
        case 84:
            primtalk = true;
            current_dialogue = format_text_battle("The tea's worth more~", 10);
            typing_speed = 1;
            avatar.sprite_index = spr_primflower;
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
                    
                    if ((next_char == "," || next_char == ":") || next_char == "." || next_char == "?")
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
                            audio_play_sound(snd_empty, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (primtalk)
                            audio_play_sound(snd_primflower_sfx, 1, false, 0.5, false, 0.98);
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
    
    var endcase = [5];
    var talkendcase;
    
    if (!global.finished)
        talkendcase = [14, 16, 20, 31, 38, 51, 62];
    else
        talkendcase = [14, 16, 20, 31, 38, 51, 54, 62];
    
    var textx = camera_get_view_x(view_camera[0]) + 30;
    var texty = camera_get_view_y(view_camera[0]) + 270;
    
    if (dialogue == 60)
    {
        var text_parts = string_split(current_dialogue, "Shadow Mantle");
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
                var remaining = string_copy(current_displayed, 1, 13);
                var color;
                
                switch (i + 1)
                {
                    default:
                        color = 8388736;
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
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
    
    if (dialogue == 29)
    {
        var text_parts = string_split(current_dialogue, "you");
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
                var remaining = string_copy(current_displayed, 1, 3);
                var color;
                
                switch (i + 1)
                {
                    default:
                        color = 255;
                        break;
                }
                
                draw_set_color(#320000);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
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
    
    if (((advance_pressed && !blockprogress) && progressallow) || (skiptimer == 2 && progressallow))
    {
        if (text_complete)
        {
            if (array_contains(endcase, dialogue))
            {
                progressallow = false;
                sprite_index = spr_primflower;
                reset_dialogue_normal();
                dialogue = 2;
                dialogueinbox = false;
                
                with (obj_primflowershop)
                {
                    mainmenu = true;
                    image_index = 0;
                    showmoney = true;
                }
            }
            else if (array_contains(talkendcase, dialogue))
            {
                obj_primflowershop.talkedonce = true;
                texttalk = false;
                primtalk = true;
                progressallow = false;
                sprite_index = spr_primflower;
                reset_dialogue_normal();
                dialogueinbox = true;
                dialogue = 6;
                audio_sound_gain(mus_primflower, 1, 0);
                
                with (obj_primflowershop)
                {
                    talkmenu = true;
                    image_index = 0;
                    showmoney = true;
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
        
        if (skiptimer == 3)
        {
            skiptext = false;
            skiptimer = 0;
        }
    }
}
