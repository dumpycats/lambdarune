var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (room == rm_ch3_cathodetower_aftermath)
{
    x = obj_kris_c3.x + xoffset;
    y = obj_kris_c3.y + yoffset;
}

if (room == rm_ch3_spacechannel_2)
{
    if (!panup)
    {
        if (!stoptracking)
        {
            x = oKrisPlayerC3.x + xoffset;
            y = oKrisPlayerC3.y + yoffset;
        }
        else
        {
            percent1 += 0.016666666666666666;
            
            if (percent1 < 5)
            {
                oKrisPlayerC3.sprite_index = sKrisWalkUp;
                var position1 = animcurve_channel_evaluate(curve1, percent1);
                var _start1 = oKrisPlayerC3.y;
                var _end1 = obj_foane_spacechannel.y;
                var _distance1 = _end1 - _start1;
                y = _start1 + (_distance1 * position1);
                percent2 += (1/120);
                var position2 = animcurve_channel_evaluate(curve1, percent2);
                var _start2 = x;
                var _end2 = 1423;
                var _distance2 = _end2 - _start2;
                x = _start2 + (_distance2 * position2);
            }
            
            if (percent1 == 1.25)
                obj_foane_spacechannel.sprite_index = spr_foane_feighline_down;
            
            if (percent1 >= 1.75)
                oKrisPlayerC3.dtimer3++;
        }
    }
    
    if (panup)
    {
        percent3 += 0.006666666666666667;
        var position3 = animcurve_channel_evaluate(curvebezier, percent3);
        var _start3 = 626;
        var _end3 = 240;
        var _distance3 = _end3 - _start3;
        y = _start3 + (_distance3 * position3);
        
        if (percent3 == 0.006666666666666667)
            obj_foane_spacechannel.blackout = true;
        
        obj_foane_spacechannel.blackalpha += 0.006060606060606061;
        
        if (obj_foane_spacechannel.blackalpha == (12/11))
        {
            instance_destroy(oWallTransitionC3sp_2);
            instance_destroy(obj_spacechannel_screen1);
            instance_destroy(obj_spacechannel_screen2);
            instance_destroy(obj_spacechannel_screen3);
            instance_destroy(obj_spacechannel_textcheck);
            
            if (!global.missedopportunity)
            {
                window_set_caption("Organization");
                instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
                instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3_spacechannel6);
            }
            else
            {
                room_goto(rLambdaruneLogoToC3);
            }
        }
    }
}

if (room == rChapter3Room4)
{
    x = oKrisPlayerC3.x + xoffset;
    y = oKrisPlayerC3.y + yoffset;
}

if (room == rChapter3Room3)
{
    if (timer < 51)
    {
        x = oKrisPlayerC3.x;
        y = oKrisPlayerC3.y;
    }
    
    if (timer > 100 && timer <= 130)
    {
        percent1 += (1/30);
        var position1 = animcurve_channel_evaluate(curve1, percent1);
        var _start1 = 374;
        var _end1 = 514;
        var _distance1 = _end1 - _start1;
        x = _start1 + (_distance1 * position1);
        percent2 += (1/30);
        var position2 = animcurve_channel_evaluate(curve2, percent2);
        var _start2 = 1450;
        var _end2 = 1250;
        var _distance2 = _end2 - _start2;
        y = _start2 + (_distance2 * position2);
    }
    
    if (timer == 180)
    {
        global.dialoguetop = false;
        global.dialogue = 1;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 11;
        instance_create_depth(320, cam_y - 270, -50, oTextC3R3);
    }
    
    if (global.dialogue == 3)
    {
        percent3 += (1/30);
        var position3 = animcurve_channel_evaluate(curve3, percent3);
        var _start3 = obj_shadowman_initial.x;
        var _end3 = oKrisPlayerC3.x;
        var _distance3 = _end3 - _start3;
        x = _start3 + (_distance3 * position3);
        percent4 += (1/30);
        position4 = animcurve_channel_evaluate(curve4, percent4);
        var _start4 = oKrisPlayerC3.y - 200;
        var _end4 = oKrisPlayerC3.y;
        var _distance4 = _end4 - _start4;
        y = _start4 + (_distance4 * position4);
    }
    
    if (global.dialogue == 7)
    {
        x = oKrisPlayerC3.x + xoffset;
        y = oKrisPlayerC3.y + yoffset;
    }
}

if (room == rChapter3KreidRoom)
{
    if (global.dialogue < 46)
    {
        x = oKrisPlayerC3.x;
        y = oKrisPlayerC3.y;
    }
    
    if (global.dialogue == 46)
    {
        percent1 += 0.016666666666666666;
        var position1 = animcurve_channel_evaluate(curve1, percent1);
        var _start1 = 2544;
        var _end1 = 2674;
        var _distance1 = _end1 - _start1;
        x = _start1 + (_distance1 * position1);
        oDialogueBox.x = _start1 + (_distance1 * position1);
    }
}
