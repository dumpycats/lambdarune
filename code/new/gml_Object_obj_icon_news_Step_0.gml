var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));

if (place_meeting(x, y, obj_SOUL_promo))
{
    image_index = 1;
    image_blend = halfblack;
    touchtimer++;
    
    if (touchtimer == 1)
        audio_play_sound(snd_menumove, 1, false);
    
    percentsmall = 0;
    percentbig += (1/15);
    var position1 = animcurve_channel_evaluate(curve, percentbig);
    var _start1 = image_xscale;
    var _end1 = 1.25;
    var _distance1 = _end1 - _start1;
    image_xscale = _start1 + (_distance1 * position1);
    var position2 = animcurve_channel_evaluate(curve, percentbig);
    var _start2 = image_yscale;
    var _end2 = 1.25;
    var _distance2 = _end2 - _start2;
    image_yscale = _start2 + (_distance2 * position2);
    
    if (global.accessible && advance_pressed)
        url_open(translation_get_string("obj_icon_news_Step_0_0"));
}
else
{
    touchtimer = 0;
    image_index = 0;
    image_blend = c_white;
    percentbig = 0;
    percentsmall += (1/15);
    var position1 = animcurve_channel_evaluate(curve, percentsmall);
    var _start1 = image_xscale;
    var _end1 = 1;
    var _distance1 = _end1 - _start1;
    image_xscale = _start1 + (_distance1 * position1);
    var position2 = animcurve_channel_evaluate(curve, percentsmall);
    var _start2 = image_yscale;
    var _end2 = 1;
    var _distance2 = _end2 - _start2;
    image_yscale = _start2 + (_distance2 * position2);
}

var time = current_time / 1000;
y = yy + (sin(time + 0.5969026041820606) * 3);
image_angle = sin(time * 0.17 * pi) * 1;
