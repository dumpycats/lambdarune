timer++;
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!global.alldown)
{
    randomize();
    var randomspeed = random_range(4.2, 5.5);
    
    if (speed > 0)
    {
        if (!trigger1 && x >= (cx + 292))
        {
            var sym1 = instance_create_depth(cx + 292, cy + 60, -405, obj_symbols_c3);
            sym1.speed = randomspeed;
            sym1.direction = -90;
            trigger1 = true;
            
            if (purple)
                sym1.pull = 2;
        }
        
        if (!trigger2 && x >= (cx + 345))
        {
            var sym2 = instance_create_depth(cx + 345, cy + 60, -405, obj_symbols_c3);
            sym2.speed = randomspeed;
            sym2.direction = -90;
            trigger2 = true;
            
            if (purple)
                sym2.pull = 2;
        }
    }
    else
    {
        if (!trigger1 && x <= (cx + 292))
        {
            var sym1 = instance_create_depth(cx + 292, cy + 280, -405, obj_symbols_c3);
            sym1.speed = randomspeed;
            sym1.direction = 90;
            
            if (purple)
                sym1.pull = 2;
            
            trigger1 = true;
        }
        
        if (!trigger2 && x <= (cx + 345))
        {
            var sym2 = instance_create_depth(cx + 345, cy + 280, -405, obj_symbols_c3);
            sym2.speed = randomspeed;
            sym2.direction = 90;
            
            if (purple)
                sym2.pull = 2;
            
            trigger2 = true;
        }
    }
}
else
{
    speed = 0;
}

draw_self();
