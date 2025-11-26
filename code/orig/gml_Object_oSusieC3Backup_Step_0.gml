if (global.playermove)
{
    var player_is_moving = oKrisPlayerC3.xspd != 0 || oKrisPlayerC3.yspd != 0;
    
    if (player_is_moving)
    {
        if (!first_movement_triggered)
        {
            first_movement_triggered = true;
            target_position = [oKrisPlayerC3.x, oKrisPlayerC3.y];
            interpolation_counter = 12;
        }
        
        array_push(delayed_positions, [oKrisPlayerC3.x, oKrisPlayerC3.y]);
        array_push(delayed_sprites, oKrisPlayerC3.sprite_index);
        var delayed_pos = array_shift(delayed_positions);
        var delayed_sprite = array_shift(delayed_sprites);
        
        if (interpolation_counter > 0 && !(room == rChapter3Room2))
        {
            x = lerp(x, delayed_pos[0], 1 / interpolation_counter);
            y = lerp(y, delayed_pos[1], 1 / interpolation_counter);
            interpolation_counter -= 1;
        }
        else if (interpolation_counter > 0 && room == rChapter3Room2)
        {
            x = lerp(x, delayed_pos[0], 1 / interpolation_counter);
            y = lerp(y, delayed_pos[1] + 105, 1 / interpolation_counter);
            interpolation_counter -= 1;
        }
        else
        {
            x = delayed_pos[0];
            y = delayed_pos[1];
        }
        
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

if (room == rChapter3Room1)
{
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
    
    if (global.geartime == true)
    {
        geartimer++;
        image_index = 0;
        image_speed = 0;
    }
    
    if (global.geartime && geartimer <= 15)
    {
        percent6 += 0.1;
        position6 = animcurve_channel_evaluate(curve6, percent6);
        var _start6 = y;
        var _end6 = oLift.y - 60;
        var _distance6 = _end6 - _start6;
        y = _start6 + (_distance6 * position6);
    }
}

if (room == rChapter3Room5)
{
    timer++;
    
    if (timer > 12 && timer < 57)
    {
        x += 8;
        image_speed = 2;
    }
    
    if (timer >= 57 && timer < 70)
    {
        sprite_index = sSusieWalkUp;
        x += 8;
        y -= 8;
        
        if (x >= 466)
            x = 466;
        
        if (y <= 208)
        {
            y = 208;
            image_index = 0;
            image_speed = 0;
        }
    }
    
    if (timer == 70)
    {
        sprite_index = sSusiewtfareyoudoing;
        image_index = 0;
        image_speed = 1;
    }
    
    if (sprite_index == sSusiewtfareyoudoing)
    {
        if (image_index == 2 && image_speed == 1)
        {
            xclicktimer++;
            clicktimer++;
            
            if (clicktimer == 1)
                audio_play_sound(snd_noise, 1, false);
        }
        
        if (image_index == 3 && image_speed == 1)
            clicktimer = 0;
        
        if (image_speed == 3)
        {
            clicktimer++;
            
            if (clicktimer >= 1)
                audio_play_sound(snd_noise, 1, false, 0.8);
        }
    }
    
    if (timer == 120)
    {
        image_speed = 0;
        clicktimer = 0;
    }
    
    if (global.dialogue == 3)
    {
        dialogue3timer++;
        oElevatorMap.image_index = 1;
        
        if (dialogue3timer == 1)
        {
            sprite_index = sSusieShocked;
            audio_play_sound(snd_glassbreak, 1, false);
            audio_play_sound(snd_impact, 1, false);
        }
        
        if (dialogue3timer <= 6)
            y += 1;
        
        percent1 += 0.08333333333333333;
        position = animcurve_channel_evaluate(curve1, percent1);
        var _start = cam_x + 506;
        var _end = cam_x + 510;
        var _distance = _end - _start;
        x = _start + (_distance * position);
        
        if (dialogue3timer == 30)
        {
            sprite_index = sSusieWalkLeft;
            image_speed = 0;
            oKrisPlayerC3.sprite_index = sKrisWalkLeft;
        }
        
        if (dialogue3timer == 45)
        {
            global.dialoguebottom = true;
            global.dialogue = 4;
            global.charactertalking = true;
            instance_create_depth(320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(112, cam_y + 401, -41, oDialogueSprite);
            oDialogueSprite.sprite_index = sSusieDialogueSprite;
            oDialogueSprite.image_index = 20;
            instance_create_depth(320, cam_y - 270, -50, oTextC3R5);
        }
    }
    
    if (global.dialogue == 6)
    {
        dialogue6timer++;
        
        if (dialogue6timer == 1)
        {
            image_index = 0;
            sprite_index = sSusieAttack;
            image_speed = 1;
            audio_play_sound(snd_laz, 1, false);
        }
        
        if (image_index == 3)
            image_speed = 0;
        
        if (dialogue6timer == 30)
        {
            global.dialoguebottom = true;
            global.dialogue = 7;
            global.charactertalking = true;
            instance_create_depth(320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(112, cam_y + 401, -41, oDialogueSprite);
            oDialogueSprite.sprite_index = sSusieDialogueSprite;
            oDialogueSprite.image_index = 26;
            instance_create_depth(320, cam_y - 270, -50, oTextC3R5);
        }
    }
    
    if (global.dialogue == 7)
        image_speed = 0;
    
    if (global.dialogue == 8)
    {
        image_index = 4;
        image_speed = 0;
    }
}

if (room == rChapter3Room2)
{
    timer++;
    
    if (timer == 151)
    {
    }
    
    if (global.dialogue < 8)
    {
        xx = x;
        yy = y;
    }
    
    if (global.dialogue == 8)
    {
        dialogue8timer++;
        
        if (dialogue8timer <= 6)
        {
            sprite_index = sSusieWalkUp;
            image_speed = 1;
            percent1 += 0.16666666666666666;
            position = animcurve_channel_evaluate(curve1, percent1);
            var _start = yy;
            var _end = oButtonC3R2.y - 35;
            var _distance = _end - _start;
            y = _start + (_distance * position);
        }
        
        if (dialogue8timer > 6 && dialogue8timer <= 36)
        {
            sprite_index = sSusieWalkRight;
            percent2 += (1/30);
            position2 = animcurve_channel_evaluate(curve2, percent2);
            var _start2 = xx;
            var _end2 = oButtonC3R2.x;
            var _distance2 = _end2 - _start2;
            x = _start2 + (_distance2 * position2);
        }
        
        if (dialogue8timer == 42)
            image_speed = 0;
        
        if (dialogue8timer == 72)
            sprite_index = sSusieWalkUp;
        
        if (dialogue8timer == 87)
            sprite_index = sSusieWalkLeftUpset;
        
        if (dialogue8timer == 102)
            sprite_index = sSusieWalkDownUpset;
        
        if (dialogue8timer == 132)
        {
            global.dialogue = 9;
            global.charactertalking = true;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
            oDialogueSprite.sprite_index = sSusieDialogueSprite;
            oDialogueSprite.image_index = 11;
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R2);
        }
    }
    
    if (global.dialogue == 15)
    {
        oSusieC3.sprite_index = sSusieLaugh;
        oSusieC3.image_speed = 1;
        d15timer++;
        
        if (d15timer == 1)
            audio_play_sound(snd_laugh, 1, false);
        
        if (d15timer == 60)
        {
            global.dialogue = 16;
            global.charactertalking = true;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
            oDialogueSprite.sprite_index = sSusieDialogueSprite;
            oDialogueSprite.image_index = 7;
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R2);
            oSusieC3.image_speed = 0;
            oSusieC3.image_index = 0;
            oSusieC3.sprite_index = sSusieWalkRight;
        }
    }
}
