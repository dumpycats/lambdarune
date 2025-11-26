if (sprite_index == spr_mike_land_alt)
{
    image_index = 4;
    image_speed = 0;
    
    if (fall)
    {
        fall = false;
        
        with (obj_ch3_epilogue_text)
        {
            talking = true;
            dialogue = 44;
            reset_dialogue_normal();
        }
    }
}
