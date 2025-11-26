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

if (!gameenter)
    fadetimer += 1;

if (image_alpha > 1)
    image_alpha = 1;

if (slidetimer > 31)
{
    if (!gameenter)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            audio_play_sound(AUDIO_APPEARANCE, 1, false);
            image_alpha = 1;
            gameenter = true;
        }
    }
}

if (gameenter)
{
    fadetimer = 0;
    percent1 += (1/30);
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = 240;
    var _end = 100;
    var _distance = _end - _start;
    y = _start + (_distance * position);
    image_xscale -= 0.02888;
    image_alpha -= 0.03333;
}

if (gameenter)
{
    roomtimer += 1;
    
    if (roomtimer == 105)
        room_goto(rCh3OpeningCinematic);
}

if (global.afterfirstopen)
    room_goto(rLambdaruneLogo);
