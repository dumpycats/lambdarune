var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (timer == 30)
    oSusieC3.sprite_index = sSusieWalkRightUpset;

if (timer == 75)
{
    global.dialogue = 3;
    global.charactertalking = true;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sSusieDialogueSprite;
    oDialogueSprite.image_index = 11;
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
}

if (global.dialogue == 9 || global.dialogue == 10)
{
    timer2++;
    
    if (timer2 == 15)
    {
        if (!(oSusieC3.y <= 170))
            oSusieC3.sprite_index = sSusieWalkUp;
    }
    
    if (timer2 == 45)
    {
        global.dialogue = 10;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 1;
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
    }
}

if (global.dialogue == 11)
{
    oKrisPlayerC3.image_index = 1;
    timer3++;
    
    if (timer3 == 45)
    {
        global.dialogue = 12;
        global.charactertalking = false;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
    }
}
