if (purple)
{
    draw_sprite_ext(spr_SOUL_battle, 0, x, y, scaleoffset * divider, scaleoffset * divider, 0, darkpurplecolor, 1 / divider);
    
    if (keyboard_check(vk_enter) || keyboard_check(ord("Z")))
    {
        pullpercent += 0.2;
        obj_stringenter.image_alpha -= 0.1;
        
        if (!audio_is_playing(snd_stringpull) && !instance_exists(obj_sof_blacktransition_1))
            audio_play_sound(snd_stringpull, 1, true);
    }
    else
    {
        pullpercent -= 0.2;
        obj_stringenter.image_alpha += 0.1;
        audio_stop_sound(snd_stringpull);
    }
    
    obj_stringenter.image_alpha = clamp(obj_stringenter.image_alpha, 0.5, 1);
    var positionx = animcurve_channel_evaluate(curve1, pullpercent);
    var delta_divider = 1;
    divider = 1 + (delta_divider * positionx);
    var delta_scale = -0.17000000000000004;
    scale = 1 + (delta_scale * positionx);
    pullpercent = clamp(pullpercent, 0, 1);
    divider = clamp(divider, 1, 2);
    var time = current_time / 1000;
    scaleoffset = 0.8 + (sin(time * 4) * 0.07);
    image_xscale = scale;
    image_yscale = scale;
}

draw_self();

if (purple)
{
    if (divider > 1)
        purplecolor = make_color_rgb(213 / divider, 53 / divider, 217 / divider);
    else
        purplecolor = 14235093;
    
    image_blend = purplecolor;
}
else
{
    image_blend = c_red;
}
