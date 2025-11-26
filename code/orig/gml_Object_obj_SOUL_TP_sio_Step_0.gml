if (global.alldown)
{
    image_alpha = 0;
    exit;
}

if (add)
{
    image_alpha = 1;
    image_speed = 1;
    image_index = 0;
    addtimer = 0;
    adding = true;
    add = false;
}

if (adding)
{
    addtimer++;
    
    if (addtimer == 1)
    {
        audio_play_sound(snd_graze, 1, false);
        var addvalue = irandom_range(1, 1);
        global.tp += addvalue;
    }
    
    if (image_index >= 9)
    {
        image_speed = 0;
        adding = false;
    }
}
else
{
    image_index = 0;
    image_alpha = 0;
}
