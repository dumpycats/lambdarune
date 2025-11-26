var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (!talking || text_complete)
{
    interacttimer++;
}
else
{
}

if (place_meeting(x, y, obj_kris_c3))
{
    if (interacttimer >= 0)
    {
        if (advance_pressed)
        {
            if (dialogue == 15)
            {
                dialogue += 1;
                reset_dialogue_normal();
            }
            
            if (dialogue >= 20)
            {
                dialogue = 20;
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

if (sleep)
{
    sleeptimer++;
    
    if ((sleeptimer % 10) == 0)
        randomize();
    
    if ((sleeptimer % (25 + randomoffset)) == 0)
        instance_create_depth(x, y - 96, depth + 6, obj_z_sleep_ch3);
}
