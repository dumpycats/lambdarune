var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (oKrisPlayerC3.playeronlymove == true)
{
    if (place_meeting(x, y + 22, oKrisPlayerC3))
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            global.dialogue = 22;
            global.dialoguetop = false;
            global.dialoguebottom = true;
            global.charactertalking = true;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
            oDialogueSprite.image_yscale = 0.8;
            oDialogueSprite.sprite_index = sSusieDialogueSprite;
            oDialogueSprite.image_index = 12;
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R2);
            oKrisPlayerC3.playeronlymove = false;
            oKrisPlayerC3.image_speed = 0;
            oKrisPlayerC3.image_index = 0;
            oSusieC3.image_speed = 0;
            oSusieC3.image_index = 0;
        }
    }
}

if (global.playermove == true)
{
    if (place_meeting(x, y + 22, oKrisPlayerC3))
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            global.dialogue = 37;
            global.dialoguebottom = true;
            global.charactertalking = false;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3R2);
            global.playermove = false;
            oKrisPlayerC3.image_speed = 0;
            oKrisPlayerC3.image_index = 0;
            oSusieC3.image_speed = 0;
            oSusieC3.image_index = 0;
        }
    }
}
