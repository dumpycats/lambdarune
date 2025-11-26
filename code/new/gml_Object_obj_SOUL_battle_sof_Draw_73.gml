if (purple && !ending)
{
    draw_sprite_ext(spr_SOUL_battle, 0, x, y, scaleoffset * divider, scaleoffset * divider, 0, darkpurplecolor, 1 / divider);
    
    if ((keyboard_check(vk_enter) || keyboard_check(ord("Z"))) && moving)
    {
        if (!audio_is_playing(snd_stringpull))
        {
            if (!stringstop)
                audio_play_sound(snd_stringpull, 1, true, 1.2);
            else
                audio_stop_sound(snd_stringpull);
        }
        
        if (instance_exists(obj_battle_sof))
        {
            if (global.alldown)
            {
                audio_stop_sound(snd_stringpull);
                image_speed = 0;
                speed = 0;
            }
            else
            {
                pullpercent += (1/3);
            }
        }
    }
    else
    {
        audio_stop_sound(snd_stringpull);
        
        if (instance_exists(obj_battle_sof))
        {
            if (global.alldown)
            {
                image_speed = 0;
                speed = 0;
            }
            else
            {
                pullpercent -= (1/3);
            }
        }
    }
    
    var positionx = animcurve_channel_evaluate(curve1, pullpercent);
    var delta_divider = 1;
    divider = 1 + (delta_divider * positionx);
    var delta_scale = -0.17000000000000004;
    scale = 1 + (delta_scale * positionx);
    pullpercent = clamp(pullpercent, 0, 1);
    divider = clamp(divider, 1, 2);
    
    if (instance_exists(obj_battle_sof))
    {
        if (global.alldown)
        {
        }
        else
        {
            time = current_time / 1000;
        }
    }
    
    scaleoffset = 0.8 + (sin(time * 4) * 0.07);
    image_xscale = scale;
    image_yscale = scale;
}
else
{
    scale = 1;
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
