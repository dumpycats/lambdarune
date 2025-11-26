var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer1++;

if (timer1 == 1)
    audio_play_sound(snd_jump_bc, 1, false);

if (timer1 <= 15)
{
    percent1 += (1/15);
    position1 = animcurve_channel_evaluate(curve1, percent1);
    var _start1 = 343;
    var _end1 = 104;
    var _distance1 = _end1 - _start1;
    y = _start1 + (_distance1 * position1);
    
    if (image_index == 5)
        image_speed = 0;
}

if (timer1 > 15 && timer1 <= 23)
{
    percent2 += 0.125;
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = 104;
    var _end2 = 124;
    var _distance2 = _end2 - _start2;
    y = _start2 + (_distance2 * position2);
}

if (timer1 == 24)
{
    y = 145;
    sprite_index = sShadowmanIdle;
    image_speed = 1;
    image_xscale = -2;
}

if (timer1 >= 24 && timer1 < 50)
{
    percent3 += 0.08333333333333333;
    position3 = animcurve_channel_evaluate(curve3, percent3);
    var _start3 = 2336;
    var _end3 = 2337;
    var _distance3 = _end3 - _start3;
    x = _start3 + (_distance3 * position3);
}

if (timer1 == 36)
{
    global.dialogue = 36;
    global.charactertalking = true;
    instance_create_depth(cam_x + 112, cam_y + 401, -51, oDialogueSprite);
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
    oDialogueSprite.sprite_index = sKreidDialogueSprite;
    oDialogueSprite.image_index = 4;
}

if (global.dialogue == 42)
{
    percent4 += (1/30);
    position4 = animcurve_channel_evaluate(curve4, percent4);
    var _start4 = 2336;
    var _end4 = 2416;
    var _distance4 = _end4 - _start4;
    x = _start4 + (_distance4 * position4);
}

if (global.dialogue == 44 || global.dialogue == 45 || global.dialogue == 46)
{
    percent5 += 0.004901960784313725;
    position5 = animcurve_channel_evaluate(curve5, percent5);
    var _start5 = 2416;
    var _end5 = 2450;
    var _distance5 = _end5 - _start5;
    x = _start5 + (_distance5 * position5);
    percent6 += 0.004901960784313725;
    position6 = animcurve_channel_evaluate(curve6, percent6);
    var _start6 = 145;
    var _end6 = 179;
    var _distance6 = _end6 - _start6;
    y = _start6 + (_distance6 * position6);
    
    if (percent5 == 0.29411764705882354)
    {
        global.dialogue = 45;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -51, oDialogueSprite);
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 4;
    }
}

if (obj_chairiel.chairielshooting)
{
    cshoottimer1++;
    
    if (cshoottimer1 <= 5)
    {
        image_index = 0;
        image_speed = 0;
        percent7 += 0.2;
        position7 = animcurve_channel_evaluate(curve7, percent7);
        var _start7 = 2450;
        var _end7 = 2336;
        var _distance7 = _end7 - _start7;
        x = _start7 + (_distance7 * position7);
        percent8 += 0.2;
        position8 = animcurve_channel_evaluate(curve8, percent8);
        var _start8 = 179;
        var _end8 = 145;
        var _distance8 = _end8 - _start8;
        y = _start8 + (_distance8 * position8);
    }
    
    if (cshoottimer1 >= 28)
    {
        x = 2346;
        sprite_index = spr_shadowman_flying_r;
        image_speed = 0.5;
        percent9 += (1/15);
        position9 = animcurve_channel_evaluate(curve9, percent9);
        var _start9 = 104;
        var _end9 = 343;
        var _distance9 = _end9 - _start9;
        y = _start9 + (_distance9 * position9);
    }
}

if (percent9 == (1/15))
    audio_play_sound(snd_jump_bc, 1, false, 0.5);
