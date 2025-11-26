timer++;
var left = keyboard_check_pressed(vk_left);
var right = keyboard_check_pressed(vk_right);
var down = keyboard_check_pressed(vk_down);
var up = keyboard_check_pressed(vk_up);

if (global.accessible)
{
    if (options == 0)
    {
        if (left)
            options = 1;
        
        if (right)
            options = 2;
        
        if (down)
            options = 3;
    }
    
    if (options == 1)
    {
        percentup = 0;
        percentdown = 0;
        percentright = 0;
        percentleft += (1/15);
        var position1 = animcurve_channel_evaluate(curve, percentleft);
        var _start1 = x;
        var _end1 = 162;
        var _distance1 = _end1 - _start1;
        x = _start1 + (_distance1 * position1);
        var _start2 = y;
        var _end2 = 190;
        var _distance2 = _end2 - _start2;
        y = _start2 + (_distance2 * position1);
        
        if (right)
            options = 2;
        else if (down)
            options = 3;
        else if (up)
            options = 0;
    }
    
    if (options == 2)
    {
        percentup = 0;
        percentdown = 0;
        percentleft = 0;
        percentright += (1/15);
        var position1 = animcurve_channel_evaluate(curve, percentright);
        var _start1 = x;
        var _end1 = 478;
        var _distance1 = _end1 - _start1;
        x = _start1 + (_distance1 * position1);
        var _start2 = y;
        var _end2 = 190;
        var _distance2 = _end2 - _start2;
        y = _start2 + (_distance2 * position1);
        
        if (left)
            options = 1;
        else if (down)
            options = 3;
        else if (up)
            options = 0;
    }
}

if (options == 3)
{
    percentup = 0;
    percentleft = 0;
    percentright = 0;
    percentdown += (1/15);
    var position1 = animcurve_channel_evaluate(curve, percentdown);
    var _start1 = x;
    var _end1 = 320;
    var _distance1 = _end1 - _start1;
    x = _start1 + (_distance1 * position1);
    var _start2 = y;
    var _end2 = 340;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position1);
    
    if (left)
        options = 1;
    else if (right)
        options = 2;
    else if (up)
        options = 0;
}

if (options == 0)
{
    percentdown = 0;
    percentleft = 0;
    percentright = 0;
    percentup += (1/15);
    var position1 = animcurve_channel_evaluate(curve, percentup);
    var _start1 = x;
    var _end1 = 320;
    var _distance1 = _end1 - _start1;
    x = _start1 + (_distance1 * position1);
    var _start2 = y;
    var _end2 = 190;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position1);
    
    if (left)
        options = 1;
    else if (right)
        options = 2;
    else if (down)
        options = 3;
}
