interacttimer++;

if (interacttimer >= 0)
{
    advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    revert_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    up = keyboard_check_pressed(vk_up);
    down = keyboard_check_pressed(vk_down);
}
else
{
    advance_pressed = 0;
    revert_pressed = 0;
    up = 0;
    down = 0;
}

if (advance_pressed || revert_pressed || up || down)
    interacttimer = -2;

if (buymenu)
{
    draw_sprite_ext(spr_shopmenu_box, 0, 520, 318 + yoffset, 1, 1, 0, c_white, 1);
    draw_set_font(fDeterminationSans);
    
    if (buyoptions == 0)
        draw_text(440, 231 + yoffset, translation_get_string("gml_Object_obj_primflowershop_Draw_0_0"));
    
    if (buyoptions == 1)
    {
        draw_text(440, 231 + yoffset, translation_get_string("gml_Object_obj_primflowershop_Draw_0_1"));
        draw_sprite_ext(spr_primshop_armor, 0, 320, 240 + yoffset + 180, 1, 1, 0, c_white, 1);
    }
    
    if (buyoptions == 2)
        draw_text(440, 231 + yoffset, translation_get_string("gml_Object_obj_primflowershop_Draw_0_2"));
    
    if (buyoptions == 3)
    {
        draw_text(440, 231 + yoffset, translation_get_string("gml_Object_obj_primflowershop_Draw_0_3"));
        draw_sprite_ext(spr_primshop_armor, 1, 320, 240 + yoffset + 180, 1, 1, 0, c_white, 1);
    }
}

draw_self();

