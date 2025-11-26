timer++;

if (timer <= 10)
    image_alpha += 0.1;

if (timer > 50)
{
    image_alpha -= 0.1;
    
    if (instance_exists(obj_cablecutscenepull_1))
    {
        obj_cablecutscenepull_1.speed -= 1;
        obj_cablecutscenepull_1.speed = clamp(obj_cablecutscenepull_1.speed, -12, 12);
    }
    
    if (instance_exists(obj_cablecutscenepull_2))
    {
        obj_cablecutscenepull_2.speed += 1;
        obj_cablecutscenepull_2.speed = clamp(obj_cablecutscenepull_2.speed, -12, 12);
    }
}

image_alpha = clamp(image_alpha, 0, 1);
