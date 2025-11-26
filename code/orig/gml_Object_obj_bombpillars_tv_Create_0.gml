randomize();
randomindex = irandom_range(0, 4);
image_index = randomindex;

switch (image_index)
{
    case 0:
        var a = instance_create_depth(x, y + 30, depth - 1, obj_minitv_wall);
        a.direction = 180;
        a.speed = 6;
        a.change = true;
        break;
    case 1:
        var b = instance_create_depth(x, y + 15, depth - 1, obj_minitv_wall);
        b.direction = 180;
        b.speed = 6;
        b.change = true;
        break;
    case 2:
        var c = instance_create_depth(x, y, depth - 1, obj_minitv_wall);
        c.direction = 180;
        c.speed = 6;
        c.change = true;
        break;
    case 3:
        var d = instance_create_depth(x, y - 15, depth - 1, obj_minitv_wall);
        d.direction = 180;
        d.speed = 6;
        d.change = true;
        break;
    case 4:
        var e = instance_create_depth(x, y - 30, depth - 1, obj_minitv_wall);
        e.direction = 180;
        e.speed = 6;
        e.change = true;
        break;
}

speed = -6;
timer = -1;
hit = false;
tptimer = 0;
