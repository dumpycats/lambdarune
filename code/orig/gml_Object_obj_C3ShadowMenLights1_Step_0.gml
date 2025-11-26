var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (!(kreidtime == 3))
{
    if (oGlobalC3KreidRoom.shadowspawn)
        timer++;
    
    if (timer == 1)
    {
        audio_play_sound(snd_noise, 1, false);
        
        if (oKrisPlayerC3.kreidbegin)
        {
            sprite_index = sC3ShadowMenLights1;
            kreidtime++;
        }
        
        image_alpha = 1;
    }
    
    if (timer == 61)
    {
        audio_play_sound(snd_noise, 1, false);
        
        if (oKrisPlayerC3.kreidbegin)
        {
            sprite_index = sC3ShadowMenLights1;
            kreidtime++;
        }
        
        image_alpha = 0;
    }
    
    if (timer == 120)
        timer = 0;
}

if (kreidtime == 3)
{
    timer = 500;
    timer2++;
    audio_sound_gain(mus_strollingshady, 0, 1000);
}

if (timer2 == 75)
{
    global.dialoguetop = false;
    global.dialogue = 1;
    global.charactertalking = true;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sRalseiDialogueSprite;
    oDialogueSprite.image_index = 18;
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
}

if (place_meeting(x, y, oKrisPlayerC3) && image_alpha == 1)
{
    goback = true;
    global.playermove = false;
}

if (goback)
{
    gobacktimer++;
    
    if (gobacktimer == 2)
    {
        instance_destroy(oDialogueBox);
        instance_destroy(oTextC3_kreid_interact1);
        audio_play_sound(snd_cough, 1, false);
        audio_play_sound(snd_bulletshot, 1, false);
        audio_sound_gain(mus_strollingshady, 0.1, 85);
        audio_sound_gain(snd_noise, 0, 0);
        instance_create_depth(cam_x, cam_y, -61, obj_blackgoback);
        oKrisPlayerC3.x = 45;
        oKrisPlayerC3.y = 240;
        oRalseiC3.x = 45;
        oRalseiC3.y = 240;
        oSusieC3.x = 45;
        oSusieC3.y = 240;
        oKrisPlayerC3.image_speed = 0;
        oKrisPlayerC3.image_index = 0;
        oRalseiC3.image_speed = 0;
        oRalseiC3.image_index = 0;
        oSusieC3.image_speed = 0;
        oSusieC3.image_index = 0;
        oKrisPlayerC3.sprite_index = sKrisWalkRight;
        oSusieC3.sprite_index = sSusieWalkRight;
        oRalseiC3.sprite_index = sRalseiWalkRight;
    }
    
    if (gobacktimer == 30)
    {
        instance_destroy(obj_blackgoback);
        goback = false;
        global.playermove = true;
        audio_sound_gain(mus_strollingshady, 1, 1000);
        audio_sound_gain(snd_noise, 1, 0);
        gobacktimer = 0;
    }
}
