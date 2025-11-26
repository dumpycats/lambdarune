timer++;

if (timer <= 9)
{
    percent1 += 0.1111111111111111;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = xx;
    var _end = xx + 67;
    var _distance = _end - _start;
    x = _start + (_distance * position);
}

if (timer <= 6)
    y -= 2;

if (timer >= 6 && timer <= 13)
    y += 3.2857;

if (timer >= 13 && timer <= 17)
    y -= 1.75;

if (timer >= 17 && timer <= 21)
    y += 1.25;

if (timer >= 21 && timer <= 23)
    y -= 0.5;

if (timer <= 2)
    image_yscale += 0.39;

if (timer >= 35 && timer <= 48)
{
    image_yscale += 0.077;
    image_alpha -= 0.08;
    y -= 3.153846;
}
