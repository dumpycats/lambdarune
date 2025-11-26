if (global.alldown)
{
    image_speed = 0;
    gameovertimer++;
    
    if (gameovertimer == 0)
    {
        audio_stop_sound(snd_scytheburst);
        audio_stop_sound(snd_scytheburst_bc);
        audio_stop_sound(snd_heartshot_dr_b);
    }
    
    if (gameovertimer == 30)
        room_goto(rm_gameover_c3);
    
    if (!instance_exists(obj_battlecheck))
        instance_create_depth(x, y, depth, obj_battlecheck);
    
    obj_battlecheck.x = x;
    obj_battlecheck.y = y;
    obj_battlecheck.target = rm_ch3_maximike_skip;
    obj_battlecheck.gameoverdialogue = 1;
    exit;
}

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
inputtimer++;
var advance_pressed;

if (inputtimer >= 0)
    advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
else
    advance_pressed = 0;

if (yellow)
{
    if (!initialization && !ending)
    {
        image_blend = yellowcolor;
        
        if (special)
            image_angle = specialangle;
        else if (down)
            image_angle = 0;
        else if (up)
            image_angle = 180;
        else
            image_angle = 90;
        
        if (advance_pressed)
        {
            if (image_angle == 0 || image_angle == 360 || image_angle == -360)
            {
                var h1 = instance_create_depth(x, y + 8, depth - 10, obj_SOUL_bullet);
                h1.direction = -90;
                h1.image_angle = -90;
                audio_play_sound(snd_heartshot_dr_b, 1, false);
            }
            else if (image_angle == 180 || image_angle == 540 || image_angle == -180)
            {
                var h1 = instance_create_depth(x, y - 8, depth - 10, obj_SOUL_bullet);
                h1.direction = 90;
                h1.image_angle = 90;
                audio_play_sound(snd_heartshot_dr_b, 1, false);
            }
            else if (image_angle == 90 || image_angle == 450 || image_angle == -270)
            {
                instance_create_depth(x + 8, y, depth - 10, obj_SOUL_bullet);
                audio_play_sound(snd_heartshot_dr_b, 1, false);
            }
            else if (image_angle == 270 || image_angle == 630 || image_angle == -90)
            {
                var h1 = instance_create_depth(x - 8, y, depth - 10, obj_SOUL_bullet);
                h1.direction = 180;
                h1.image_angle = 180;
                audio_play_sound(snd_heartshot_dr_b, 1, false);
            }
            
            inputtimer = -3;
        }
    }
    else
    {
        image_blend = c_red;
        image_angle = 0;
    }
}
else if (purple)
{
    if (!initialization && !ending)
    {
        image_blend = purplecolor;
        image_angle = 0;
    }
    else
    {
        image_blend = c_red;
    }
}
else
{
    image_blend = c_red;
    image_angle = 0;
}

if (initialization)
{
    image_alpha += 0.33334;
    percentinitialx += 0.14285714285714285;
    var position1 = animcurve_channel_evaluate(curvelinear, percentinitialx);
    var _start1 = xx;
    var _end1 = cam_x + 320;
    var _distance1 = _end1 - _start1;
    x = _start1 + (_distance1 * position1);
    percentinitialy += 0.14285714285714285;
    var position2 = animcurve_channel_evaluate(curvelinear, percentinitialy);
    var _start2 = yy;
    var _end2 = cam_y + 170 + global.topoffset;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position2);
    
    if (percentinitialx == 1 && percentinitialy == 1)
    {
        image_alpha = 1;
        moving = true;
        initialization = false;
    }
}

if (!initialization && !ending)
{
    xx = x;
    yy = y;
}

