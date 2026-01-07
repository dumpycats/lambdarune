var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (global.dialogue < 55)
    image_alpha += 0.033334;

if (instance_exists(obj_KreidKR))
{
    if (image_alpha >= 1)
        instance_destroy(obj_KreidKR);
}

if (d15timer < 60)
{
    if (image_index == 9)
        image_speed = 0;
}

if (global.dialogue == 14)
{
    d14sY = oSusieC3.y;
    d14rY = oRalseiC3.y;
}

if (global.dialogue == 15)
{
    d15timer++;
    percent1 += 0.020833333333333332;
    position1 = animcurve_channel_evaluate(curve1, percent1);
    var _start1 = d14sY;
    var _end1 = 284;
    var _distance1 = _end1 - _start1;
    oSusieC3.y = _start1 + (_distance1 * position1);
    position2 = animcurve_channel_evaluate(curve1, percent1);
    var _start2 = d14rY;
    var _end2 = 284;
    var _distance2 = _end2 - _start2;
    oRalseiC3.y = _start2 + (_distance2 * position2);
    
    if (percent1 < 1)
    {
        oSusieC3.sprite_index = sSusieWalkUp;
        oRalseiC3.sprite_index = sRalseiWalkUp;
        oSusieC3.image_speed = 0.5;
        oRalseiC3.image_speed = 0.5;
    }
    
    if (percent1 > 1)
    {
        oSusieC3.image_speed = 0;
        oSusieC3.image_index = 0;
        oRalseiC3.image_speed = 0;
        oRalseiC3.image_index = 0;
    }
    
    if (d15timer == 60)
    {
        image_speed = 1;
        sprite_index = spr_kreidhatidle;
        oKrisPlayerC3.sprite_index = sKrisWalkUp;
        oKrisPlayerC3.image_index = 0;
        audio_play_sound(snd_noise, 1, false);
        obj_C3ShadowMenLights2.image_alpha = 0;
    }
    
    if (d15timer == 90)
    {
        window_set_caption(translation_get_string("obj_KreidKR2_Step_0_0"));
        audio_play_sound(mus_kreid_overworld, 1, true);
    }
    
    if (d15timer == 105)
    {
        global.dialogue = 16;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sRalseiDialogueSprite;
        oDialogueSprite.image_index = 12;
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
        d15timer = 120;
    }
}

if (global.dialogue == 17)
{
    timer4++;
    
    if (timer4 == 1)
    {
        oSusieC3.sprite_index = sSusieWalkRight;
        oRalseiC3.sprite_index = sRalseiWalkRight;
    }
    
    percent3 += 0.016666666666666666;
    position3 = animcurve_channel_evaluate(curve3, percent3);
    var _start3 = 2399;
    var _end3 = 2607;
    var _distance3 = _end3 - _start3;
    oSusieC3.x = _start3 + (_distance3 * position3);
    
    if (timer4 > 60)
    {
        oSusieC3.sprite_index = sSusieWalkUp;
        percent2 += (1/15);
        position2 = animcurve_channel_evaluate(curve2, percent2);
        var _start2 = 284;
        var _end2 = 254;
        var _distance2 = _end2 - _start2;
        oSusieC3.y = _start2 + (_distance2 * position2);
    }
    
    if (timer4 < 75)
        oSusieC3.image_speed = 1;
    
    if (timer4 == 75)
    {
        oSusieC3.image_speed = 0;
        oSusieC3.image_index = 0;
    }
    
    percent4 += 0.025;
    position4 = animcurve_channel_evaluate(curve4, percent4);
    var _start4 = 2352;
    var _end4 = 2485;
    var _distance4 = _end4 - _start4;
    oRalseiC3.x = _start4 + (_distance4 * position4);
    
    if (timer4 > 40)
    {
        oRalseiC3.sprite_index = sRalseiWalkUp;
        percent5 += (1/15);
        position5 = animcurve_channel_evaluate(curve5, percent5);
        var _start5 = 284;
        var _end5 = 254;
        var _distance5 = _end5 - _start5;
        oRalseiC3.y = _start5 + (_distance5 * position5);
    }
    
    if (timer4 < 55)
        oRalseiC3.image_speed = 1;
    
    if (timer4 == 55)
    {
        oRalseiC3.image_speed = 0;
        oRalseiC3.image_index = 0;
    }
}

if (global.dialogue == 19)
{
    d19timer++;
    
    if (d19timer == 1)
    {
        image_index = 0;
        sprite_index = spr_kreidhatwalk;
        image_speed = 0.8;
    }
    
    percent6 += 0.013157894736842105;
    position6 = animcurve_channel_evaluate(curve6, percent6);
    var _start6 = 76;
    var _end6 = 136;
    var _distance6 = _end6 - _start6;
    y = _start6 + (_distance6 * position6);
    
    if (percent6 >= 1)
    {
        sprite_index = spr_kreidhatidle;
        image_speed = 1;
        global.dialogue = 20;
        reset_dialogue();
    }
}

