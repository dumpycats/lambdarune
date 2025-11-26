slidetimer += 1;

if (slidetimer < 31)
{
    percentslide += (1/30);
    positionslide = animcurve_channel_evaluate(curveslide, percentslide);
    var _startslide = 260;
    var _endslide = 240;
    var _distanceslide = _endslide - _startslide;
    y = _startslide + (_distanceslide * positionslide);
    var _startslide1 = 0;
    var _endslide1 = 1;
    var _distanceslide1 = _endslide1 - _startslide1;
    image_alpha = _startslide1 + (_distanceslide1 * positionslide);
}

if (!gameenter && slidetimer > 31)
    fadetimer += 1;

if (image_alpha > 1)
    image_alpha = 1;

if (fadetimer < 45)
    image_alpha -= 0.0111;

if (fadetimer > 45)
    image_alpha += 0.0111;

if (fadetimer == 90)
{
    image_alpha = 1;
    fadetimer = 0;
}

if (slidetimer > 31)
{
    if (!gameenter)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            gameenter = true;
    }
}

if (gameenter)
{
    fadetimer = 0;
    percent1 += 0.011111111111111112;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = image_alpha;
    var _end = 0;
    var _distance = _end - _start;
    image_alpha = _start + (_distance * position);
}
