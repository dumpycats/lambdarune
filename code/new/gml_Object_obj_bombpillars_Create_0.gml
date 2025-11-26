randomize();
randomindex = irandom_range(0, 4);
image_speed = 1;

switch (randomindex)
{
    case 0:
        instance_create_depth(x, y + 30, depth - 1, obj_bomb);
        break;
    case 1:
        instance_create_depth(x, y + 15, depth - 1, obj_bomb);
        break;
    case 2:
        instance_create_depth(x, y, depth - 1, obj_bomb);
        break;
    case 3:
        instance_create_depth(x, y - 15, depth - 1, obj_bomb);
        break;
    case 4:
        instance_create_depth(x, y - 30, depth - 1, obj_bomb);
        break;
}

speed = -7;
obj_bomb.speed = speed;
timer = -1;
hit = false;
tptimer = 0;
