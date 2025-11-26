var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (global.alldown)
    exit;

if (purple)
{
    if (!initialization && !ending)
        image_blend = purplecolor;
    else
        image_blend = c_red;
}
else
{
    image_blend = c_red;
}

if (initialization)
{
    image_alpha += (1/3);
    percentinitialx += 0.14285714285714285;
    var position1 = animcurve_channel_evaluate(curvelinear, percentinitialx);
    var _start1 = xx;
    var _end1 = cam_x + 320;
    var _distance1 = _end1 - _start1;
    x = _start1 + (_distance1 * position1);
    percentinitialy += 0.14285714285714285;
    var position2 = animcurve_channel_evaluate(curvelinear, percentinitialy);
    var _start2 = yy;
    var _end2 = cam_y + 170;
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
    {
        instance_destroy(obj_SOUL_TP);
        instance_destroy(obj_fedorabat);
    }
    
    var position1 = animcurve_channel_evaluate(curvelinear, percentendingx);
    var _start1 = xx;
    var _end1 = obj_kris_c3.x - 12;
    var _distance1 = _end1 - _start1;
    x = _start1 + (_distance1 * position1);
    percentendingy += 0.125;
    var position2 = animcurve_channel_evaluate(curvelinear, percentendingy);
    var _start2 = yy;
    var _end2 = obj_kris_c3.y + 12;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position2);
    
    if (percentendingx == 1.125)
    {
        image_alpha = 0;
        moving = false;
        ending = false;
        global.turn++;
        global.enemyturn = false;
        
        if (global.krishp > 0)
            obj_battle_kf.turnrefresh = true;
        
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
        hurtchoice = irandom_range(1, 1);
        hurting = true;
    }
    
    if (hurting)
    {
        if (hurtchoice == 1)
        {
            if (!enginetarget.krisdefend)
                obj_kris_c3.sprite_index = spr_kris_hurt;
        }
    }
}

if (hurttimer == 40)
{
    hurt = false;
    hurting = false;
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
            if (keyboard_check_pressed(vk_left))
            {
                if (stringoption > 0 && (string0percent >= 1 || string1percent >= 1 || string2percent >= 1))
                    stringoption -= 1;
            }
            
            if (keyboard_check_pressed(vk_right))
            {
                if (stringoption < 2 && (string0percent >= 1 || string1percent >= 1 || string2percent >= 1))
                    stringoption += 1;
            }
            
            if (stringoption == 0)
            {
                string0percent += 0.25;
                string1percent = 0;
                string2percent = 0;
                
                if (string0percent == 0.25)
                {
                    string_start_x = x;
                    string_target_x = cam_x + 285 + leftrightoffset;
                }
                
                var positions0 = animcurve_channel_evaluate(curveslower, string0percent);
                x = lerp(string_start_x, string_target_x, positions0);
            }
            
            if (stringoption == 1)
            {
                string1percent += 0.25;
                string0percent = 0;
                string2percent = 0;
                
                if (string1percent == 0.25)
                {
                    string_start_x = x;
                    string_target_x = cam_x + 320 + leftrightoffset;
                }
                
                var positions0 = animcurve_channel_evaluate(curveslower, string1percent);
                x = lerp(string_start_x, string_target_x, positions0);
            }
            
            if (stringoption == 2)
            {
                string2percent += 0.25;
                string0percent = 0;
                string1percent = 0;
                
                if (string2percent == 0.25)
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
            if (keyboard_check_pressed(vk_up))
            {
                if (stringoption > 0 && (string0percent >= 1 || string1percent >= 1 || string2percent >= 1))
                    stringoption -= 1;
            }
            
            if (keyboard_check_pressed(vk_down))
            {
                if (stringoption < 2 && (string0percent >= 1 || string1percent >= 1 || string2percent >= 1))
                    stringoption += 1;
            }
            
            if (stringoption == 0)
            {
                string0percent += 0.25;
                string1percent = 0;
                string2percent = 0;
                
                if (string0percent == 0.25)
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
                string1percent += 0.25;
                string0percent = 0;
                string2percent = 0;
                
                if (string1percent == 0.25)
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
                string2percent += 0.25;
                string0percent = 0;
                string1percent = 0;
                
                if (string2percent == 0.25)
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
