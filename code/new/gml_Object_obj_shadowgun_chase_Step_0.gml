if (global.krishp <= 0)
{
    image_speed = 0;
    speed = 0;
    exit;
}

if (!(global.krishp <= 0))
{
    if (!global.shadowshoot)
        image_alpha = 0;
    
    if (global.shadowshoot)
    {
        image_alpha = 1;
        truetimer++;
        
        if (truetimer <= 56)
        {
            timer++;
            randomize();
            image_alpha = 1;
            obj_shadowman.sprite_index = spr_shadowman_shoot;
            var random_angle;
            
            if (timer == 1)
            {
                if (image_xscale > 0)
                    random_angle = random_range(-40, 10);
                
                if (image_xscale < 0)
                    random_angle = random_range(40, -10);
                
                var pitchrandom = random_range(1.05, 1);
                var bullet = instance_create_depth(x, y, depth + 1, obj_shadowman_bullet_chase);
                audio_play_sound(snd_bulletshot, 1, false, 0, false, pitchrandom);
                bullet.image_angle = random_angle;
                bullet.image_xscale = image_xscale;
                bullet.direction = random_angle;
                
                if (image_xscale > 0)
                    bullet.speed = -8;
                
                if (image_xscale < 0)
                    bullet.speed = 8;
                
                if (instance_exists(obj_shadowman_bullet_chase))
                    obj_shadowgun_chase.image_index = 1;
            }
            
            if (timer == 2)
                obj_shadowgun_chase.image_index = 1;
            
            if (timer == 3)
                obj_shadowgun_chase.image_index = 0;
            
            if (timer == 6)
            {
                obj_shadowgun_chase.image_index = 0;
                timer = 0;
            }
            
            if (timer == 1)
            {
                image_angle = random_angle;
                direction = random_angle;
                speed = -6;
            }
            
            if (timer == 2)
                speed = 0;
        }
        
        if (truetimer > 56)
        {
            image_alpha = 0;
            timer = 0;
            obj_shadowman.sprite_index = spr_shadowman_reload;
            
            if (truetimer == 81)
                truetimer = 0;
        }
    }
}
