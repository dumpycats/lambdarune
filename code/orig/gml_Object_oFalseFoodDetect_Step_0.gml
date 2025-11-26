var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (oKrisPlayerC3.playeronlymove == true && global.dialogue == 11)
{
    if (place_meeting(x - 22, y + 22, oKrisPlayerC3) || place_meeting(oFoodFree.x, oFoodFree.y + 40, oKrisPlayerC3))
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            global.dialogue = 12;
            global.charactertalking = true;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
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

if (oKrisPlayerC3.playeronlymove == true && (global.dialogue == 17 || global.dialogue == 20))
{
    if (place_meeting(x - 22, y + 22, oKrisPlayerC3) || place_meeting(oFoodFree.x, oFoodFree.y + 40, oKrisPlayerC3))
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            global.dialogue = 18;
            global.charactertalking = true;
            instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
            instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
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
