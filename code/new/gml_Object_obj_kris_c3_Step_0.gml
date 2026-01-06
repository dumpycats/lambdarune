var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (room == rm_ch3_eggroom)
{
    if (x < 330)
        x = 2310;
    
    if (x > 2310)
        x = 330;
}

if (global.playermove || playeronlymove)
{
    var right_key = keyboard_check(vk_right);
    var left_key = keyboard_check(vk_left);
    var up_key = keyboard_check(vk_up);
    var down_key = keyboard_check(vk_down);
    var shift_key = keyboard_check(vk_shift);
    var x_key = keyboard_check(ord("X"));
    boost_multiplier = 1.75 * multipler_multiplier;
    var current_spd, current_image_speed;
    
    if (shift_key || x_key)
    {
        current_spd = move_spd * boost_multiplier;
        current_image_speed = 1 * boost_multiplier;
        multipliertimer++;
        
        if (multipliertimer >= 60)
        {
            if (multipler_multiplier <= 1)
                multipler_multiplier += 0.14285714285714285;
        }
    }
    else
    {
        current_spd = move_spd;
        current_image_speed = 1;
        multipliertimer = -1;
        multipler_multiplier = 1;
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
        {
            while (!place_meeting(x + sign(xspd), y, oWall))
                x += sign(xspd);
            
            xspd = 0;
        }
        
        if (place_meeting(x, y + yspd, oWall))
        {
            while (!place_meeting(x, y + sign(yspd), oWall))
                y += sign(yspd);
            
            yspd = 0;
        }
    }
    
    if (instance_exists(obj_ch3_egg))
    {
        if (place_meeting(x + xspd, y, obj_ch3_egg))
        {
            while (!place_meeting(x + sign(xspd), y, obj_ch3_egg))
                x += sign(xspd);
            
            xspd = 0;
        }
        
        if (place_meeting(x, y + yspd, obj_ch3_egg))
        {
            while (!place_meeting(x, y + sign(yspd), obj_ch3_egg))
                y += sign(yspd);
            
            yspd = 0;
        }
    }
    
    if (instance_exists(obj_rubble_tower))
    {
        if (place_meeting(x + xspd, y, obj_rubble_tower))
        {
            while (!place_meeting(x + sign(xspd), y, obj_rubble_tower))
                x += sign(xspd);
            
            xspd = 0;
        }
        
        if (place_meeting(x, y + yspd, obj_rubble_tower))
        {
            while (!place_meeting(x, y + sign(yspd), obj_rubble_tower))
                y += sign(yspd);
            
            yspd = 0;
        }
    }
    
    if (instance_exists(oRoomChange))
    {
        if (place_meeting(x + xspd, y, oRoomChange))
        {
            while (!place_meeting(x + sign(xspd), y, oRoomChange))
                x += sign(xspd);
            
            xspd = 0;
        }
        
        if (place_meeting(x, y + yspd, oRoomChange))
        {
            while (!place_meeting(x, y + sign(yspd), oRoomChange))
                y += sign(yspd);
            
            yspd = 0;
        }
    }
    
    x += xspd;
    y += yspd;
    x = round(x);
    y = round(y);
    depth = -y + (follow_order * 2);
    
    if (up_key && !(left_key || right_key))
    {
        sprite_index = sKrisWalkUp;
        
        if (left_key || right_key)
            sprite_index = sKrisWalkUp;
    }
    else if (down_key && !(left_key || right_key))
    {
        sprite_index = sKrisWalkDown;
        
        if (left_key || right_key)
            sprite_index = sKrisWalkDown;
    }
    else if (left_key && !(up_key || down_key))
    {
        sprite_index = sKrisWalkLeft;
        
        if (up_key || down_key)
            sprite_index = sKrisWalkLeft;
    }
    else if (right_key && !(up_key || down_key))
    {
        sprite_index = sKrisWalkRight;
        
        if (up_key || down_key)
            sprite_index = sKrisWalkRight;
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

if (room == rm_ch3_cathodetower_final)
{
    if (x >= 320)
    {
        texttimer++;
        
        if (texttimer == 0)
        {
            global.playermove = false;
            image_speed = 0;
            image_index = 0;
            sprite_index = sKrisWalkRight;
            instance_create_depth(x, y, depth - 15, obj_tower_text);
        }
    }
}

if (room == rm_ch3_planegate)
{
    if (x >= 990 && y <= 206)
    {
        if (!texttriggered)
        {
            instance_create_depth(x, y, depth - 10, obj_planegate_text);
            global.playermove = false;
            image_index = 0;
            image_speed = 0;
            sprite_index = sKrisWalkUp;
            obj_susie_c3.image_index = 0;
            obj_susie_c3.image_speed = 1;
            obj_susie_c3.depth = -obj_susie_c3.y + (obj_susie_c3.follow_order * 2);
            obj_ralsei_c3.image_index = 0;
            obj_ralsei_c3.image_speed = 1;
            obj_ralsei_c3.depth = -obj_ralsei_c3.y + (obj_ralsei_c3.follow_order * 2);
            texttriggered = true;
        }
    }
}

if (room == rm_ch3_kreidfight)
{
    if (instance_exists(obj_battle_kf))
    {
        if (global.krishp < 0)
        {
            image_speed = 0;
            exit;
        }
    }
    
    if (fall)
    {
        if (percent1 <= 1)
        {
            percent1 += (1/15);
            var position1 = animcurve_channel_evaluate(curvelinear, percent1);
            var delta_x = (cx + 250) - (cx + 660);
            var delta_y = (cy + 320) - (cy + 240);
            x = cx + 660 + (delta_x * position1);
            y = cy + 240 + (delta_y * position1);
        }
        
        if (percent1 >= 1 && percent2 < 2)
        {
            if (percent2 <= 0.3)
                image_index = 0;
            else
                image_index = 1;
            
            percent2 += 0.05;
            var position1 = animcurve_channel_evaluate(curveslower, percent2);
            var delta_x = (cx + 100) - (cx + 250);
            var delta_y = (cy + 310) - (cy + 300);
            x = cx + 250 + (delta_x * position1);
            y = cy + 300 + (delta_y * position1);
        }
        
        if (percent2 == 0.05)
        {
            sprite_index = sKrisLand;
            image_speed = 0;
            audio_play_sound(snd_impact, 1, false);
        }
        
        if (percent2 == 2)
            obj_kreid_c3.fall = true;
    }
}

if (room == rm_ch3_kreidfight || room == rm_ch3_kreidfight_skip)
{
    if (instance_exists(obj_battle_kf) || global.endofbattle)
    {
        x = cx + 120 + xoffset + xfinaloffset;
        y = cy + 218 + yoffset;
    }
}

if (room == rm_ch3_kreidfight || room == rm_ch3_kreidfight_skip)
{
    if (obj_kris_c3.battlestart)
    {
        percent3 += 0.1;
        
        if (percent3 == 0.1)
        {
            audio_sound_gain(mus_wind, 0, 0);
            obj_kreid_c3.battlestart = true;
            obj_kreid_c3.depth = 96;
            depth = 98;
            sprite_index = spr_kris_flyup;
            image_index = 1;
        }
        
        if (percent3 <= 1)
            instance_create_depth(x, y, depth + 1, obj_kris_echo);
        
        var position1 = animcurve_channel_evaluate(curvelinear, percent3);
        var delta_x = (cx + 120) - (cx + 100);
        var delta_y = (cy + 218) - (cy + 310);
        var delta_y_plane = (cy + 150) - (cy + 240);
        x = cx + 100 + (delta_x * position1);
        y = cy + 310 + (delta_y * position1);
        obj_plane_kf.y = cy + 240 + (delta_y_plane * position1);
        
        if (percent3 == 1)
        {
            sprite_index = spr_kris_fight;
            audio_play_sound(snd_weaponpull_fast, 1, false);
        }
        
        if (percent3 == 2.8)
        {
            image_speed = 1;
            global.battle = true;
            battlestart = false;
            sprite_index = spr_kris_idle;
            obj_kreid_c3.battlestart = false;
            obj_kreid_c3.image_speed = 1;
            audio_play_sound(mus_kreidfight, 10, true, 0.7);
            audio_sound_gain(mus_kreidfight, 1, 0);
            audio_sound_pitch(mus_kreidfight, 1);
            instance_create_depth(cx + 320, cy + 240, depth - 6, obj_battle_kf);
            instance_create_depth(cx + 320, cy + 240, -67, obj_tpbar);
            window_set_caption(get_lang_string("obj_kris_c3_Step_0_0"));
        }
    }
}

if (room == rm_ch3_fountain)
{
    hue += 0.25;
    hue %= 255;
    
    if (hue >= 255)
        hue = 0;
    
    flashcolor = make_color_hsv(hue, 255, 255);
    percent1 += 0.004629629629629629;
    
    if (percent1 < 1)
    {
        sprite_index = sKrisWalkUp;
        image_speed = 0.5;
        var position1 = animcurve_channel_evaluate(curvelinear, percent1);
        var delta_y = (cy + 334) - (cy + 550);
        y = cy + 550 + (delta_y * position1);
    }
    else if (percent1 == 1)
    {
        y = cy + 334;
        image_index = 0;
        image_speed = 0;
    }
}
