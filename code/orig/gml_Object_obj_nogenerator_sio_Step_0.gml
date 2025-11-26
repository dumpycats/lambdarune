timer++;

if ((timer % 90) == 0)
{
    var a1 = instance_create_depth(272, 0, -399, obj_minitv_wall);
    a1.change = false;
    a1.direction = -90;
    var a2 = instance_create_depth(306, 0, -399, obj_minitv_wall);
    a2.change = true;
    a2.direction = -90;
    var a3 = instance_create_depth(340, 0, -399, obj_minitv_wall);
    a3.change = false;
    a3.direction = -90;
    var a4 = instance_create_depth(374, 0, -399, obj_minitv_wall);
    a4.change = true;
    a4.direction = -90;
    var a5 = instance_create_depth(408, 0, -399, obj_minitv_wall);
    a5.change = false;
    a5.direction = -90;
    a1.speed = 4;
    a2.speed = 4;
    a3.speed = 4;
    a4.speed = 4;
    a5.speed = 4;
}
else if ((timer % 45) == 0)
{
    var a1 = instance_create_depth(272, 0, -399, obj_minitv_wall);
    a1.change = true;
    a1.direction = -90;
    var a2 = instance_create_depth(306, 0, -399, obj_minitv_wall);
    a2.change = false;
    a2.direction = -90;
    var a3 = instance_create_depth(340, 0, -399, obj_minitv_wall);
    a3.change = true;
    a3.direction = -90;
    var a4 = instance_create_depth(374, 0, -399, obj_minitv_wall);
    a4.change = false;
    a4.direction = -90;
    var a5 = instance_create_depth(408, 0, -399, obj_minitv_wall);
    a5.change = true;
    a5.direction = -90;
    a1.speed = 4;
    a2.speed = 4;
    a3.speed = 4;
    a4.speed = 4;
    a5.speed = 4;
}

if (!instance_exists(obj_bulletboard_sio))
    instance_destroy();
