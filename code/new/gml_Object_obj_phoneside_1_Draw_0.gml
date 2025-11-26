timer++;
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!global.alldown)
{
    randomize();
    var randomspeed = random_range(4, 5.3);
    
    if (speed > 0)
    {
        if (!trigger1 && x >= (cx + 285))
        {
            var sym1 = instance_create_depth(cx + 285, y + 10, -405, obj_symbols_c3);
            sym1.speed = randomspeed;
            sym1.direction = -90;
            
            if (pullobject == 1)
                sym1.pull = 1;
            else
                sym1.pull = 2;
            
            trigger1 = true;
        }
        
        if (!trigger2 && x >= (cx + 320))
        {
            var sym2 = instance_create_depth(cx + 320, y + 10, -405, obj_symbols_c3);
            sym2.speed = randomspeed;
            sym2.direction = -90;
            
            if (pullobject == 1)
                sym2.pull = 1;
            else
                sym2.pull = 2;
            
            trigger2 = true;
        }
        
        if (!trigger3 && x >= (cx + 355))
        {
            var sym3 = instance_create_depth(cx + 355, y + 10, -405, obj_symbols_c3);
            sym3.speed = randomspeed;
            sym3.direction = -90;
            
            if (pullobject == 1)
                sym3.pull = 1;
            else
                sym3.pull = 2;
            
            trigger3 = true;
        }
    }
    else
    {
        if (!trigger1 && x <= (cx + 285))
        {
            var sym1 = instance_create_depth(cx + 285, cy + 280, -405, obj_symbols_c3);
            sym1.speed = randomspeed;
            sym1.direction = 90;
            
            if (pullobject == 1)
                sym1.pull = 1;
            else
                sym1.pull = 2;
            
            trigger1 = true;
        }
        
        if (!trigger2 && x <= (cx + 320))
        {
            var sym2 = instance_create_depth(cx + 320, cy + 280, -405, obj_symbols_c3);
            sym2.speed = randomspeed;
            sym2.direction = 90;
            
            if (pullobject == 1)
                sym2.pull = 1;
            else
                sym2.pull = 2;
            
            trigger2 = true;
        }
        
        if (!trigger3 && x <= (cx + 355))
        {
            var sym3 = instance_create_depth(cx + 355, cy + 280, -405, obj_symbols_c3);
            sym3.speed = randomspeed;
            sym3.direction = 90;
            
            if (pullobject == 1)
                sym3.pull = 1;
            else
                sym3.pull = 2;
            
            trigger3 = true;
        }
    }
}
else
{
    speed = 0;
}

draw_self();
