if (global.playermove)
{
    var player_is_moving = oKrisPlayerC3.xspd != 0 || oKrisPlayerC3.yspd != 0;
    
    if (player_is_moving)
    {
        array_push(delayed_positions, [oKrisPlayerC3.x, oKrisPlayerC3.y]);
        array_push(delayed_sprites, oKrisPlayerC3.sprite_index);
        var delayed_pos = array_shift(delayed_positions);
        var delayed_sprite = array_shift(delayed_sprites);
        x = delayed_pos[0];
        y = delayed_pos[1];
        
        switch (delayed_sprite)
        {
            case sKrisWalkLeft:
                sprite_index = sSusieWalkLeft;
                break;
            case sKrisWalkRight:
                sprite_index = sSusieWalkRight;
                break;
            case sKrisWalkUp:
                sprite_index = sSusieWalkUp;
                break;
            case sKrisWalkDown:
                sprite_index = sSusieWalkDown;
                break;
            default:
                break;
        }
        
        image_speed = oKrisPlayerC3.image_speed;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
}

if (y <= oKrisPlayerC3.y)
    depth = oKrisPlayerC3.depth + 1;
else
    depth = oKrisPlayerC3.depth - 1;

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (global.dialogue == 2)
    dialogue2timer++;

if (sprite_index == sSusieLand && image_index == 1)
    image_speed = 0;

if (dialogue2timer == 65)
    y -= 25;

if (dialogue2timer >= 65 && dialogue2timer <= 79)
{
    percent1 += 0.08333333333333333;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = cam_x + 320;
    var _end = cam_x + 316;
    var _distance = _end - _start;
    x = _start + (_distance * position);
}

if (dialogue2timer >= 80 && dialogue2timer <= 95)
{
    percent2 += 0.08333333333333333;
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = cam_x + 320;
    var _end2 = cam_x + 316;
    var _distance2 = _end2 - _start2;
    x = _start2 + (_distance2 * position2);
}

if (dialogue2timer == 95)
{
    percent1 = 0;
    percent2 = 0;
}

if (global.dialogue == 3)
    x = 320;

if (global.dialogue == 9)
{
    oSusieC3.sprite_index = sSusieWTF;
    percent3 += 0.08333333333333333;
    position3 = animcurve_channel_evaluate(curve3, percent3);
    var _start3 = cam_x + 320;
    var _end3 = cam_x + 316;
    var _distance3 = _end3 - _start3;
    x = _start3 + (_distance3 * position3);
}

if (global.dialogue == 10)
{
    x = 320;
    percent3 = 0;
}

if (global.dialogue == 12)
{
    dialogue12timer++;
    
    if (dialogue12timer <= 12)
    {
        oSusieC3.image_speed = 1;
        oSusieC3.sprite_index = sSusieWalkRight;
        percent4 += (1/15);
        position4 = animcurve_channel_evaluate(curve4, percent4);
        var _start4 = cam_x + 320;
        var _end4 = cam_x + 380;
        var _distance4 = _end4 - _start4;
        x = _start4 + (_distance4 * position4);
    }
    
    if (dialogue12timer > 12 && dialogue12timer <= 42)
    {
        oSusieC3.image_speed = 1;
        oSusieC3.sprite_index = sSusieWalkUp;
        percent5 += (1/30);
        position5 = animcurve_channel_evaluate(curve5, percent5);
        var _start5 = cam_y + 354;
        var _end5 = cam_y + 240;
        var _distance5 = _end5 - _start5;
        y = _start5 + (_distance5 * position5);
    }
    
    if (y == 240)
    {
        oSusieC3.image_speed = 0;
        oSusieC3.image_index = 0;
    }
}
