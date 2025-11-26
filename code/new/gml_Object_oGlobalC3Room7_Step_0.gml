var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
sprite_prefetch(sDialogueBox);
sprite_prefetch(sSusieDialogueSprite);
sprite_prefetch(sMScreen_Announcement);
sprite_prefetch(sMScreen_AnnouncementMiddle);
sprite_prefetch(sMScreen_AnnouncementEnd);
timer++;

if (timer == 282)
{
    global.dialogue = 1;
    global.charactertalking = true;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sSusieDialogueSprite;
    oDialogueSprite.image_index = 0;
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R7);
}

if (global.dialogue == 19)
{
    sprite_prefetch(sMScreen_Appear);
    d19timer++;
    
    if (d19timer == 50)
        instance_create_depth(320, 110, -10, oMikeScreenC3R7);
}

if (global.aftermike)
{
    global.aftermiketimer++;
    
    if (global.aftermiketimer == 30)
    {
        a = oKrisPlayerC3.y;
        a2 = oSusieC3.y;
        a3 = oRalseiC3.y;
        a4 = oBackgroundC3R7.y;
        a5 = oBuildingsC3R7.y;
        a6 = oC3Room7.y;
        audio_sound_gain(mus_wind, 0, 0);
        audio_play_sound(mus_wind, 1, true, 0.1, false, 0.5);
        audio_sound_gain(mus_wind, 1, 500);
    }
    
    if (global.aftermiketimer >= 60)
    {
        percent1 += (1/30);
        position = animcurve_channel_evaluate(curve1, percent1);
        var _start = a;
        var _end = a - 31;
        var _distance = _end - _start;
        oKrisPlayerC3.y = _start + (_distance * position);
        percent2 += (1/30);
        position2 = animcurve_channel_evaluate(curve2, percent2);
        var _start2 = a2;
        var _end2 = a2 - 31;
        var _distance2 = _end2 - _start2;
        oSusieC3.y = _start2 + (_distance2 * position2);
        percent3 += (1/30);
        position3 = animcurve_channel_evaluate(curve3, percent3);
        var _start3 = a3;
        var _end3 = a3 - 31;
        var _distance3 = _end3 - _start3;
        oRalseiC3.y = _start3 + (_distance3 * position3);
        percent4 += (1/30);
        position4 = animcurve_channel_evaluate(curve4, percent4);
        var _start4 = a4;
        var _end4 = a4 - 31;
        var _distance4 = _end4 - _start4;
        oBackgroundC3R7.y = _start4 + (_distance4 * position4);
        percent5 += (1/30);
        position5 = animcurve_channel_evaluate(curve5, percent5);
        var _start5 = a5;
        var _end5 = a5 - 31;
        var _distance5 = _end5 - _start5;
        oBuildingsC3R7.y = _start5 + (_distance5 * position5);
        percent6 += (1/30);
        position6 = animcurve_channel_evaluate(curve6, percent6);
        var _start6 = a6;
        var _end6 = a6 - 31;
        var _distance6 = _end6 - _start6;
        oC3Room7.y = _start6 + (_distance6 * position6);
    }
}

if (global.aftermiketimer == 105)
{
    global.dialogue = 46;
    global.charactertalking = true;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sRalseiDialogueSprite;
    oDialogueSprite.image_index = 6;
    oRalseiC3.sprite_index = sRalseiWalkLeftUpset;
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R7);
}

if (global.dialogue == 54)
{
    exittimer++;
    
    if (exittimer == 5)
        audio_play_sound(mus_cymbalshort, 1, false);
    
    if (exittimer == 35)
    {
        audio_play_sound(snd_cinematickick, 1, false);
        oPersistent.androidsavetimer = -1;
        
        if (!global.c3outskirtscompleted)
        {
            global.c3outskirtscompleted = true;
            instance_create_depth(47, 368, -59, obj_memorandum_notice_c3);
        }
        
        room_goto(rLambdaruneLogoToC3);
    }
}
