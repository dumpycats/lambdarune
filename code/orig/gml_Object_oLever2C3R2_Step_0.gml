if (instance_exists(oKrisPlayerC3))
{
    if (place_meeting(x, y, oKrisPlayerC3))
    {
        if (oLeverC3R2.image_index == 0)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                active = true;
                audio_play_sound(snd_noise, 1, false);
                global.dialogue = 20;
                oSusieC3.x = oFalseFood.x;
                instance_create_depth(oSusieC3.x + 16, oSusieC3.y + 5, oSusieC3.depth - 1, oCageC3R2);
                oSusieC3.sprite_index = sSusieWalkDownUpset;
                instance_destroy(oGateC3R2);
                instance_destroy(oFoodFree);
                instance_destroy(oFalseFoodDetect);
                oFalseFood.image_index = 1;
                oLeverC3R2.image_index = 1;
            }
        }
    }
}

if (active)
    timer++;

if (timer == 2)
{
    oSusieC3.x += 26;
    oSusieC3.y += 25;
    oSusieC3.image_yscale = 1.6;
}
