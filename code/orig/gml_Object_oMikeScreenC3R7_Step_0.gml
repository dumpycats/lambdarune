var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (timer == 1)
    audio_play_sound(snd_battleenter, 1, false, 0.5);

if (timer == 4)
{
    oRalseiC3.sprite_index = sRalseiShockedFront;
    oRalseiC3.image_xscale = -2;
    oSusieC3.sprite_index = sSusieShockedFront;
    oSusieC3.image_xscale = -2;
}

if (timer == 8)
    audio_play_sound(snd_bell_bc, 1, false);

if (sprite_index == sMScreen_TurnOn || sprite_index == sMScreen_Announcement || sprite_index == sMScreen_AnnouncementMiddle)
{
    timer2++;
    
    if (timer2 == 1)
    {
        audio_play_sound(snd_cardrive, 1, false);
        audio_play_sound(snd_announcement, 1, false);
    }
    
    if (timer2 == 47)
        audio_play_sound(snd_announcement, 1, false);
    
    if (timer2 == 53)
    {
        audio_play_sound(snd_drumroll, 1, false);
        oRalseiC3.sprite_index = sRalseiWalkUp;
        oRalseiC3.image_xscale = 2;
        oSusieC3.sprite_index = sSusieWalkUp;
        oSusieC3.image_xscale = 2;
    }
}

if (sprite_index == sMScreen_Mike2)
{
    timer3++;
    
    if (timer3 == 2)
        audio_play_sound(snd_explosion_mmx3, 1, false);
    
    if (timer3 == 10)
        audio_play_sound(snd_cheer, 1, false);
}

if (sprite_index == sMScreen_Mike3)
{
    timer4++;
    
    if (timer4 == 1)
    {
        audio_play_sound(mus_screen_theme, 1, true, 0.5);
        global.dialogue = 21;
        global.charactertalking = false;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R7);
        miketalkbegin = true;
    }
}

if (global.dialogue == 23)
{
    timer5++;
    
    if (timer5 == 1)
        audio_play_sound(snd_cheer, 1, false);
}

if ((global.dialogue < 28 && miketalkbegin) || global.dialogue == 40 || global.dialogue == 41 || global.dialogue == 44)
{
    if (global.text_complete)
        sprite_index = sMScreen_Mike3Still;
    else
        sprite_index = sMScreen_Mike3;
}

if (global.dialogue == 28 && !(sprite_index == sMScreen_MikeMoveRight) && !(sprite_index == sMScreen_Mike4Still))
    sprite_index = sMScreen_Mike3Still;

if (global.dialogue == 39 && !(sprite_index == sMScreen_MikeMoveLeft) && !(sprite_index == sMScreen_Mike3Still) && !(sprite_index == sMScreen_Mike3))
    sprite_index = sMScreen_Mike4Still;

if (global.dialogue == 28 && sprite_index == sMScreen_MikeMoveRight)
    timer7++;

if (timer7 == 12)
    audio_play_sound(snd_spellcure, 1, false);

if (sprite_index == sMScreen_Mike4Still)
    timer6++;

if (timer6 == 15)
{
    global.dialogue = 29;
    global.charactertalking = false;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R7);
    timer6 = 30;
}

if (global.dialogue == 29 && global.text_complete)
{
    timer8++;
    
    if (timer8 == 1)
        audio_play_sound(snd_realization, 1, false, 2);
}

if (global.dialogue == 29 || global.dialogue == 30 || global.dialogue == 32 || global.dialogue == 33 || global.dialogue == 35 || global.dialogue == 37 || (global.dialogue == 38 && miketalkbegin))
{
    if (global.text_complete)
        sprite_index = sMScreen_Mike4Still;
    else
        sprite_index = sMScreen_Mike4;
}

if (global.dialogue == 31 || global.dialogue == 34 || (global.dialogue == 36 && miketalkbegin))
{
    if (global.text_complete)
        sprite_index = sMScreen_Mike5Still;
    else
        sprite_index = sMScreen_Mike5;
}

if (global.dialogue == 39 && sprite_index == sMScreen_MikeMoveLeft)
{
    timer11++;
    
    if (timer11 == 1)
        audio_play_sound(snd_spellcure_reverse, 1, false);
}

if (sprite_index == sMScreen_Mike3 && global.dialogue == 39)
    timer9++;

if (timer9 == 1)
{
    global.dialogue = 40;
    global.charactertalking = false;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R7);
    timer9 = 30;
}

if (global.dialogue == 34 && global.text_complete)
{
    timer10++;
    
    if (timer10 == 1)
        audio_play_sound(snd_gasp_audience, 1, false, 2);
}

if (global.dialogue == 40 && global.text_complete)
{
    timer13++;
    
    if (timer13 == 1)
        audio_play_sound(snd_cheer, 1, false);
}

if (global.dialogue == 42)
{
    timer12++;
    
    if (timer12 == 1)
        audio_play_sound(snd_gasp_audience, 1, false, 2);
}

if (global.dialogue == 42 || global.dialogue == 43 || (global.dialogue == 44 && miketalkbegin))
{
    if (global.text_complete)
        sprite_index = sMScreen_Mike6Still;
    else
        sprite_index = sMScreen_Mike6;
}

if (sprite_index == sMScreen_MikeLeave)
{
    timer14++;
    
    if (timer14 == 1)
    {
        audio_play_sound(snd_battleenter, 1, false, 0.5);
        audio_stop_sound(mus_screen_theme);
    }
    
    if (timer14 == 7)
        audio_play_sound(snd_bell_bc, 1, false);
    
    if (timer14 == 14)
        audio_play_sound(snd_spearrise, 1, false);
}
