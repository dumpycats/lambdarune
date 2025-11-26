var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (global.playermove || playeronlymove)
{
    interacttimer++;
    right_key = keyboard_check(vk_right);
    left_key = keyboard_check(vk_left);
    up_key = keyboard_check(vk_up);
    down_key = keyboard_check(vk_down);
    shift_key = keyboard_check(vk_shift);
    x_key = keyboard_check(ord("X"));
    
    if (shift_key || x_key)
    {
        current_spd = move_spd * boost_multiplier;
        current_image_speed = 1.75;
    }
    else
    {
        current_spd = move_spd;
        current_image_speed = 1;
    }
    
    xspd = 0;
    yspd = 0;
    move_spd = 4;
    
    if (right_key && !left_key)
        xspd += current_spd;
    
    if (left_key || (right_key && left_key))
        xspd -= current_spd;
    
    if (up_key || (down_key && up_key))
        yspd -= current_spd;
    
    if (down_key && !up_key)
        yspd += current_spd;
    
    if (instance_exists(oWall))
    {
        if (place_meeting(x + xspd, y, oWall))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oWall))
            yspd = 0;
    }
    
    if (instance_exists(oWallTransitionC3R2))
    {
        if (place_meeting(x + xspd, y, oWallTransitionC3R2))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oWallTransitionC3R2))
            yspd = 0;
    }
    
    if (instance_exists(oWallTransitionC3R3))
    {
        if (place_meeting(x + xspd, y, oWallTransitionC3R3))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oWallTransitionC3R3))
            yspd = 0;
    }
    
    if (instance_exists(oWallTransitionC3R4))
    {
        if (place_meeting(x + xspd, y, oWallTransitionC3R4))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oWallTransitionC3R4))
            yspd = 0;
    }
    
    if (instance_exists(oGateC3R2))
    {
        if (place_meeting(x + xspd, y, oGateC3R2))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oGateC3R2))
            yspd = 0;
    }
    
    if (instance_exists(oFoodFree))
    {
        if (place_meeting(x + xspd, y, oFoodFree))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oFoodFree))
            yspd = 0;
    }
    
    if (instance_exists(oFalseFood))
    {
        if (place_meeting(x + xspd, y, oFalseFood))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oFalseFood))
            yspd = 0;
    }
    
    if (instance_exists(oLeverC3R2))
    {
        if (place_meeting(x + xspd, y, oLeverC3R2))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oLeverC3R2))
            yspd = 0;
    }
    
    if (instance_exists(oCageC3R2))
    {
        if (place_meeting(x + xspd, y, oCageC3R2))
            xspd = 0;
        
        if (place_meeting(x, y + yspd, oCageC3R2))
            yspd = 0;
    }
    
    x += xspd;
    y += yspd;
    
    if (right_key && !left_key)
    {
        if (!up_key && !down_key)
            sprite_index = sKrisWalkRight;
    }
    
    if (left_key || (right_key && left_key))
    {
        if (!up_key && !down_key)
            sprite_index = sKrisWalkLeft;
    }
    
    if (up_key || (up_key && down_key))
    {
        if (!right_key && !left_key)
            sprite_index = sKrisWalkUp;
    }
    
    if (down_key && !up_key)
    {
        if (!right_key && !left_key)
            sprite_index = sKrisWalkDown;
    }
    
    if (sprite_index == sKrisWalkRight && xspd < 0)
        sprite_index = sKrisWalkLeft;
    
    if (sprite_index == sKrisWalkLeft && xspd > 0)
        sprite_index = sKrisWalkRight;
    
    if (sprite_index == sKrisWalkUp && yspd > 0)
        sprite_index = sKrisWalkDown;
    
    if (sprite_index == sKrisWalkDown && yspd < 0)
        sprite_index = sKrisWalkUp;
    
    if (xspd != 0 || yspd != 0)
    {
        image_speed = current_image_speed;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
}
else
{
    interacttimer = -2;
}

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (room == rm_ch3_spacechannel_2)
{
    if (!global.screen3dead)
    {
        if ((place_meeting(x, y - 50, obj_spacechannel_screen3) && !instance_exists(oTextC3_spacechannel1_screen3)) && advance_pressed)
        {
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3_spacechannel1_screen3);
            image_speed = 0;
            image_index = 0;
            global.playermove = false;
        }
    }
    
    if (x >= 1000)
    {
        dtimer1++;
        
        if (dtimer1 == 1)
        {
            if (!instance_exists(obj_spacechannel_textcheck))
            {
                image_speed = 0;
                image_index = 0;
                global.playermove = false;
            }
        }
        
        if (dtimer1 == 2)
        {
            if (!instance_exists(obj_spacechannel_textcheck))
            {
                global.dialogue = 1;
                instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
                instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3_spacechannel2);
            }
        }
    }
    
    if (y <= 1120)
    {
        dtimer2++;
        
        if (dtimer2 == 1)
        {
            image_speed = 0;
            image_index = 0;
            global.playermove = false;
            y = 1120;
            obj_cameracontroller.stoptracking = true;
        }
        
        if (dtimer3 == 1)
        {
            global.dialogue = 1;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3_spacechannel3);
        }
    }
    
    if (global.dialogue == 7 && instance_exists(oTextC3_spacechannel3))
    {
        percent1 += 0.016666666666666666;
        var position1 = animcurve_channel_evaluate(curvelinear, percent1);
        var _start1 = 1020;
        var _end1 = 720;
        var _distance1 = _end1 - _start1;
        y = _start1 + (_distance1 * position1);
        
        if (percent1 <= 1)
        {
            x = 1423;
            image_speed = 1;
        }
        
        if (percent1 == 1.0166666666666666)
        {
            image_index = 0;
            image_speed = 0;
            oDialogueBox.image_alpha = 1;
            oTextC3_spacechannel3.blockprogress = false;
            global.dialogue = 8;
            reset_dialogue();
        }
    }
    
    if (global.dialogue == 9 && instance_exists(oTextC3_spacechannel4))
    {
        if (percent2 <= 1)
        {
            percent2 += 0.04;
            var position1 = animcurve_channel_evaluate(curvelinear, percent2);
            var _start1 = 720;
            var _end1 = 620;
            var _distance1 = _end1 - _start1;
            y = _start1 + (_distance1 * position1);
            
            if (percent2 == 0.04)
                image_speed = 1;
        }
        
        if (percent2 >= 1 && percent3 <= 1)
        {
            sprite_index = sKrisWalkRight;
            percent3 += 0.02857142857142857;
            var position1 = animcurve_channel_evaluate(curvelinear, percent3);
            var _start1 = 1423;
            var _end1 = 1560;
            var _distance1 = _end1 - _start1;
            x = _start1 + (_distance1 * position1);
        }
        
        if (percent3 >= 1 && percent4 <= 1)
        {
            sprite_index = sKrisWalkUp;
            percent4 += 0.1;
            var position1 = animcurve_channel_evaluate(curvelinear, percent4);
            var _start1 = 620;
            var _end1 = 580;
            var _distance1 = _end1 - _start1;
            y = _start1 + (_distance1 * position1);
        }
        
        if (percent4 >= 1 && percent5 <= 5)
        {
            if (percent5 == 0.05)
            {
                depth = obj_bench_c3.depth + 1;
                sprite_index = sKrisWalkLeft;
            }
            
            percent5 += 0.05;
            var position1 = animcurve_channel_evaluate(curvelinear, percent5);
            var _start1 = 1560;
            var _end1 = 1485;
            var _distance1 = _end1 - _start1;
            
            if (percent5 < 2)
                x = _start1 + (_distance1 * position1);
        }
        
        if (percent5 == 1)
        {
            image_speed = 0;
            image_index = 0;
        }
        
        if (percent5 == 1.75)
            sprite_index = sKrisWalkUp;
        
        if (percent5 == 2.75)
        {
            x -= 8;
            sprite_index = spr_kris_bench;
            depth = obj_bench_c3.depth - 1;
        }
        
        if (percent5 == 3.25)
        {
            sprite_index = spr_kris_bench;
            image_index = 1;
        }
        
        if (percent5 == 4.5)
        {
            oTextC3_spacechannel4.blockprogress = false;
            global.dialogue = 10;
            reset_dialogue();
        }
    }
}

