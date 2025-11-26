if (hurt)
{
    hurttimer++;
    
    if (hurttimer == 1)
    {
        audio_play_sound(snd_hurt1, 1, false);
        global.krishp -= 22;
        global.susiehp -= 28;
        instance_create_depth(oKrisPlayerC3.x, oKrisPlayerC3.y, oKrisPlayerC3.depth - 10, obj_krisdamage);
        instance_create_depth(oSusieC3.x, oSusieC3.y, oSusieC3.depth - 10, obj_susiedamage);
        obj_krisdamage.value = 22;
        obj_susiedamage.value = 26;
    }
    
    if (!(global.krishp <= 0))
        image_speed = 1;
    
    if (hurttimer == 40)
    {
        hurt = false;
        hurttimer = 0;
        image_speed = 0;
        image_index = 0;
    }
}

if (room == rChapter3Room4)
    image_alpha = 1;

if (room == rChapter3Room3)
{
    if (global.dialogue == 7)
    {
        image_alpha += 0.066666;
        global.shadowshoot = true;
    }
}

if (!(global.krishp <= 0))
{
    if (hurt)
    {
        if (hurttimer == 1)
        {
            global.playermove = false;
            obj_cameracontroller.xoffset = -5;
            obj_cameracontroller.yoffset = -5;
        }
        
        if (hurttimer == 2)
        {
            obj_cameracontroller.xoffset = 5;
            obj_cameracontroller.yoffset = 5;
        }
        
        if (hurttimer == 3)
        {
            obj_cameracontroller.xoffset = -4;
            obj_cameracontroller.yoffset = -4;
        }
        
        if (hurttimer == 4)
        {
            obj_cameracontroller.xoffset = 2;
            obj_cameracontroller.yoffset = 2;
        }
        
        if (hurttimer == 5)
        {
            obj_cameracontroller.xoffset = 0;
            obj_cameracontroller.yoffset = 0;
            global.playermove = true;
        }
    }
}

if (room == rChapter3Room3)
{
    if (hurt)
    {
        percent1 += 0.16666666666666666;
        position1 = animcurve_channel_evaluate(curve1, percent1);
        var _start1 = 70;
        var _end1 = 0;
        var _distance1 = _end1 - _start1;
        global.cyoffset = _start1 + (_distance1 * position1);
    }
}
