if (global.playermove)
{
    var player_is_moving = oKrisPlayerC3.xspd != 0 || oKrisPlayerC3.yspd != 0;
    
    if (player_is_moving)
    {
        if (!first_movement_triggered)
        {
            first_movement_triggered = true;
            target_position = [oSusieC3.x, oSusieC3.y];
            interpolation_counter = delay_frames;
        }
        
        array_push(delayed_positions, [oSusieC3.x, oSusieC3.y]);
        array_push(delayed_sprites, oSusieC3.sprite_index);
        var delayed_pos = array_shift(delayed_positions);
        var delayed_sprite = array_shift(delayed_sprites);
        
        if (interpolation_counter > 0)
        {
            x = lerp(x, delayed_pos[0], 1 / interpolation_counter);
            y = lerp(y, delayed_pos[1], 1 / interpolation_counter);
            interpolation_counter -= 1;
        }
        else
        {
            x = delayed_pos[0];
            y = delayed_pos[1];
        }
        
        switch (delayed_sprite)
        {
            case sSusieWalkLeft:
                sprite_index = sRalseiWalkLeft;
                break;
            case sSusieWalkRight:
                sprite_index = sRalseiWalkRight;
                break;
            case sSusieWalkUp:
                sprite_index = sRalseiWalkUp;
                break;
            case sSusieWalkDown:
                sprite_index = sRalseiWalkDown;
                break;
            default:
                break;
        }
        
        image_speed = oSusieC3.image_speed;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
    
    if (y > oKrisPlayerC3.y && y > oSusieC3.y)
        depth = oKrisPlayerC3.depth - 3;
    else if (y > oKrisPlayerC3.y && y < oSusieC3.y)
        depth = oSusieC3.depth + 1;
    else if (y < oKrisPlayerC3.y && y > oSusieC3.y)
        depth = oSusieC3.depth - 1;
    else if (y < oKrisPlayerC3.y && y < oSusieC3.y)
        depth = oSusieC3.depth + 2;
    else if (y == oKrisPlayerC3.y && y == oSusieC3.y)
        depth = oSusieC3.depth + 3;
}

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (room == rChapter3Room6)
{
    if (global.dialogue == 36)
    {
        sprite_index = sRalseiWalkUp;
        depth = oSusieC3.depth - 3;
        percent1 += 0.08333333333333333;
        position1 = animcurve_channel_evaluate(curve1, percent1);
        var _start1 = 432;
        var _end1 = 320;
        var _distance1 = _end1 - _start1;
        x = _start1 + (_distance1 * position1);
        
        if (percent1 < 1)
            image_index = 0;
        
        percent2 += 0.08333333333333333;
        position2 = animcurve_channel_evaluate(curve2, percent2);
        var _start2 = 268;
        var _end2 = 254;
        var _distance2 = _end2 - _start2;
        y = _start2 + (_distance2 * position2);
    }
}

if (room == rChapter3Room5)
{
    if (instance_exists(oShadowmanIdle1))
        depth = oShadowmanIdle3.depth - 1;
    
    if (global.dialogue == 20)
    {
        dialogue20timer++;
        
        if (dialogue20timer <= 27)
        {
            percent1 += 0.037037037037037035;
            position = animcurve_channel_evaluate(curve1, percent1);
            var _start = cam_x - 21.8;
            var _end = cam_x + 263;
            var _distance = _end - _start;
            x = _start + (_distance * position);
        }
        
        if (dialogue20timer > 27 && dialogue20timer <= 34)
        {
            sprite_index = sRalseiWalkUp;
            percent2 += 0.14285714285714285;
            position2 = animcurve_channel_evaluate(curve2, percent2);
            var _start2 = cam_y + 310;
            var _end2 = cam_y + 258;
            var _distance2 = _end2 - _start2;
            y = _start2 + (_distance2 * position2);
        }
        
        if (dialogue20timer == 35)
        {
            image_speed = 0;
            image_index = 0;
            sprite_index = sRalseiWalkRight;
            oKrisPlayerC3.sprite_index = sKrisWalkLeft;
        }
        
        if (dialogue20timer == 65)
        {
            global.dialogue = 21;
            global.charactertalking = true;
            instance_create_depth(320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(112, cam_y + 401, -41, oDialogueSprite);
            oDialogueSprite.sprite_index = sRalseiDialogueSprite;
            oDialogueSprite.image_index = 26;
            instance_create_depth(320, cam_y - 270, -50, oTextC3R5);
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
        var _start = cam_y + 680;
        var _end = cam_y + 400;
        var _distance = _end - _start;
        y = _start + (_distance * position);
    }
    
    if (timer > 122 && timer <= 146)
    {
        percent3 += (1/15);
        position3 = animcurve_channel_evaluate(curve3, percent3);
        var _start3 = cam_x + 320;
        var _end3 = cam_x + 378;
        var _distance3 = _end3 - _start3;
        x = _start3 + (_distance3 * position3);
    }
    
    if (timer > 98 && timer <= 146)
    {
        percent4 += 0.020833333333333332;
        position4 = animcurve_channel_evaluate(curve4, percent4);
        var _start4 = cam_y + 400;
        var _end4 = cam_y + 240;
        var _distance4 = _end4 - _start4;
        y = _start4 + (_distance4 * position4);
    }
    
    if (timer > 177 && timer <= 212)
    {
        percent2 += 0.02857142857142857;
        position2 = animcurve_channel_evaluate(curve2, percent2);
        var _start2 = cam_y + 240;
        var _end2 = cam_y + 271;
        var _distance2 = _end2 - _start2;
        y = _start2 + (_distance2 * position2);
    }
    
    if (timer < 146)
        oRalseiC3.depth = oKrisPlayerC3.depth - 1;
    
    if (timer == 146)
    {
        image_speed = 0;
        image_index = 0;
    }
    
    oRalseiShadow.y = y + 72;
}

if (room == rChapter3KreidRoom)
{
    falltimer++;
    
    if (falltimer > 30)
    {
        percentfall += 0.0625;
        var positionf1 = animcurve_channel_evaluate(curvefall, percentfall);
        var _startf1 = 80;
        var _endf1 = 90;
        var _distancef1 = _endf1 - _startf1;
        
        if (percentfall < 2)
            x = _startf1 + (_distancef1 * positionf1);
        
        var positionf2 = animcurve_channel_evaluate(curvefall, percentfall);
        var _startf2 = -40;
        var _endf2 = 168;
        var _distancef2 = _endf2 - _startf2;
        
        if (percentfall < 2)
            y = _startf2 + (_distancef2 * positionf2);
        
        if (percentfall == 1)
        {
            audio_play_sound(snd_impact, 1, false, 0.5);
            sprite_index = spr_ralseiland;
            image_index = 0;
            image_speed = 0;
        }
        
        if (percentfall == 1.3125)
            image_index = 1;
        
        if (percentfall == 4.75)
        {
            sprite_index = sRalseiWalkRight;
            image_index = 0;
        }
    }
    
    if (oKrisPlayerC3.kreidbegin)
    {
        timer1++;
        
        if (timer1 == 1)
            sprite_index = sRalseiWalkRight;
        
        if (timer1 <= 60)
        {
            percent1 += 0.016666666666666666;
            position = animcurve_channel_evaluate(curve1, percent1);
            var _start = x;
            var _end = 2352;
            var _distance = _end - _start;
            x = _start + (_distance * position);
        }
        
        if (timer1 == 15)
        {
            image_index = 0;
            image_speed = 0;
        }
    }
    
    if (global.dialogue == 35 && obj_sewercover1.shocktrigger)
    {
        sprite_index = sRalseiShockedFront2;
        percent3 += 0.08333333333333333;
        position3 = animcurve_channel_evaluate(curve3, percent3);
        var _start3 = 2485;
        var _end3 = 2481;
        var _distance3 = _end3 - _start3;
        x = _start3 + (_distance3 * position3);
    }
    
    if (global.dialogue == 44 || global.dialogue == 45)
    {
        if (instance_exists(obj_shadowmankr1))
            depth = obj_shadowmankr1.depth - 1;
    }
}