if (room == rm_ch3_spacechannel_1)
{
    if (!back)
    {
        if (percent1 <= 1)
        {
            global.playermove = false;
            percent1 += 0.0625;
            var position1 = animcurve_channel_evaluate(curve1, percent1);
            var _start1 = -280;
            var _end1 = 120;
            var _distance1 = _end1 - _start1;
            x = _start1 + (_distance1 * position1);
            
            if (percent1 == 0.0625)
                audio_play_sound(snd_fall_cool_deep, 1, false, 1, false, 1.2);
            
            percent2 += 0.0625;
            var position2 = animcurve_channel_evaluate(curve1, percent2);
            var _start2 = 310;
            var _end2 = 540;
            var _distance2 = _end2 - _start2;
            y = _start2 + (_distance2 * position2);
            
            if (percent1 == 1)
            {
                audio_play_sound(snd_impact, 1, false);
                oKrisPlayerC3.image_index = 0;
                oKrisPlayerC3.sprite_index = sKrisLand;
                image_speed = 1;
            }
        }
        else if (percent3 <= 2)
        {
            if (image_index >= 1)
                image_speed = 0;
            
            percent3 += (1/30);
            var position1 = animcurve_channel_evaluate(curve2, percent3);
            var _start1 = 120;
            var _end1 = 320;
            var _distance1 = _end1 - _start1;
            x = _start1 + (_distance1 * position1);
            
            if (percent3 == 2)
            {
                sprite_index = sKrisWalkDown;
                global.playermove = true;
            }
        }
    }
    
    if (x >= 1500 && !back)
    {
        createtimer++;
        
        if (createtimer == 1)
            global.playermove = false;
        
        if (createtimer == 2)
        {
            image_speed = 0;
            image_index = 0;
            global.dialogue = 1;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3_spacechannel1);
        }
    }
    
    if (!global.screen1dead)
    {
        if ((place_meeting(x, y - 50, obj_spacechannel_screen1) && !instance_exists(oTextC3_spacechannel1_screen1)) && advance_pressed)
        {
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3_spacechannel1_screen1);
            image_speed = 0;
            image_index = 0;
            global.playermove = false;
        }
    }
    
    if (!global.screen2dead)
    {
        if ((place_meeting(x, y - 50, obj_spacechannel_screen2) && !instance_exists(oTextC3_spacechannel1_screen2)) && advance_pressed)
        {
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3_spacechannel1_screen2);
            image_speed = 0;
            image_index = 0;
            global.playermove = false;
        }
    }
}

