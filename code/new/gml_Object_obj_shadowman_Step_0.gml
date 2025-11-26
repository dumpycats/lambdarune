if (!(global.krishp <= 0))
{
    if (global.shadowshoot)
    {
        image_alpha = 1;
        shoottimer++;
        
        if (shoottimer == 1)
            sprite_index = spr_shadowman_shoot;
        
        x = xx + xoffset;
        
        if (obj_shadowgun_chase.timer == 1)
            xoffset = 2;
        
        if (obj_shadowgun_chase.timer == 2)
            xoffset = 0;
    }
    else
    {
        image_alpha = 0;
    }
}
