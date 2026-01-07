var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var left_pressed = keyboard_check_pressed(vk_left);
var right_pressed = keyboard_check_pressed(vk_right);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));

if (room == rm_ch3_foaneend)
{
    subimg += 0.1;
    draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 86, 1, 1, 0, c_white, 1);
}
else if (room == rm_ch3_cathodetower_aftermath)
{
    subimg += 0.1;
    draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 394, 1, 1, 0, c_white, 1);
}

draw_sprite(spr_menu_SOUL, 0, pos_x, pos_y);

if (instance_exists(self))
{
    draw_set_font(fDeterminationMW);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

if (room == rm_ch3_spacechannel_2)
{
    if (global.dialogue == 29)
    {
        var tracking = -1.5;
        var leading = 0;
        
        if (options == 0)
        {
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_0"), 16777215, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_1"), 16777215, tracking, leading);
            
            if (left_pressed)
                options = 1;
            
            if (right_pressed)
                options = 2;
        }
        
        if (options == 1)
        {
            pos_x = cam_x + 69;
            pos_y = cam_y + 387;
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_2"), 65535, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_3"), 16777215, tracking, leading);
            
            if (right_pressed)
                options = 2;
            
            if (advance_pressed)
            {
                oTextC3_spacechannel4.d29timerend = 0;
                instance_destroy();
            }
        }
        
        if (options == 2)
        {
            pos_x = cam_x + 477;
            pos_y = cam_y + 387;
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_4"), 16777215, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_5"), 65535, tracking, leading);
            
            if (left_pressed)
                options = 1;
            
            if (advance_pressed)
            {
                global.missedopportunity = true;
                oKrisPlayerC3.sprite_index = sKrisWalkLeft;
                oKrisPlayerC3.x += 8;
                instance_destroy(oTextC3_spacechannel4);
                instance_create_depth(cam_x + 320, cam_y + 240, -60, oTextC3_spacechannel5);
                global.dialogue = 1;
                instance_destroy(self);
            }
        }
    }
    
    if (global.dialogue == 34)
    {
        var tracking = -1.5;
        var leading = 0;
        
        if (options == 0)
        {
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_6"), 16777215, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_7"), 16777215, tracking, leading);
            
            if (left_pressed)
                options = 1;
            
            if (right_pressed)
                options = 2;
        }
        
        if (options == 1)
        {
            pos_x = cam_x + 69;
            pos_y = cam_y + 387;
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_8"), 65535, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_9"), 16777215, tracking, leading);
            
            if (right_pressed)
                options = 2;
            
            if (advance_pressed)
            {
                oKrisPlayerC3.sprite_index = sKrisWalkUp;
                oKrisPlayerC3.x += 8;
                oTextC3_spacechannel4.d34timerend = 0;
                instance_destroy();
            }
        }
        
        if (options == 2)
        {
            pos_x = cam_x + 477;
            pos_y = cam_y + 387;
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_10"), 16777215, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_11"), 65535, tracking, leading);
            
            if (left_pressed)
                options = 1;
            
            if (advance_pressed)
            {
                global.missedopportunity = true;
                oKrisPlayerC3.sprite_index = sKrisWalkLeft;
                oKrisPlayerC3.x += 8;
                instance_destroy(oTextC3_spacechannel4);
                instance_create_depth(cam_x + 320, cam_y + 240, -60, oTextC3_spacechannel5);
                global.dialogue = 1;
                instance_destroy(self);
            }
        }
    }
}

if (room == rm_ch3_foaneend)
{
    var tracking = -1.5;
    var leading = 0;
    
    if (options == 0)
    {
        draw_text_with_tracking(cam_x + 90, cam_y + 60, translation_get_string("obj_menu_SOUL_Draw_0_12"), 16777215, tracking, leading);
        draw_text_with_tracking(cam_x + 498, cam_y + 60, translation_get_string("obj_menu_SOUL_Draw_0_13"), 16777215, tracking, leading);
        
        if (left_pressed)
            options = 1;
        
        if (right_pressed)
            options = 2;
    }
    
    if (options == 1)
    {
        pos_x = cam_x + 69;
        pos_y = cam_y + 79;
        draw_text_with_tracking(cam_x + 90, cam_y + 60, translation_get_string("obj_menu_SOUL_Draw_0_14"), 65535, tracking, leading);
        draw_text_with_tracking(cam_x + 498, cam_y + 60, translation_get_string("obj_menu_SOUL_Draw_0_15"), 16777215, tracking, leading);
        
        if (right_pressed)
            options = 2;
        
        if (advance_pressed)
        {
            with (obj_ch3_foaneend_text)
            {
                reset_dialogue_normal();
                dialogue = 29;
                talking = true;
            }
            
            instance_destroy();
        }
    }
    
    if (options == 2)
    {
        pos_x = cam_x + 477;
        pos_y = cam_y + 79;
        draw_text_with_tracking(cam_x + 90, cam_y + 60, translation_get_string("obj_menu_SOUL_Draw_0_16"), 16777215, tracking, leading);
        draw_text_with_tracking(cam_x + 498, cam_y + 60, translation_get_string("obj_menu_SOUL_Draw_0_17"), 65535, tracking, leading);
        
        if (left_pressed)
            options = 1;
        
        if (advance_pressed)
        {
            with (obj_ch3_foaneend_text)
            {
                reset_dialogue_normal();
                dialogue = 42;
                talking = true;
            }
            
            instance_destroy(self);
        }
    }
}

if (room == rm_ch3_cathodetower_aftermath)
{
    if (choiceprompt == 0)
    {
        var tracking = -1.5;
        var leading = 0;
        
        if (options == 0)
        {
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_18"), 16777215, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_19"), 16777215, tracking, leading);
            
            if (left_pressed)
                options = 1;
            
            if (right_pressed)
                options = 2;
        }
        
        if (options == 1)
        {
            pos_x = cam_x + 69;
            pos_y = cam_y + 387;
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_20"), 65535, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_21"), 16777215, tracking, leading);
            
            if (right_pressed)
                options = 2;
            
            if (advance_pressed)
            {
                with (obj_v_aware)
                {
                    talking = true;
                    dialogue = 12;
                    reset_dialogue_normal();
                    sprite_index = spr_v_aware_talking;
                }
                
                instance_destroy();
            }
        }
        
        if (options == 2)
        {
            pos_x = cam_x + 477;
            pos_y = cam_y + 387;
            draw_text_with_tracking(cam_x + 90, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_22"), 16777215, tracking, leading);
            draw_text_with_tracking(cam_x + 498, cam_y + 368, translation_get_string("obj_menu_SOUL_Draw_0_23"), 65535, tracking, leading);
            
            if (left_pressed)
                options = 1;
            
            if (advance_pressed)
            {
                with (obj_v_aware)
                {
                    talking = true;
                    dialogue = 17;
                    reset_dialogue_normal();
                    sprite_index = spr_v_aware_talking;
                }
                
                instance_destroy();
            }
        }
    }
}
