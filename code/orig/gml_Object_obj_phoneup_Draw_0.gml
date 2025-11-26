timer++;
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
depth = obj_bulletboard_sof_end.depth + 1;

if (!global.alldown)
{
    if (up)
        x -= (8 * randommultiplier);
    else if (timer > 5)
        x += (8 * randommultiplier);
    
    if (timer == randomtimer)
    {
        if (up)
        {
            var up1 = instance_create_depth(cam_x + 680, cam_y + 420, depth, obj_phoneup);
            up1.up = true;
            
            if (!pull)
                up1.pull = true;
            else
                up1.pull = false;
        }
        else
        {
            var down = instance_create_depth(cam_x - 40, cam_y + 60, depth, obj_phoneup);
            down.image_angle = 180;
            
            if (!pull)
                down.pull = true;
            else
                down.pull = false;
        }
    }
    
    shottimer = 0;
    
    if (up)
    {
        if (x < (cam_x + 355) && x > (cam_x + 320))
        {
            if (!shot1)
            {
                var shootup = instance_create_depth(cam_x + 355, y, SOUL.depth - 1, obj_symbols);
                shootup.up = true;
                shot1 = true;
                
                if (pull)
                    shootup.pull = 2;
            }
        }
        
        if (x < (cam_x + 320) && x > (cam_x + 285))
        {
            if (!shot2)
            {
                var shootup = instance_create_depth(cam_x + 320, y, SOUL.depth - 1, obj_symbols);
                shootup.up = true;
                shot2 = true;
                
                if (pull)
                    shootup.pull = 2;
            }
        }
        
        if (x < (cam_x + 285) && x > (cam_x + 250))
        {
            if (!shot3)
            {
                var shootup = instance_create_depth(cam_x + 285, y, SOUL.depth - 1, obj_symbols);
                shootup.up = true;
                shot3 = true;
                
                if (pull)
                    shootup.pull = 2;
            }
        }
    }
    
    if (up && x < (cam_x + 0))
    {
        shot1 = false;
        shot2 = false;
        shot3 = false;
    }
}

if (image_alpha <= 0)
    instance_destroy();

draw_self();
