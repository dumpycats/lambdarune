var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (place_meeting(x, y + 10, oKrisPlayerC3))
    endtimer = true;

if (endtimer)
    timer++;

if (timer == 1)
{
    instance_create_depth(oKrisPlayerC3.x, oKrisPlayerC3.y, -60, oBlackScreen1Room2);
    
    if (!global.savesusie)
    {
        global.wtfdialogue = 1;
        global.dialoguetop = false;
        global.dialoguebottom = true;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.image_yscale = 0.8;
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 17;
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R2_wtf);
        oKrisPlayerC3.playeronlymove = false;
    }
}