if (ending)
{
    moving = false;
    hurt = false;
    global.xoffset = 0;
    global.yoffset = 0;
    percentendingx += 0.125;
    
    if (percentendingx == 0.125)
        instance_destroy(obj_SOUL_TP_sio);
    
    var position1 = animcurve_channel_evaluate(curvelinear, percentendingx);
    var _start1 = xx;
    var _end1 = KRIS.x - 12;
    var _distance1 = _end1 - _start1;
    x = _start1 + (_distance1 * position1);
    percentendingy += 0.125;
    var position2 = animcurve_channel_evaluate(curvelinear, percentendingy);
    var _start2 = yy;
    var _end2 = KRIS.y + 12;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position2);
    
    if (percentendingx == 1.125)
    {
        image_alpha = 0;
        moving = false;
        ending = false;
        
        if (!ENGINETARGET.jammed)
            global.turn++;
        
        global.enemyturn = false;
        
        if (!global.alldown)
            ENGINETARGET.turnrefresh = true;
        
        instance_destroy();
    }
}

if (keyboard_check_pressed(vk_backspace))
{
}

if (hurt)
{
    nohit = false;
    hurttimer++;
    image_speed = 1;
    
    if (hurttimer == 0)
    {
        if (downupdate)
        {
            valid_targets = [];
            
            if (!ENGINETARGET.krisdown)
                array_push(valid_targets, 1);
            
            if (!ENGINETARGET.susiedown)
                array_push(valid_targets, 2);
            
            if (!ENGINETARGET.ralseidown)
                array_push(valid_targets, 3);
            
            if (array_length(valid_targets) > 0)
                hurtchoice = valid_targets[irandom(array_length(valid_targets) - 1)];
            else
                hurtchoice = 1;
            
            downupdate = false;
        }
    }
    
    if (hurttimer == 1)
        hurting = true;
    
    if (hurting)
    {
        if (hurtchoice == 1)
        {
            if (!ENGINETARGET.krisdefend && !ENGINETARGET.krisdown)
                KRIS.sprite_index = spr_kris_hurt;
            else if (ENGINETARGET.krisdown)
                KRIS.sprite_index = spr_kris_downed;
        }
        else if (hurtchoice == 2)
        {
            if (!ENGINETARGET.susiedefend && !ENGINETARGET.susiedown)
                SUSIE.sprite_index = spr_susie_hurt;
            else if (ENGINETARGET.susiedown)
                SUSIE.sprite_index = spr_susie_downed;
        }
        else if (hurtchoice == 3)
        {
            if (!ENGINETARGET.ralseidefend && !ENGINETARGET.ralseidown)
                RALSEI.sprite_index = spr_ralsei_hurt;
            else if (ENGINETARGET.ralseidown)
                RALSEI.sprite_index = spr_ralsei_downed;
        }
    }
}

if (hurttimer == 17)
    hurting = false;

if (hurttimer == 40)
{
    hurt = false;
    hurttimer = -1;
    image_speed = 0;
    image_index = 0;
}

