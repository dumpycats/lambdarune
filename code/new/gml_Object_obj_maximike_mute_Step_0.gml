if (obj_battle_sio.textmenu)
    fadeout = true;

if (fadeout)
{
    image_alpha -= (1/15);
    
    if (image_alpha < 0)
        instance_destroy();
}
