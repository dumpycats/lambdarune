if (image_xscale > 0)
{
    xoffset = -53;
    
    if (!(timer == 1))
    {
        x = xx + xoffset;
        y = yy;
    }
}

if (image_xscale < 0)
{
    xoffset = 53;
    
    if (!(timer == 1))
    {
        x = xx + xoffset;
        y = yy;
    }
}