if (moving)
{
    right_key = keyboard_check(vk_right);
    left_key = keyboard_check(vk_left);
    up_key = keyboard_check(vk_up);
    down_key = keyboard_check(vk_down);
    shift_key = keyboard_check(vk_shift);
    x_key = keyboard_check(ord("X"));
    
    if (shift_key || x_key)
        current_spd = move_spd * boost_multiplier;
    else
        current_spd = move_spd;
    
    xspd = 0;
    yspd = 0;
    
    if ((purple && xstrings) || !purple)
    {
        if (right_key)
            xspd += current_spd;
        
        if (left_key && !right_key)
            xspd -= current_spd;
    }
    
    if ((purple && ystrings) || !purple)
    {
        if (up_key)
            yspd -= current_spd;
        
        if (down_key)
            yspd += current_spd;
    }
    
    var leftrightoffset;
    
    if (!(global.leftoffset == 0))
        leftrightoffset = lerp(global.leftoffset, global.rightoffset, 0.5);
    else
        leftrightoffset = 0;
    
    var topbottomoffset;
    
    if (!(global.topoffset == 0))
        topbottomoffset = lerp(global.topoffset, global.bottomoffset, 0.5);
    else
        topbottomoffset = 0;
    
    if (purple)
    {
        if (ystrings)
        {
            if (keyboard_check(vk_left))
            {
                if (stringoption > 0 && (string0percent >= 1 || string1percent >= 1 || string2percent >= 1))
                    stringoption -= 1;
            }
            
            if (keyboard_check(vk_right))
            {
                if (stringoption < 2 && (string0percent >= 1 || string1percent >= 1 || string2percent >= 1))
                    stringoption += 1;
            }
            
            if (stringoption == 0)
            {
                string0percent += 0.16666666666666666;
                string1percent = 0;
                string2percent = 0;
                
                if (string0percent == 0.16666666666666666)
                {
                    string_start_x = x;
                    string_target_x = cam_x + 285 + leftrightoffset;
                }
                
                var positions0 = animcurve_channel_evaluate(curveslower, string0percent);
                x = lerp(string_start_x, string_target_x, positions0);
            }
            
            if (stringoption == 1)
            {
                string1percent += 0.16666666666666666;
                string0percent = 0;
                string2percent = 0;
                
                if (string1percent == 0.16666666666666666)
                {
                    string_start_x = x;
                    string_target_x = cam_x + 320 + leftrightoffset;
                }
                
                var positions0 = animcurve_channel_evaluate(curveslower, string1percent);
                x = lerp(string_start_x, string_target_x, positions0);
            }
            
            if (stringoption == 2)
            {
                string2percent += 0.16666666666666666;
                string0percent = 0;
                string1percent = 0;
                
                if (string2percent == 0.16666666666666666)
                {
                    string_start_x = x;
                    string_target_x = cam_x + 355 + leftrightoffset;
                }
                
                var positions0 = animcurve_channel_evaluate(curveslower, string2percent);
                x = lerp(string_start_x, string_target_x, positions0);
            }
        }
        
        if (xstrings)
        {
            if (keyboard_check(vk_up))
            {
                if (stringoption > 0 && (string0percent >= 1 || string1percent >= 1 || string2percent >= 1))
                    stringoption -= 1;
            }
            
            if (keyboard_check(vk_down))
            {
                if (stringoption < 2 && (string0percent >= 1 || string1percent >= 1 || string2percent >= 1))
                    stringoption += 1;
            }
            
            if (stringoption == 0)
            {
                string0percent += 0.16666666666666666;
                string1percent = 0;
                string2percent = 0;
                
                if (string0percent == 0.16666666666666666)
                {
                    string_start_y = y + topbottomoffset;
                    string_target_y = cam_y + 132 + topbottomoffset;
                }
                
                var positions0 = animcurve_channel_evaluate(curveslower, string0percent);
                
                if (string0percent < 1)
                    y = lerp(string_start_y, string_target_y, positions0);
                else
                    y = cam_y + 132 + topbottomoffset;
            }
            
            if (stringoption == 1)
            {
                string1percent += 0.16666666666666666;
                string0percent = 0;
                string2percent = 0;
                
                if (string1percent == 0.16666666666666666)
                {
                    string_start_y = y + topbottomoffset;
                    string_target_y = cam_y + 170 + topbottomoffset;
                }
                
                var positions0 = animcurve_channel_evaluate(curveslower, string1percent);
                
                if (string1percent < 1)
                    y = lerp(string_start_y, string_target_y, positions0);
                else
                    y = cam_y + 170 + topbottomoffset;
            }
            
            if (stringoption == 2)
            {
                string2percent += 0.16666666666666666;
                string0percent = 0;
                string1percent = 0;
                
                if (string2percent == 0.16666666666666666)
                {
                    string_start_y = y + topbottomoffset;
                    string_target_y = cam_y + 208 + topbottomoffset;
                }
                
                var positions0 = animcurve_channel_evaluate(curveslower, string2percent);
                
                if (string2percent < 1)
                    y = lerp(string_start_y, string_target_y, positions0);
                else
                    y = cam_y + 208 + topbottomoffset;
            }
        }
    }
    
    x += xspd;
    y += yspd;
    x = clamp(x, cam_x + 257 + global.leftoffset, cam_x + 383 + global.rightoffset);
    y = clamp(y, cam_y + 106 + global.topoffset, cam_y + 234 + global.bottomoffset);
}