if (room == rChapter3Room6)
{
    if (global.dialogue == 36)
    {
        percent1 += 0.08333333333333333;
        var position1 = animcurve_channel_evaluate(curve1, percent1);
        var _start1 = 254;
        var _end1 = 214;
        var _distance1 = _end1 - _start1;
        y = _start1 + (_distance1 * position1);
        image_index = 1;
    }
    
    if (percent1 == 1)
    {
        instance_create_depth(320, 240, -55, oBlackScreen1Room6);
        oRalseiC3.image_index = 1;
        oSusieC3.image_index = 3;
    }
}

if (room == rChapter3Room3)
{
    boost_multiplier = 2;
    timer++;
    
    if (timer <= 50)
    {
        image_speed = 1;
        percent1 += 0.02;
        position = animcurve_channel_evaluate(curve1, percent1);
        var _start = 1620;
        var _end = 1450;
        var _distance = _end - _start;
        y = _start + (_distance * position);
    }
    
    if (timer == 50)
    {
        image_speed = 0;
        audio_play_sound(snd_whistle, 1, false, 0.5);
    }
}

if (room == rChapter3Room1)
{
    if (global.dialogue == 19)
    {
        dialogue19timer++;
        
        if (dialogue19timer >= 53)
            camera_set_view_pos(view_camera[0], cam_x, oKrisPlayerC3.y - 240);
    }
    
    if (global.dialogue > 19)
    {
        camera_set_view_target(view_camera[0], oKrisPlayerC3);
        camera_set_view_pos(view_camera[0], cam_x, oKrisPlayerC3.y - 240);
    }
    
    if (global.playermove && y >= (oLift.y - 30))
    {
        y = oLift.y - 30;
        sprite_index = sKrisWalkDown;
        image_index = 0;
        image_speed = 0;
        global.geartime = true;
        global.playermove = false;
    }
    
    if (global.geartime == true)
    {
        image_index = 0;
        image_speed = 0;
    }
}

if (room == rChapter3Room5)
{
    timer++;
    
    if (timer < 40)
    {
        image_speed = 2;
        x += 8;
    }
    
    if (timer >= 40 && timer < 50)
    {
        sprite_index = sKrisWalkUp;
        image_speed = 2;
        y -= 8;
    }
    
    if (timer == 50)
    {
        image_speed = 0;
        image_index = 0;
    }
    
    if (global.dialogue == 2)
        sprite_index = sKrisWalkRight;
    
    if (global.dialogue == 15)
        sprite_index = sKrisWalkDown;
}

