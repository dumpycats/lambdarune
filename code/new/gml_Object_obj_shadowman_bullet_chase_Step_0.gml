if (!(global.krishp <= 0))
{
    if (global.shadowshoot)
    {
        timer++;
        
        if (timer >= 60)
            image_alpha -= 0.05;
        
        if (image_xscale > 0)
            speed -= 0.06;
        
        if (image_xscale < 0)
            speed += 0.06;
        
        if (image_alpha == 0)
            instance_destroy();
        
        if (place_meeting(x, y, obj_SOUL_chase) && image_alpha > 0.25 && !obj_SOUL_chase.immune)
        {
            obj_SOUL_chase.hurt = true;
            instance_destroy();
        }
    }
}

if (global.krishp <= 0)
    speed = 0;