if (buymenu)
{
    draw_set_font(fDeterminationSans);
    
    if (!teabought)
    {
        draw_text(60, 264, translation_get_string("gml_Object_obj_primflowershop_Draw_0_4"));
        draw_text(300, 264, translation_get_string("gml_Object_obj_primflowershop_Draw_0_5"));
    }
    else
    {
        draw_text_color(60, 264, translation_get_string("gml_Object_obj_primflowershop_Draw_0_6"), c_gray, c_gray, c_gray, c_gray, 1);
    }
    
    draw_text(60, 304, translation_get_string("gml_Object_obj_primflowershop_Draw_0_7"));
    draw_text(300, 304, translation_get_string("gml_Object_obj_primflowershop_Draw_0_8"));
    draw_text(60, 344, translation_get_string("gml_Object_obj_primflowershop_Draw_0_9"));
    draw_text(300, 344, translation_get_string("gml_Object_obj_primflowershop_Draw_0_10"));
    draw_text(60, 384, translation_get_string("gml_Object_obj_primflowershop_Draw_0_11"));
    draw_text(300, 384, translation_get_string("gml_Object_obj_primflowershop_Draw_0_12"));
    draw_text(60, 424, translation_get_string("gml_Object_obj_primflowershop_Draw_0_13"));
    
    if (selectedbuy)
    {
        if (keyboard_check_pressed(vk_down))
            selectedoptions++;
        else if (keyboard_check_pressed(vk_up))
            selectedoptions--;
        
        selectedoptions = clamp(selectedoptions, 0, 1);
        draw_text(480, 343, translation_get_string("gml_Object_obj_primflowershop_Draw_0_14"));
        
        if (selectedoptions == 0)
            draw_sprite_ext(spr_SOUL, 0, 458, 358, 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(spr_SOUL, 0, 458, 388, 1, 1, 0, c_white, 1);
        
        if (buyoptions == 0)
            draw_text(460, 263, translation_get_string("gml_Object_obj_primflowershop_Draw_0_15"));
        else if (buyoptions == 1)
            draw_text(460, 263, translation_get_string("gml_Object_obj_primflowershop_Draw_0_16"));
        else if (buyoptions == 2)
            draw_text(460, 263, translation_get_string("gml_Object_obj_primflowershop_Draw_0_17"));
        else if (buyoptions == 3)
            draw_text(460, 263, translation_get_string("gml_Object_obj_primflowershop_Draw_0_18"));
    }
    
    if (selectedbuy && advance_pressed && selectedoptions == 0)
    {
        if (buyoptions == 0)
        {
            selectedbuy = false;
            teabought = true;
            space -= 1;
            audio_play_sound(snd_locker, 1, false);
            
            with (obj_primflower)
            {
                dialogue = 80;
                reset_dialogue_normal();
            }
        }
        else if (buyoptions == 1 && global.money >= 260 && ((space > 0) & teabought || (space > 1) & !teabought))
        {
            selectedbuy = false;
            audio_play_sound(snd_locker, 1, false);
            global.money -= 260;
            space -= 1;
            
            with (obj_primflower)
            {
                dialogue = 81;
                reset_dialogue_normal();
            }
        }
        else if (buyoptions == 2 && global.money >= 100 && ((space > 0) & teabought || (space > 1) & !teabought))
        {
            selectedbuy = false;
            audio_play_sound(snd_locker, 1, false);
            global.money -= 100;
            space -= 1;
            
            with (obj_primflower)
            {
                dialogue = 81;
                reset_dialogue_normal();
            }
        }
        else if (buyoptions == 3 && global.money >= 420 && ((space > 0) & teabought || (space > 1) & !teabought))
        {
            selectedbuy = false;
            audio_play_sound(snd_locker, 1, false);
            global.money -= 420;
            space -= 1;
            
            with (obj_primflower)
            {
                dialogue = 81;
                reset_dialogue_normal();
            }
        }
        else if (!teabought)
        {
            selectedbuy = false;
            
            with (obj_primflower)
            {
                dialogue = 84;
                reset_dialogue_normal();
            }
        }
        else
        {
            selectedbuy = false;
            
            with (obj_primflower)
            {
                dialogue = 83;
                reset_dialogue_normal();
            }
        }
    }
    else if (selectedbuy && (revert_pressed || (advance_pressed && selectedoptions == 1)))
    {
        selectedbuy = false;
        selectedoptions = 0;
        
        with (obj_primflower)
        {
            dialogue = 82;
            text_complete = true;
            reset_dialogue_normal();
        }
        
        revert_pressed = 0;
    }
    else if (advance_pressed && !selectedbuy && !(buyoptions == 4) && !(buyoptions == 0 && teabought))
    {
        advance_pressed = 0;
        selectedbuy = true;
    }
    else if (revert_pressed)
    {
        advance_pressed = 0;
        buymenu = false;
        mainmenu = true;
        buyoptions = 0;
        image_index = 0;
        
        with (obj_primflower)
        {
            reset_dialogue_normal();
            dialogue = 2;
            dialogueinbox = false;
        }
    }
    
    if (!selectedbuy)
    {
        if (buyoptions == 0)
        {
            draw_sprite_ext(spr_SOUL, 0, 38, 278, 1, 1, 0, c_white, 1);
        }
        else if (buyoptions == 1)
        {
            draw_sprite_ext(spr_SOUL, 0, 38, 318, 1, 1, 0, c_white, 1);
        }
        else if (buyoptions == 2)
        {
            draw_sprite_ext(spr_SOUL, 0, 38, 358, 1, 1, 0, c_white, 1);
        }
        else if (buyoptions == 3)
        {
            draw_sprite_ext(spr_SOUL, 0, 38, 398, 1, 1, 0, c_white, 1);
        }
        else if (buyoptions == 4)
        {
            draw_sprite_ext(spr_SOUL, 0, 38, 438, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                advance_pressed = 0;
                buymenu = false;
                mainmenu = true;
                buyoptions = 0;
                image_index = 0;
                
                with (obj_primflower)
                {
                    reset_dialogue_normal();
                    dialogue = 2;
                    dialogueinbox = false;
                }
            }
        }
        
        if (keyboard_check_pressed(vk_down))
            buyoptions++;
        else if (keyboard_check_pressed(vk_up))
            buyoptions--;
    }
    
    if (!teabought)
        buyoptions = clamp(buyoptions, 0, 4);
    else
        buyoptions = clamp(buyoptions, 1, 4);
    
    if (!(buyoptions == 4))
    {
        percentbuy += 0.0625;
        var position = animcurve_channel_evaluate(curveslower, percentbuy);
        yoffset = lerp(0, -180, position);
    }
    else
    {
        percentbuy -= 0.2;
        var position = animcurve_channel_evaluate(curveslower, percentbuy);
        yoffset = lerp(0, -180, position);
    }
    
    percentbuy = clamp(percentbuy, 0, 1);
    draw_set_font(fFight);
    var text;
    
    if (space > 0)
        text = translation_get_string("gml_Object_obj_primflowershop_Draw_0_19") + string(space);
    else
        text = translation_get_string("gml_Object_obj_primflowershop_Draw_0_20");
    
    var text_x = 521;
    var text_y = 430;
    var shadow_color = 8192771;
    var tracking = 0;
    var leading = 0;
    
    for (var i = 1; i <= string_length(text); i++)
    {
        var current_char = string_char_at(text, i);
        
        if (current_char == translation_get_string("gml_Object_obj_primflowershop_Draw_0_21"))
        {
            text_x = 521;
            text_y += (string_height(current_char) + leading);
        }
        else
        {
            draw_set_color(c_white);
            draw_text(text_x, text_y, current_char);
            text_x += (string_width(current_char) + tracking);
        }
    }
}

if (mainmenu)
{
    draw_set_alpha(1);
    draw_set_font(fDeterminationSans);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_text_with_tracking(480, 264, translation_get_string("gml_Object_obj_primflowershop_Draw_0_22"), 16777215, 0, 8);
    yoffset = 0;
    percentbuy = 0;
    
    if (up)
        mainoptions--;
    else if (down)
        mainoptions++;
    
    mainoptions = clamp(mainoptions, 0, 3);
    
    switch (mainoptions)
    {
        case 0:
            draw_sprite_ext(spr_SOUL, 0, 458, 278, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                advance_pressed = 0;
                buymenu = true;
                image_index = 1;
                mainmenu = false;
                mainoptions = 0;
                
                with (obj_primflower)
                {
                    dialogueinbox = true;
                    reset_dialogue_normal();
                    dialogue = 63;
                }
            }
            
            break;
        case 1:
            draw_sprite_ext(spr_SOUL, 0, 458, 318, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                mainmenu = false;
                mainoptions = 0;
                showmoney = false;
                image_index = 2;
                
                with (obj_primflower)
                {
                    reset_dialogue_normal();
                    progressallow = true;
                    dialogue = 3;
                }
            }
            
            break;
        case 2:
            draw_sprite_ext(spr_SOUL, 0, 458, 358, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                mainmenu = false;
                mainoptions = 0;
                talkmenuoptions = 0;
                talkmenu = true;
                advance_pressed = 0;
                
                with (obj_primflower)
                {
                    dialogueinbox = true;
                    reset_dialogue_normal();
                    dialogue = 6;
                }
            }
            
            break;
        case 3:
            draw_sprite_ext(spr_SOUL, 0, 458, 398, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                audio_stop_sound(mus_primflower);
                mainmenu = false;
                mainoptions = 0;
                showmoney = false;
                image_index = 2;
                
                with (obj_primflower)
                {
                    reset_dialogue_normal();
                    dialogue = 64;
                }
            }
            
            break;
        default:
            break;
    }
}

if (showmoney)
{
    draw_set_font(fDeterminationSans);
    draw_text_with_tracking(440, 424, translation_get_string("gml_Object_obj_primflowershop_Draw_0_23") + string(global.money), 16777215, 0, 7);
}

if (talkmenu)
{
    if (up)
        talkmenuoptions--;
    else if (down)
        talkmenuoptions++;
    
    talkmenuoptions = clamp(talkmenuoptions, 0, 4);
    draw_set_font(fDeterminationSans);
    
    if (!yourselftalked)
        draw_text(80, 264, translation_get_string("gml_Object_obj_primflowershop_Draw_0_24"));
    else
        draw_text_color(80, 264, translation_get_string("gml_Object_obj_primflowershop_Draw_0_25"), c_yellow, c_yellow, c_yellow, c_yellow, 1);
    
    draw_text(80, 304, translation_get_string("gml_Object_obj_primflowershop_Draw_0_26"));
    draw_text(80, 344, translation_get_string("gml_Object_obj_primflowershop_Draw_0_27"));
    
    if (!freedomtalked)
        draw_text(80, 384, translation_get_string("gml_Object_obj_primflowershop_Draw_0_28"));
    else
        draw_text_color(80, 384, translation_get_string("gml_Object_obj_primflowershop_Draw_0_29"), c_yellow, c_yellow, c_yellow, c_yellow, 1);
    
    draw_text(80, 424, translation_get_string("gml_Object_obj_primflowershop_Draw_0_30"));
    
    if (revert_pressed)
    {
        revert_pressed = 0;
        talkmenu = false;
        mainmenu = true;
        
        with (obj_primflower)
        {
            reset_dialogue_normal();
            dialogue = 2;
            dialogueinbox = false;
        }
    }
    
    switch (talkmenuoptions)
    {
        case 0:
            draw_sprite_ext(spr_SOUL, 0, 58, 278, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                mainmenu = false;
                mainoptions = 0;
                talkmenu = false;
                talkmenuoptions = 0;
                image_index = 2;
                showmoney = false;
                
                with (obj_primflower)
                {
                    dialogueinbox = false;
                    progressallow = true;
                    reset_dialogue_normal();
                    
                    if (obj_primflowershop.talkedonce && !obj_primflowershop.teabought)
                        dialogue = 15;
                    else if (!obj_primflowershop.yourselftalked)
                        dialogue = 7;
                    else
                        dialogue = 17;
                }
            }
            
            break;
        case 1:
            draw_sprite_ext(spr_SOUL, 0, 58, 318, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                mainmenu = false;
                mainoptions = 0;
                talkmenu = false;
                talkmenuoptions = 0;
                image_index = 2;
                showmoney = false;
                
                with (obj_primflower)
                {
                    dialogueinbox = false;
                    progressallow = true;
                    reset_dialogue_normal();
                    
                    if (obj_primflowershop.talkedonce && !obj_primflowershop.teabought)
                        dialogue = 15;
                    else
                        dialogue = 21;
                }
            }
            
            break;
        case 2:
            draw_sprite_ext(spr_SOUL, 0, 58, 358, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                mainmenu = false;
                mainoptions = 0;
                talkmenu = false;
                talkmenuoptions = 0;
                image_index = 2;
                showmoney = false;
                
                with (obj_primflower)
                {
                    dialogueinbox = false;
                    progressallow = true;
                    reset_dialogue_normal();
                    
                    if (obj_primflowershop.talkedonce && !obj_primflowershop.teabought)
                        dialogue = 15;
                    else
                        dialogue = 32;
                }
            }
            
            break;
        case 3:
            draw_sprite_ext(spr_SOUL, 0, 58, 398, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                mainmenu = false;
                mainoptions = 0;
                talkmenu = false;
                talkmenuoptions = 0;
                image_index = 2;
                showmoney = false;
                
                with (obj_primflower)
                {
                    dialogueinbox = false;
                    progressallow = true;
                    reset_dialogue_normal();
                    
                    if (obj_primflowershop.talkedonce && !obj_primflowershop.teabought)
                        dialogue = 15;
                    else if (!obj_primflowershop.freedomtalked)
                        dialogue = 39;
                    else
                        dialogue = 52;
                }
            }
            
            break;
        case 4:
            draw_sprite_ext(spr_SOUL, 0, 58, 438, 1, 1, 0, c_white, 1);
            
            if (advance_pressed)
            {
                advance_pressed = 0;
                talkmenu = false;
                mainmenu = true;
                
                with (obj_primflower)
                {
                    reset_dialogue_normal();
                    dialogue = 2;
                    dialogueinbox = false;
                }
            }
            
            break;
        default:
            break;
    }
}
