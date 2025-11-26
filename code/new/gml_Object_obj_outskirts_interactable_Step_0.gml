var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
timer++;

if (value == 1)
{
    if (!instance_exists(oTextC3_outskirts_interact1) && !global.susieout)
    {
        if (place_meeting(x, y, oKrisPlayerC3) && timer > 0)
        {
            if (advance_pressed)
            {
                instance_create_depth(cam_x + 320, cam_y + 394, -55, oDialogueBox);
                instance_create_depth(cam_x + 320, cam_y - 270, -60, oTextC3_outskirts_interact1);
                oTextC3_outskirts_interact1.dialogue_to_display = dialoguesend;
                oTextC3_outskirts_interact1.dialogue_to_display2 = dialoguesend2;
                oTextC3_outskirts_interact1.dialogue_to_display3 = dialoguesend3;
                oTextC3_outskirts_interact1.dialogue_to_display4 = dialoguesend4;
                oTextC3_outskirts_interact1.dialogue_to_display5 = dialoguesend5;
                oTextC3_outskirts_interact1.dialogue_to_display6 = dialoguesend6;
                oTextC3_outskirts_interact1.dialogue_to_display7 = dialoguesend7;
                oTextC3_outskirts_interact1.dialogue_to_display8 = dialoguesend8;
                oTextC3_outskirts_interact1.dialogue_to_display9 = dialoguesend9;
                oTextC3_outskirts_interact1.dialogue_to_display10 = dialoguesend10;
                oKrisPlayerC3.playeronlymove = false;
                oKrisPlayerC3.image_speed = 0;
                oKrisPlayerC3.image_index = 0;
                oSusieC3.image_speed = 0;
                oSusieC3.image_index = 0;
            }
        }
    }
    else if (!instance_exists(oTextC3_outskirts_interact2) && global.susieout)
    {
        if (place_meeting(x, y, oKrisPlayerC3) && timer > 0)
        {
            if (advance_pressed)
            {
                instance_create_depth(cam_x + 320, cam_y + 394, -55, oDialogueBox);
                instance_create_depth(cam_x + 320, cam_y - 270, -60, oTextC3_outskirts_interact2);
                instance_create_depth(cam_x + 112, cam_y + 401, -61, oDialogueSprite);
                oDialogueSprite.sprite_index = sSusieDialogueSprite;
                oDialogueSprite.image_index = 14;
                global.playermove = false;
                oKrisPlayerC3.image_speed = 0;
                oKrisPlayerC3.image_index = 0;
                oSusieC3.image_speed = 0;
                oSusieC3.image_index = 0;
            }
        }
    }
}
else if (!instance_exists(oTextC3_outskirts_interact3) && !global.susieout && !oLever2C3R2.active && oSusieC3.touching)
{
    if (place_meeting(x, y, oKrisPlayerC3) && timer > 0)
    {
        if (advance_pressed)
        {
            instance_create_depth(cam_x + 320, cam_y + 394, -55, oDialogueBox);
            instance_create_depth(cam_x + 320, cam_y - 270, -60, oTextC3_outskirts_interact3);
            instance_create_depth(cam_x + 112, cam_y + 401, -61, oDialogueSprite);
            oDialogueSprite.sprite_index = sSusieDialogueSprite;
            
            if (!global.morehungry)
                oDialogueSprite.image_index = 1;
            else
                oDialogueSprite.image_index = 17;
            
            oKrisPlayerC3.playeronlymove = false;
            oKrisPlayerC3.image_speed = 0;
            oKrisPlayerC3.image_index = 0;
            oSusieC3.image_speed = 0;
            oSusieC3.image_index = 0;
        }
    }
}

if (instance_exists(oTextC3_outskirts_interact1))
{
    if (oTextC3_outskirts_interact1.dialogue == destroyvalue)
        oTextC3_outskirts_interact1.destroy = true;
}

if (place_meeting(x, y, oKrisPlayerC3))
{
    if (value == 1)
        destroyvalue = 3;
}
else
{
    destroyvalue = 0;
}
