if (room == rLambdaruneLogoToC3)
    instance_destroy();

if (instance_exists(oRoomChange) && room == rm_ch3_cathodetower_final)
{
    timer++;
    
    if (timer == 0)
    {
        randomize();
        egg = irandom_range(1, 25);
        
        if (egg == 25 && !done)
            oRoomChange.roomtarget = rm_ch3_theatre;
    }
}
else
{
    timer = -1;
}