if (room == rChapter3Room2)
{
    if (place_meeting(x, y, oSusieC3))
        touching = true;
    else
        touching = false;
    
    if (x < 1230)
        oC3R2Background.x = oKrisPlayerC3.x;
    
    if (x >= 892)
    {
        dialoguespawntimer++;
        
        if (dialoguespawntimer == 1)
        {
            global.playermove = false;
            image_speed = 0;
            image_index = 0;
            oSusieC3.image_speed = 0;
            oSusieC3.image_index = 0;
        }
        
        if (dialoguespawntimer == 2)
        {
            global.dialogue = 1;
            global.charactertalking = true;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
            oDialogueSprite.sprite_index = sSusieDialogueSprite;
            oDialogueSprite.image_index = 1;
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R2);
        }
    }
}

if (room == rChapter3Room7)
{
    timer++;
    
    if (timer > 0 && timer <= 96)
    {
        percent1 += 0.012987012987012988;
        position = animcurve_channel_evaluate(curve1, percent1);
        var _start = cam_y + 520;
        var _end = cam_y + 240;
        var _distance = _end - _start;
        y = _start + (_distance * position);
    }
    
    if (timer > 177 && timer <= 212)
    {
        percent2 += 0.02857142857142857;
        var position2 = animcurve_channel_evaluate(curve2, percent2);
        var _start2 = cam_y + 240;
        var _end2 = cam_y + 271;
        var _distance2 = _end2 - _start2;
        y = _start2 + (_distance2 * position2);
    }
    
    if (timer == 96)
        image_speed = 0;
    
    oKrisShadow.y = y + 72;
}

if (room == rChapter3KreidRoom)
{
    falltimer++;
    
    if (falltimer == 10)
        audio_play_sound(snd_fall_cool_deep, 1, false, 0.8);
    
    if (falltimer > 35)
    {
        percentfall += 0.0625;
        var positionf1 = animcurve_channel_evaluate(curvefall, percentfall);
        var _startf1 = 180;
        var _endf1 = 200;
        var _distancef1 = _endf1 - _startf1;
        
        if (percentfall < 2)
            x = _startf1 + (_distancef1 * positionf1);
        
        var positionf2 = animcurve_channel_evaluate(curvefall, percentfall);
        var _startf2 = -45;
        var _endf2 = 220;
        var _distancef2 = _endf2 - _startf2;
        
        if (percentfall < 2)
            y = _startf2 + (_distancef2 * positionf2);
        
        if (percentfall == 1)
        {
            audio_play_sound(snd_impact, 1, false, 0.5);
            sprite_index = spr_krisland;
            image_index = 0;
            image_speed = 0;
        }
        
        if (percentfall == 1.3125)
            image_index = 1;
        
        if (percentfall == 4.4375)
        {
            sprite_index = sKrisWalkDown;
            image_index = 0;
        }
    }
    
    if (place_meeting(x, y, obj_c3_lightcheck))
        touching = true;
    else
        touching = false;
    
    if (global.playermove)
    {
        if (!kreidbegin)
            yy = y;
        
        if (x >= 2452)
        {
            x = 2452;
            image_speed = 0;
            image_index = 0;
            xspd = 0;
            yspd = 0;
            kreidbegin = true;
            global.playermove = false;
        }
    }
    
    if (global.dialogue == 2)
    {
        percent1 += 0.030303030303030304;
        var position1 = animcurve_channel_evaluate(curve1, percent1);
        var _start1 = 2452;
        var _end1 = 2546;
        var _distance1 = _end1 - _start1;
        x = _start1 + (_distance1 * position1);
        percent2 += 0.03571428571428571;
        var position2 = animcurve_channel_evaluate(curve2, percent2);
        var _start2 = yy;
        var _end2 = 254;
        var _distance2 = _end2 - _start2;
        y = _start2 + (_distance2 * position2);
        
        if (percent1 < 1)
        {
            image_speed = 0.7;
            sprite_index = sKrisWalkRight;
        }
        
        if (percent1 == 1)
        {
            image_speed = 0;
            image_index = 0;
            sprite_index = spr_KrisBright1;
            instance_create_depth(2546, 76, -5, obj_KreidKR);
            instance_create_depth(1920, 240, -4, obj_C3ShadowMenLights2);
            audio_play_sound(snd_noise, 1, false);
        }
    }
}
