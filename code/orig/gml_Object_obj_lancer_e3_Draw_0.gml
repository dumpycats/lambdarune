draw_self();
var hole = obj_lhole_1;

if (obj_ralseiroom.alpha <= 0)
    draw_sprite_ext(spr_ralseiroom_overlay, 0, 320, 240, 1, 1, 0, c_white, 1);

if (triggerup)
{
    percent1++;
    
    if (percent1 <= 20)
    {
        if (percent1 == 3)
            image_speed = 1;
        
        var position = animcurve_channel_evaluate(curveslower, percent1 / 20);
        y = lerp(yy, 230, position);
    }
    else
    {
        percent2++;
        var position2 = animcurve_channel_evaluate(curvefaster, percent2 / 12);
        y = lerp(230, 260, position2);
        
        if (percent2 >= 12)
        {
            image_index = 3;
            image_speed = 0;
        }
        
        if (percent2 == 32)
        {
            with (obj_ch3_epilogue_text)
            {
                talking = true;
                dialogue = 23;
                reset_dialogue_normal();
            }
            
            triggerup = false;
        }
    }
}

if (triggerright)
{
    percent3++;
    
    if (percent3 <= 10)
    {
        var position3 = animcurve_channel_evaluate(curvelinear, percent3 / 10);
        x = lerp(xx, xx + 70, position3);
    }
}

depth = -y;
