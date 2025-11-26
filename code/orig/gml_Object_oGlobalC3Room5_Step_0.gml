var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
sprite_prefetch(sDialogueBox);
sprite_prefetch(sSusieDialogueSprite);
timer++;

if (timer == 70)
{
    global.dialoguetop = false;
    global.dialogue = 1;
    global.charactertalking = true;
    instance_create_depth(320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sSusieDialogueSprite;
    oDialogueSprite.image_index = 5;
    instance_create_depth(320, cam_y - 270, -50, oTextC3R5);
}

if (global.dialogue == 15)
{
    dialogue15timer++;
    
    if (dialogue15timer == 75)
    {
        global.dialogue = 16;
        instance_create_depth(320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(320, cam_y - 270, -50, oTextC3R5);
    }
}

if (global.dialogue == 17)
{
    dialogue17timer++;
    
    if (dialogue17timer == 1)
    {
        instance_create_depth(112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 6;
        global.charactertalking = true;
    }
}
