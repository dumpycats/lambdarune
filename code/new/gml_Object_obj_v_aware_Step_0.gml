var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (!talking)
{
    interacttimer++;
    generaltimer++;
    image_speed = 0;
    image_index = 0;
    sprite_index = spr_v_aware;
    
    if ((generaltimer % 40) == 0)
    {
        randomize();
        image_index = choose(1, 3);
    }
    else if (((generaltimer - 10) % 40) == 0)
    {
        image_index = 0;
    }
}
else
{
    image_speed = 1;
    armtimer++;
    xoffset = (sin((armtimer / 60) * (2 * pi)) * 2) + 2;
}

if (!talking && !global.playermove && dialogue == 11)
{
    untalkingtimer++;
    
    if (untalkingtimer == 0)
        instance_create_depth(320, 240, -640, obj_menu_SOUL);
}

if (place_meeting(x, y, obj_kris_c3) && global.playermove)
{
    if (interacttimer >= 0)
    {
        if (advance_pressed)
        {
            if (dialogue == 28 || dialogue == 26)
            {
                dialogue = 27;
                reset_dialogue_normal();
            }
            
            sprite_index = spr_v_aware_talking;
            image_index = 0;
            talking = true;
            global.playermove = false;
            obj_kris_c3.image_speed = 0;
            obj_kris_c3.image_index = 0;
        }
    }
}
