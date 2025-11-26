if (rudebuster)
{
    rudetimer++;
    
    if (rudetimer == 0)
    {
        sprite_index = spr_susie_rudebuster;
        image_index = 0;
        image_speed = 1;
    }
    
    if (image_index >= 5)
    {
        bustertimer++;
        
        if (bustertimer == 0)
            instance_create_depth(x + 100, y + 24, depth - 50, obj_rudebuster);
    }
}
