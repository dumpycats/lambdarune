var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (timer == 0)
    audio_play_sound(snd_elecdoor_close, 1, false);

if (timer == 15)
    audio_play_sound(snd_elecdoor_shut, 1, false);

if (timer == 32)
{
    audio_play_sound(snd_elevator, 1, true, 0.75, false, 0.8);
    audio_sound_gain(snd_elevator, 0, 0);
    global.elevatortime = true;
}

if (timer == 33)
    audio_sound_gain(snd_elevator, 1, 500);

if (timer == 145)
{
    global.dialoguetop = false;
    global.dialogue = 1;
    global.charactertalking = true;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sRalseiDialogueSprite;
    oDialogueSprite.image_index = 9;
    instance_create_depth(320, cam_y - 270, -50, oTextC3R6);
}

if (global.dialogue == 33)
{
    d33timer++;
    
    if (d33timer >= 30)
    {
        audio_sound_gain(snd_elevator, 0, 500);
        obj_elevatorline.image_alpha -= 0.03334;
    }
    
    if (d33timer == 65)
    {
        audio_play_sound(snd_bell, 1, false);
        oSusieC3.image_index = 1;
    }
    
    if (d33timer == 79)
    {
        audio_play_sound(snd_elecdoor_open, 1, false);
        oKrisPlayerC3.sprite_index = sKrisWalkUp;
        oRalseiC3.sprite_index = sRalseiWalkUp;
        global.dooropen = true;
    }
    
    if (d33timer == 139)
    {
        global.dialoguetop = false;
        global.dialogue = 34;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 10;
        instance_create_depth(320, cam_y - 270, -50, oTextC3R6);
    }
}

if (global.dialogue >= 34)
    obj_elevatorline.image_alpha = 0;
