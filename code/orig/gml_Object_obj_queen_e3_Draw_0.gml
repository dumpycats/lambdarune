draw_self();
var hole = obj_lhole_1;
draw_sprite_ext(spr_ralseiroom_overlay, 0, 320, 240, 1, 1, 0, c_white, 1);

if (triggerup)
{
    percent1++;
    
    if (percent1 <= 20)
    {
        image_speed = 2;
        obj_lancer_e3.image_index = 1;
        var position = animcurve_channel_evaluate(curveslower, percent1 / 20);
        y = lerp(yy, 200, position);
    }
    else
    {
        percent2++;
        var position2 = animcurve_channel_evaluate(curvefaster, percent2 / 12);
        y = lerp(200, 230, position2);
        
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
                dialogue = 30;
                reset_dialogue_normal();
            }
            
            triggerup = false;
        }
    }
}

if (jump)
{
    percent3++;
    
    if (percent3 == 1)
    {
        image_speed = -2;
        audio_play_sound(snd_jump_bc, 1, false, 0.4);
    }
    
    if (percent3 <= 8)
    {
        var position = animcurve_channel_evaluate(curveslower, percent3 / 8);
        y = lerp(230, 190, position);
    }
    else
    {
        depth = obj_queen_box.depth - 2;
        percent4++;
        var position2 = animcurve_channel_evaluate(curvefaster, percent4 / 30);
        y = lerp(190, yy, position2);
    }
    
    if (percent4 == 35)
    {
        obj_susie_e3.sprite_index = sSusieWalkLeft;
        obj_susie_e3.image_speed = 0.6;
        obj_susie_e3.speed = 4;
        obj_susie_e3.direction = 135;
    }
    
    if (percent4 == 54)
    {
        obj_susie_e3.direction = 180;
        obj_queen_box.depth = obj_susie_e3.depth - 20;
    }
    
    if (percent4 == 95)
    {
        obj_susie_e3.image_speed = 0;
        obj_susie_e3.image_index = 0;
        obj_susie_e3.speed = 0;
        obj_susie_e3.sprite_index = sSusieWalkDown;
    }
    
    if (percent4 == 106)
    {
        obj_susie_e3.sprite_index = spr_susie_reach;
        obj_susie_e3.image_speed = 1;
        audio_play_sound(snd_bump, 1, false);
    }
    
    if (percent4 == 121)
    {
        with (obj_ch3_epilogue_text)
        {
            talking = true;
            dialogue = 63;
            reset_dialogue_normal();
        }
        
        jump = false;
    }
}