if (global.dialogue == 22)
{
    htimer1++;
    
    if (image_index >= 8)
        htimer2++;
    
    if (image_index >= 14)
        htimer3++;
    
    if (image_index >= 18)
        htimer4++;
    
    if (htimer1 == 1)
    {
        image_index = 0;
        sprite_index = spr_kreidhatremove;
    }
    
    if (htimer2 == 1)
    {
        audio_play_sound(snd_grab, 1, false, 0.8);
        oSusieC3.image_speed = 0;
        oSusieC3.image_index = 0;
        oSusieC3.sprite_index = sSusiePointShrunk;
    }
    
    if (htimer3 == 1)
        audio_play_sound(snd_spearrise, 1, false, 0.8);
    
    if (htimer4 == 1)
        audio_play_sound(snd_mercyadd, 1, false, 1.5);
}

if (global.dialogue == 35)
{
    d35timer1++;
    
    if (d35timer1 == 1)
    {
        image_index = 0;
        sprite_index = spr_kreidsnap;
    }
    
    if (d35timer1 > 1 && image_index >= 5)
    {
        d35trigger1 = true;
        d35timer2++;
    }
    
    if (d35timer2 == 1)
    {
        audio_play_sound(snd_noise, 1, false);
        audio_play_sound(snd_paperrise, 1, false);
    }
    
    if (d35trigger1)
    {
    }
}

if (obj_chairiel.chairielshooting)
{
    percent7 += 0.2;
    position7 = animcurve_channel_evaluate(curve7, percent7);
    var _start7 = 254;
    var _end7 = 270;
    var _distance7 = _end7 - _start7;
    oSusieC3.y = _start7 + (_distance7 * position7);
    oRalseiC3.y = _start7 + (_distance7 * position7);
    oKrisPlayerC3.y = _start7 + (_distance7 * position7);
}

if (global.dialogue == 55)
{
    d55timer++;
    
    if (d55timer == 1)
    {
        image_index = 0;
        sprite_index = spr_kreidwalk;
        image_speed = 0.8;
    }
    
    percent8 += 0.013157894736842105;
    position8 = animcurve_channel_evaluate(curve8, percent8);
    var _start8 = 136;
    var _end8 = 76;
    var _distance8 = _end8 - _start8;
    y = _start8 + (_distance8 * position8);
    
    if (d55timer > 76 && d55timer < 91)
    {
        sprite_index = spr_kreidwalk;
        image_speed = 0;
        image_index = 0;
    }
    
    if (d55timer == 92)
    {
        image_index = 0;
        sprite_index = spr_kreidhatunremove;
        image_speed = 1;
    }
}

if (global.dialogue == 58)
{
    d58timer++;
    
    if (d58timer == 1)
    {
        image_index = 0;
        sprite_index = spr_kreidsnap_on;
    }
    
    if (image_index >= 5)
    {
        d58timer2++;
        
        if (d58timer2 == 1)
        {
            instance_create_depth(x, y, depth - 1, obj_KreidKREnd);
            sprite_index = spr_KreidShadowSnap;
            oKrisPlayerC3.sprite_index = spr_KrisBright1;
            oKrisPlayerC3.image_index = 1;
            obj_C3ShadowMenLights2.image_alpha = 0.5;
            audio_play_sound(snd_noise, 1, false);
        }
    }
    
    if (d58timer == 90)
    {
        global.dialogue = 59;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 6;
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
    }
}

if (global.dialogue >= 58)
{
    percent9 += 0.04;
    position9 = animcurve_channel_evaluate(curve9, percent9);
    var _start9 = 270;
    var _end9 = 286;
    var _distance9 = _end9 - _start9;
    oSusieC3.y = _start9 + (_distance9 * position9);
    oRalseiC3.y = _start9 + (_distance9 * position9);
    percent10 += 0.04;
    position10 = animcurve_channel_evaluate(curve10, percent10);
    var _start10 = 2485;
    var _end10 = 2469;
    var _distance10 = _end10 - _start10;
    oRalseiC3.x = _start10 + (_distance10 * position10);
    percent11 += 0.04;
    position11 = animcurve_channel_evaluate(curve11, percent11);
    var _start11 = 2607;
    var _end11 = 2623;
    var _distance11 = _end11 - _start11;
    oSusieC3.x = _start11 + (_distance11 * position11);
    
    if (percent9 < 1)
    {
        oSusieC3.image_speed = 0.5;
        oRalseiC3.image_speed = 0.5;
    }
    else if (percent9 >= 1)
    {
        oSusieC3.image_speed = 0;
        oSusieC3.image_index = 0;
        oRalseiC3.image_speed = 0;
        oRalseiC3.image_index = 0;
    }
}

if (global.dialogue == 60)
{
    d60timer++;
    
    if (d60timer == 1)
    {
        image_alpha = 0;
        oKrisPlayerC3.sprite_index = sKrisWalkUp;
        oKrisPlayerC3.image_index = 0;
        obj_C3ShadowMenLights2.image_alpha = 0;
        audio_play_sound(snd_noise, 1, false);
        audio_sound_gain(mus_kreid_overworld, 1, 1000);
    }
    
    if (d60timer == 90)
    {
        global.dialogue = 61;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 4;
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
    }
}

if (sprite_index == spr_kreidhatunremove)
{
    if (image_index >= 5)
        h2timer1++;
    
    if (image_index >= 10)
        h2timer2++;
    
    if (image_index >= 18)
        h2timer3++;
    
    if (h2timer1 == 1)
        audio_play_sound(snd_mercyadd, 1, false, 1.5);
    
    if (h2timer2 == 1)
        audio_play_sound(snd_spearrise, 1, false, 0.8);
    
    if (h2timer3 == 1)
        audio_play_sound(snd_grab, 1, false, 0.8);
}
