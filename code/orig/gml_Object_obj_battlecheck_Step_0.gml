if (instance_exists(obj_SOUL_shatter_c3))
{
    global.target = target;
    obj_SOUL_shatter_c3.x = x - 20;
    obj_SOUL_shatter_c3.y = y - 20;
    global.dialogue = gameoverdialogue;
    instance_destroy();
}
