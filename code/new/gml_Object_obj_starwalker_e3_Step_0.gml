depth = -y;

if (!triggered)
{
    xx = x;
    yy = y;
}
else
{
    speed = 0;
    percent1++;
    
    if (percent1 <= 45)
    {
        var position = animcurve_channel_evaluate(curvelinear, percent1 / 45);
        y = lerp(yy, targety, position);
        x = lerp(xx, targetx, position);
    }
    else if (percent1 == 46)
    {
        sprite_index = spr_starwalker;
        image_speed = 0;
        image_index = 0;
    }
}

if (x <= 580 && !triggered)
{
    speed = 0;
    triggered = true;
}
