x = xx + xoffset;
floattimer += (1 * floatmultiplier);
y = yy + (sin((floattimer / 100) * (2 * pi)) * 10) + yoffset + yoffset2;

if (falltrigger)
{
    percent1++;
    
    if (percent1 <= 100)
    {
        var position = animcurve_channel_evaluate(curvefaster, percent1 / 60);
        yoffset2 = lerp(0, 350, position);
    }
}
