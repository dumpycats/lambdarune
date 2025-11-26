depth = -y - 20;

if (!triggered)
{
    xx = x;
    yy = y;
}
else
{
    speed = 0;
    percent1++;
    
    if (percent1 <= 35)
    {
        var position = animcurve_channel_evaluate(curvelinear, percent1 / 35);
        y = lerp(yy, targety, position);
        x = lerp(xx, targetx, position);
    }
    else if (percent1 == 36)
    {
        image_speed = 0;
        image_index = 0;
    }
}

if (x <= 590 && !triggered)
{
    speed = 0;
    triggered = true;
}
