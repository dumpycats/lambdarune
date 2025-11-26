var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (!talking || text_complete)
{
    interacttimer++;
    image_speed = 0;
    image_index = 0;
}
else
{
    image_speed = 1;
}

if (place_meeting(x, y, oKrisPlayerC3))
{
    if (interacttimer >= 0)
    {
        if (advance_pressed)
        {
            if (dialogue >= 3)
            {
                dialogue = 4;
                reset_dialogue_normal();
            }
            
            talking = true;
            
            if (room == rChapter3Room2)
            {
                oKrisPlayerC3.playeronlymove = false;
                global.playermove = false;
            }
            else
            {
                global.playermove = false;
            }
            
            oKrisPlayerC3.image_speed = 0;
            oKrisPlayerC3.image_index = 0;
            oSusieC3.image_speed = 0;
            oSusieC3.image_index = 0;
            
            if (room == rChapter3KreidRoom)
            {
                oRalseiC3.image_speed = 0;
                oRalseiC3.image_index = 0;
            }
        }
    }
}
