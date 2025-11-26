if (global.nohit)
{
    if (!instance_exists(obj_kreid_nohitcheck))
        instance_create_depth(x, y, -1000, obj_kreid_nohitcheck);
    
    global.c3kreidnohit = true;
}
