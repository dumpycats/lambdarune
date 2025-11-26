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

if (place_meeting(x, y, obj_kris_c3))
{
    if (interacttimer >= 0)
    {
        if (advance_pressed)
        {
            if (dialogue == 4)
            {
                dialogue += 1;
                reset_dialogue_normal();
            }
            
            if (dialogue == 6)
            {
                dialogue = 5;
                reset_dialogue_normal();
            }
            
            talking = true;
            global.playermove = false;
            obj_kris_c3.image_speed = 0;
            obj_kris_c3.image_index = 0;
            obj_susie_c3.image_speed = 0;
            obj_susie_c3.image_index = 0;
            obj_ralsei_c3.image_speed = 0;
            obj_ralsei_c3.image_index = 0;
        }
    }
}
