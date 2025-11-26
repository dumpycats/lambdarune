if (sprite_index == spr_ralsei_reveal)
{
    image_speed = 0;
    image_index = 0;
    sprite_index = sRalseiWalkUp;
    
    with (obj_ch3_epilogue_text)
    {
        talking = true;
        dialogue = 8;
        reset_dialogue_normal();
    }
}
