var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var green = 49152;
var white = make_color_rgb(whitecolor1, whitecolor2, whitecolor3);
draw_sprite_ext(sBlackScreen, 0, cx + 320, cy + 240, 2, 2, 0, c_white, blackalpha);

if (instance_exists(obj_harmonize_goal))
    blackalpha += (1/15);
else
    blackalpha -= (1/15);

blackalpha = clamp(blackalpha, 0, 2/3);

if (instance_exists(ENGINE))
{
    if (!global.alldown)
        timer++;
}

if (harmonizing)
{
    percentharmonyin++;
    
    if (percentharmonyin <= 25)
    {
        if (percentharmonyin == 1 && SOUL.purple == true)
        {
            obj_foane_ex_battle.sprite_index = spr_foane_ex_idle;
            
            if (!global.alldown)
                audio_play_sound(snd_bell, 1, false, 0.8);
            
            SOUL.purple = false;
        }
        
        audio_stop_sound(snd_stringpull);
        var position = animcurve_channel_evaluate(curveslower, percentharmonyin / 50);
        var positioncorrect = animcurve_channel_evaluate(curveslower, percentharmonyin / 25);
        global.leftoffset = lerp(global.leftoffset, -140, position);
        global.rightoffset = lerp(global.rightoffset, 140, position);
        global.topoffset = lerp(global.topoffset, -10, position);
        global.bottomoffset = lerp(global.bottomoffset, 30, position);
        SOUL.y = lerp(SOUL.y, cy + 230, position);
        SOUL.x = lerp(SOUL.x, cx + 320, position);
        global.harmonyfrequency = lerp(22050, 700, positioncorrect);
        obj_battle_sof.effect.cutoff = global.harmonyfrequency;
        
        if (percentharmonyin == 25)
        {
            global.leftoffset = -140;
            global.rightoffset = 140;
            global.topoffset = -10;
            global.bottomoffset = 30;
            SOUL.moving = true;
            SOUL.x = cx + 320;
            SOUL.y = cy + 230;
            instance_create_depth(cx + 320, cy + 40, -400, obj_harmonize_goal);
            
            if (global.harmonyphase == 0)
            {
                var string1 = instance_create_depth(cx + 190, cy + 89, -400, obj_harmonize_string_1);
                var string2 = instance_create_depth(cx + 320, cy + 89, -400, obj_harmonize_string_2);
                var string3 = instance_create_depth(cx + 450, cy + 89, -400, obj_harmonize_string_3);
                obj_harmonize_string_3.right = true;
            }
            else if (global.harmonyphase == 1)
            {
                var string1 = instance_create_depth(cx + 190, cy + 89, -400, obj_harmonize_string_4);
                var string2 = instance_create_depth(cx + 320, cy + 89, -400, obj_harmonize_string_5);
                var string3 = instance_create_depth(cx + 450, cy + 89, -400, obj_harmonize_string_6);
                obj_harmonize_string_4.right = true;
            }
            else if (global.harmonyphase == 2)
            {
                var string1 = instance_create_depth(cx + 190, cy + 89, -400, obj_harmonize_string_7);
                var string2 = instance_create_depth(cx + 320, cy + 89, -400, obj_harmonize_string_8);
                var string3 = instance_create_depth(cx + 450, cy + 89, -400, obj_harmonize_string_9);
                obj_harmonize_string_9.right = true;
            }
            else if (global.harmonyphase == 3)
            {
                var string1 = instance_create_depth(cx + 190, cy + 89, -400, obj_harmonize_string_10);
                var string2 = instance_create_depth(cx + 320, cy + 89, -400, obj_harmonize_string_11);
                var string3 = instance_create_depth(cx + 450, cy + 89, -400, obj_harmonize_string_12);
                obj_harmonize_string_11.right = true;
            }
            else if (global.harmonyphase >= 4)
            {
                var string1 = instance_create_depth(cx + 190, cy + 89, -400, obj_harmonize_string_13);
                var string2 = instance_create_depth(cx + 320, cy + 89, -400, obj_harmonize_string_14);
                var string3 = instance_create_depth(cx + 450, cy + 89, -400, obj_harmonize_string_15);
                obj_harmonize_string_13.right = true;
            }
        }
    }
}

if (spawn)
{
    if (timer == 17)
    {
        alpha = 0;
        image_speed = 0;
    }
    
    switch (turn)
    {
        case 1:
            endtimer = 320;
            
            if (timer < endtimer)
            {
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.ystrings = true;
                    SOUL.twostring = true;
                    SOUL.twostringspace = 9;
                }
                
                var topbottomoffset;
                
                if (!(global.topoffset == 0))
                    topbottomoffset = lerp(global.topoffset, global.bottomoffset, 0.5);
                else
                    topbottomoffset = 0;
                
                y = (cy + 170) - topbottomoffset;
                
                if (((timer + 2) % 50) == 0)
                {
                    if (!block1)
                    {
                        var r1 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r1.speed = 5;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 1;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r2.speed = 5;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 1;
                    }
                    
                    block1 = true;
                }
                else if (((timer + 2) % 25) == 0)
                {
                    if (!block2)
                    {
                        var r1 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r1.speed = 5;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 2;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r2.speed = 5;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 2;
                    }
                    
                    block2 = true;
                }
                else if ((timer % 50) == 0)
                {
                    if (!block1)
                    {
                        var r1 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r1.speed = 5;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 1;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r2.speed = 5;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 1;
                    }
                    
                    block1 = true;
                }
                else if ((timer % 25) == 0)
                {
                    if (!block2)
                    {
                        var r1 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r1.speed = 5;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 2;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r2.speed = 5;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 2;
                    }
                    
                    block2 = true;
                }
                
                if (block1)
                {
                    block1timer++;
                    
                    if (block1timer == 3)
                    {
                        block1 = false;
                        block1timer = -1;
                    }
                }
                
                if (block2)
                {
                    block2timer++;
                    
                    if (block2timer == 3)
                    {
                        block2 = false;
                        block2timer = -1;
                    }
                }
                
                if (instance_exists(obj_cable))
                    obj_cable.speed = 4 + ((timer - 90) / 45);
                
                if (timer >= 17)
                {
                    if (!global.alldown)
                        timer2++;
                }
                
                global.topoffset = 10 + (sin(((timer2 + 20) / 80) * (2 * pi)) * -10);
                global.bottomoffset = -10 + (sin(((timer2 + 20) / 80) * (2 * pi)) * 10);
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_ring);
                instance_destroy(obj_cable);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 2:
            if (timer < endtimer)
            {
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.xstrings = true;
                    SOUL.onestring = true;
                    SOUL.twostringoffset = 12;
                }
                
                if (timer == 17)
                {
                    instance_create_depth(cx + 408, cy + 70, -400, obj_connectcircle);
                    instance_create_depth(cx + 482, cy + 68, -401, obj_phone_1);
                    instance_create_depth(cx + 144, cy + 70, -402, obj_mask_shatter);
                    audio_play_sound(snd_phone, 1, false, 0.6);
                    endtimer = 380;
                }
                
                if (timer >= 17)
                {
                    if (!global.alldown)
                        percent2++;
                    
                    if (percent2 <= 26)
                    {
                        var position2 = animcurve_channel_evaluate(curveslower, percent2 / 26);
                        global.topoffset = lerp(0, 110, position2);
                        global.bottomoffset = lerp(0, 14, position2);
                    }
                }
                
                if (timer == 21)
                {
                    instance_create_depth(cx + 386, cy + 70, -400, obj_connectcircle);
                    var r1 = instance_create_depth(cx + 580, SOUL.y, -501, obj_ring);
                    r1.image_alpha = 0;
                    r1.image_angle = 90;
                    r1.speed = -7;
                    r1.pull = 1;
                    var r2 = instance_create_depth(cx + 60, SOUL.y, -501, obj_ring);
                    r2.image_alpha = 0;
                    r2.image_angle = -90;
                    r2.speed = 7;
                    r2.pull = 2;
                }
                
                if (timer >= 21)
                {
                    if (instance_exists(obj_ring))
                    {
                        obj_ring.image_alpha += 1/15;
                        
                        if (instance_exists(SOUL))
                            obj_ring.y = SOUL.y;
                    }
                }
                
                if (timer == 25)
                    instance_create_depth(cx + 364, cy + 70, -400, obj_connectcircle);
                
                if (timer == 29)
                    instance_create_depth(cx + 342, cy + 70, -400, obj_connectcircle);
                
                if (timer == 33)
                    instance_create_depth(cx + 320, cy + 70, -400, obj_connectcircle);
                
                if (timer == 37)
                    instance_create_depth(cx + 298, cy + 70, -400, obj_connectcircle);
                
                if (timer == 41)
                    instance_create_depth(cx + 276, cy + 70, -400, obj_connectcircle);
                
                if (timer == 45)
                    instance_create_depth(cx + 254, cy + 70, -400, obj_connectcircle);
                
                if (timer == 49)
                    instance_create_depth(cx + 232, cy + 70, -400, obj_connectcircle);
                
                if (timer == 66)
                {
                    instance_create_depth(cx + 320, cy + 68, -402, obj_connectx);
                    audio_play_sound(snd_glassbreak, 1, false);
                    audio_play_sound(snd_explosion_mmx3, 1, false);
                    obj_connectcircle.paused = true;
                    obj_phone_1.paused = true;
                    obj_mask_shatter.paused = true;
                    obj_connectcircle.image_blend = #3A3A3A;
                    obj_phone_1.image_blend = #3A3A3A;
                    obj_mask_shatter.image_blend = #3A3A3A;
                }
                
                if (timer > 66)
                {
                    timer2 += 2;
                    obj_connectcircle.image_blend = make_color_rgb(timer2 + 58, timer2 + 58, timer2 + 58);
                    obj_phone_1.image_blend = make_color_rgb(timer2 + 58, timer2 + 58, timer2 + 58);
                    obj_mask_shatter.image_blend = make_color_rgb(timer2 + 58, timer2 + 58, timer2 + 58);
                    timer2 = clamp(timer2, -1, 69);
                }
                
                if (timer == 90)
                {
                    instance_create_depth(cx + 540, cy + 216, -404, obj_mask_laugh);
                    instance_create_depth(cx + 100, cy + 216, -404, obj_mask_laugh_2);
                }
                
                if (timer >= 90)
                {
                    percent1++;
                    
                    if (percent1 <= 26)
                    {
                        var position = animcurve_channel_evaluate(curveslower, percent1 / 26);
                        
                        if (!global.alldown)
                        {
                            global.leftoffset = lerp(0, -20, position);
                            global.rightoffset = lerp(0, 20, position);
                        }
                    }
                }
                
                if (timer >= 120)
                {
                    percent4++;
                    
                    if (percent4 <= 180)
                    {
                        var position4 = animcurve_channel_evaluate(curvelinear, percent4 / 180);
                        
                        if (!global.alldown)
                        {
                            global.leftoffset = lerp(-20, 20, position4);
                            global.rightoffset = lerp(20, -20, position4);
                        }
                    }
                }
                
                var laugh1 = [120, 161, 190, 231, 247, 288, 316];
                
                if (array_contains(laugh1, timer))
                {
                    obj_mask_laugh.image_speed = 1;
                    obj_mask_laugh.image_index = 1;
                    audio_play_sound(snd_flealaugh, 1, false, 1.1);
                    audio_play_sound(snd_phone, 1, false, 0.66, 0, 0.66);
                    var c1 = instance_create_depth(obj_mask_laugh.x - 28, obj_mask_laugh.y - 34, -406, obj_circleblast_1);
                    c1.pull = 2;
                    
                    if (global.turn == turn)
                        c1.multiplier = 0.8;
                }
                
                var laugh2 = [140, 206, 235, 264, 305];
                
                if (array_contains(laugh2, timer))
                {
                    obj_mask_laugh_2.image_speed = 1;
                    obj_mask_laugh_2.image_index = 1;
                    audio_play_sound(snd_flealaugh, 1, false, 1.4, false, 1.1);
                    audio_play_sound(snd_phone, 1, false, 0.66, 0, 0.66);
                    var c2 = instance_create_depth(obj_mask_laugh_2.x + 28, obj_mask_laugh_2.y + 34, -406, obj_circleblast_1);
                    c2.pull = 1;
                    
                    if (global.turn == turn)
                        c2.multiplier = 0.8;
                }
                
                if (timer == (endtimer - 15))
                {
                    obj_mask_shatter.image_index = 1;
                    obj_mask_shatter.image_speed = 1;
                }
                
                if (timer >= (endtimer - 15))
                {
                    percent3++;
                    var position3 = animcurve_channel_evaluate(curveease, percent3 / 15);
                    
                    if (!global.alldown)
                    {
                        global.topoffset = lerp(110, 40, position3);
                        global.bottomoffset = lerp(14, 40, position3);
                        global.leftoffset = lerp(20, 0, position3);
                        global.rightoffset = lerp(-20, 0, position3);
                    }
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_ring);
                instance_destroy(obj_circleblast_1);
                instance_destroy(obj_connectcircle);
                instance_destroy(obj_connectx);
                instance_destroy(obj_phone_1);
                instance_destroy(obj_mask_shatter);
                instance_destroy(obj_mask_laugh);
                instance_destroy(obj_mask_laugh_2);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 3:
            if (timer < endtimer)
            {
                obj_foane_ex_battle.sprite_index = spr_foane_ex_puppetry;
                
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.xstrings = true;
                    SOUL.twostring = true;
                    SOUL.twostringspace = 8;
                }
                
                if (timer == 17)
                {
                    instance_create_depth(cx + 490, cy + 146, -400, obj_tenna_puppet);
                    instance_create_depth(cx + 150, cy + 146, -400, obj_loomi_puppet);
                    endtimer = 330;
                }
                
                if (timer >= 17 && timer <= 47)
                {
                    percent1++;
                    var position = animcurve_channel_evaluate(curveease, percent1 / 28);
                    global.leftoffset = lerp(0, 63, position);
                    global.rightoffset = lerp(0, -63, position);
                }
                
                if (timer >= 130 && timer <= 158)
                {
                    percent2++;
                    var position2 = animcurve_channel_evaluate(curveease, percent2 / 28);
                    global.leftoffset = lerp(63, -20, position2);
                    global.rightoffset = lerp(-63, 20, position2);
                }
                
                if (timer >= (endtimer - 28))
                {
                    percent3++;
                    var position3 = animcurve_channel_evaluate(curveease, percent3 / 28);
                    global.leftoffset = lerp(-20, 0, position3);
                    global.rightoffset = lerp(20, 0, position3);
                }
                
                if (timer >= 17)
                {
                    loominah++;
                    tennanah++;
                }
                
                var tennabruh = [27, 54, 81, 148, 165, 185, 205, 220, 235, 250, 265, 280, 295];
                
                if (array_contains(tennabruh, timer))
                {
                    tennanah = -1;
                    
                    if (instance_exists(obj_tenna_puppet))
                        obj_tenna_puppet.shift = true;
                    
                    audio_play_sound(snd_tenna, 1, false);
                    
                    if (!(timer == 165) && !(timer == 235) && !(timer == 265) && !(timer == 295))
                    {
                        var r1 = instance_create_depth(cx + 490, cy + 143, -401, obj_ring_size);
                        r1.image_alpha = 0;
                        r1.image_angle = 90;
                        r1.speed = -6;
                        r1.pull = 1;
                    }
                    
                    if (!(timer == 54) && !(timer == 185) && !(timer == 220) && !(timer == 250) && !(timer == 280))
                    {
                        var r2 = instance_create_depth(cx + 490, cy + 197, -401, obj_ring_size);
                        r2.image_alpha = 0;
                        r2.image_angle = 90;
                        r2.speed = -6;
                        r2.pull = 1;
                    }
                }
                else if (tennanah == 15)
                {
                    if (instance_exists(obj_tenna_puppet))
                        obj_tenna_puppet.shift = false;
                }
                
                var loomilol = [27, 54, 81, 138, 150, 162, 174, 186, 210, 222, 234, 246, 260, 268, 276, 284, 292, 300];
                var loomib = [138, 150, 162, 174, 186, 210, 222, 234, 246];
                
                if (array_contains(loomilol, timer))
                {
                    loominah = -1;
                    
                    if (instance_exists(obj_loomi_puppet))
                        obj_loomi_puppet.shift = true;
                    
                    var r3;
                    
                    if (!(timer == 27))
                    {
                        audio_play_sound(snd_loomi, 1, false, 1.9, false, 1.1);
                        r3 = instance_create_depth(cx + 150, cy + 143, -401, obj_ring_size);
                        r3.image_alpha = 0;
                        r3.image_angle = -90;
                        r3.speed = 6;
                        r3.pull = 2;
                    }
                    
                    var r4;
                    
                    if (!(timer == 81))
                    {
                        r4 = instance_create_depth(cx + 150, cy + 197, -401, obj_ring_size);
                        r4.image_alpha = 0;
                        r4.image_angle = -90;
                        r4.speed = 6;
                        r4.pull = 2;
                    }
                    
                    if (array_contains(loomib, timer))
                    {
                        randomize();
                        var randomspeed = irandom_range(4, 6);
                        r3.image_angle = irandom_range(-120, -125);
                        r4.image_angle = irandom_range(-60, -55);
                        r3.speed = randomspeed;
                        r4.speed = randomspeed;
                        r3.bounce = true;
                        r4.bounce = true;
                    }
                }
                else if (loominah == 15)
                {
                    if (instance_exists(obj_loomi_puppet))
                        obj_loomi_puppet.shift = false;
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_loomi_puppet);
                instance_destroy(obj_tenna_puppet);
                instance_destroy(obj_ring_size);
                instance_destroy(obj_circleblast_1);
                instance_destroy(obj_connectcircle);
                instance_destroy(obj_connectx);
                instance_destroy(obj_phone_1);
                instance_destroy(obj_mask_shatter);
                instance_destroy(obj_mask_laugh);
                instance_destroy(obj_mask_laugh_2);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 4:
            if (timer < endtimer)
            {
                obj_foane_ex_battle.sprite_index = spr_foane_ex_incoming;
                
                if (instance_exists(SOUL))
                {
                    if (timer == 1 || timer == 2)
                    {
                        SOUL.purple = true;
                        SOUL.ystrings = true;
                        SOUL.twostring = true;
                    }
                }
                
                if (timer == 17)
                {
                    endtimer = 400;
                    instance_create_depth(cx + 450, cy + 90, -401, obj_phone_2);
                    obj_phone_2.paused = false;
                    audio_play_sound(snd_phone, 1, false);
                }
                
                if (((timer + 7) % 20) == 0 && timer >= 27 && timer <= (endtimer - 40))
                {
                    if (timer <= 200)
                    {
                        var b1 = instance_create_depth(cx + 289, cy + 250 + global.topoffset, -400, obj_bigspike);
                        b1.speed = 4;
                        b1.direction = 90;
                        b1.image_angle = 90;
                        b1.pull = 2;
                        var b2 = instance_create_depth(cx + 348, (cy + 250) - global.topoffset, -400, obj_bigspike);
                        b2.speed = 4;
                        b2.direction = -90;
                        b2.image_angle = -90;
                        b2.pull = 2;
                    }
                    else
                    {
                        var b3 = instance_create_depth(cx + 220, cy + 250, -400, obj_bigspike);
                        b3.speed = 6;
                        b3.pull = 2;
                    }
                }
                
                if (instance_exists(obj_phone_2))
                {
                    if (obj_phone_2.trigger)
                    {
                        if (obj_phone_2.characterpick == 0)
                        {
                            if ((timer % 15) == 0 && timer <= 175)
                            {
                                instance_create_depth(obj_phone_2.x - 120, obj_phone_2.y, -405, obj_spade);
                                audio_play_sound(snd_spearappear, 1, false);
                            }
                        }
                        else if (obj_phone_2.characterpick == 6)
                        {
                            if (((timer - 10) % 66) == 0 && timer <= (endtimer - 80))
                            {
                                instance_create_depth((cx + 320) - 126, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth((cx + 320) - 84, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth((cx + 320) - 42, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth(cx + 320 + 42, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth(cx + 320 + 84, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth(cx + 320 + 126, obj_phone_2.y + 40, -405, obj_box_c3);
                                audio_play_sound(snd_impact_bc, 1, false);
                            }
                            else if (((timer - 10) % 44) == 0 && timer <= (endtimer - 80))
                            {
                                instance_create_depth((cx + 320) - 126, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth((cx + 320) - 42, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth(cx + 320 + 42, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth(cx + 320 + 126, obj_phone_2.y + 40, -405, obj_box_c3);
                                audio_play_sound(snd_impact_bc, 1, false);
                            }
                            else if (((timer - 10) % 22) == 0 && timer <= (endtimer - 80))
                            {
                                instance_create_depth((cx + 320) - 84, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth(cx + 320, obj_phone_2.y + 40, -405, obj_box_c3);
                                instance_create_depth(cx + 320 + 84, obj_phone_2.y + 40, -405, obj_box_c3);
                                audio_play_sound(snd_impact_bc, 1, false);
                            }
                        }
                    }
                }
                
                if (timer >= 17 && timer <= 37)
                {
                    percent1++;
                    var position = animcurve_channel_evaluate(curveease, percent1 / 20);
                    global.topoffset = lerp(0, 120, position);
                    global.bottomoffset = lerp(0, 40, position);
                }
                
                if (timer == 37)
                {
                    obj_phone_2.trigger = true;
                    obj_phone_2.paused = true;
                    audio_play_sound(snd_noise, 1, false);
                    randomize();
                    obj_phone_2.characterid = irandom_range(0, 100);
                    
                    if (obj_phone_2.characterid == 66)
                        obj_phone_2.characterpick = 66;
                    else
                        obj_phone_2.characterpick = 0;
                }
                
                if (timer == 200)
                {
                    SOUL.xstrings = true;
                    SOUL.ystrings = false;
                    SOUL.twostring = false;
                    SOUL.onestring = true;
                    SOUL.twostringspace = 0;
                    SOUL.twostringoffset = 0;
                    SOUL.x = cx + 320;
                    SOUL.stringoption = 1;
                    instance_destroy(obj_spade);
                    var sm = instance_create_depth(cx + 320, cy + 250, -404, obj_staticsmall);
                    sm.image_xscale = 0.75;
                    sm.image_yscale = 0.35;
                    sm.image_alpha = 1;
                    sm.image_blend = c_fuchsia;
                    obj_phone_2.trigger = false;
                    obj_phone_2.paused = false;
                    audio_play_sound(snd_phone, 1, false);
                }
                
                if (instance_exists(obj_staticsmall))
                {
                    obj_staticsmall.x = cx + 320;
                    obj_staticsmall.y = cy + 250;
                }
                
                if (timer == 220)
                {
                    instance_destroy(obj_staticsmall);
                    obj_phone_2.trigger = true;
                    obj_phone_2.paused = true;
                    audio_play_sound(snd_noise, 1, false);
                    randomize();
                    obj_phone_2.characterid = irandom_range(0, 100);
                    
                    if (obj_phone_2.characterid == 66)
                        obj_phone_2.characterpick = 66;
                    else
                        obj_phone_2.characterpick = 6;
                }
                
                if (timer >= (endtimer - 20))
                {
                    percent2++;
                    var position2 = animcurve_channel_evaluate(curveease, percent2 / 20);
                    global.topoffset = lerp(120, 40, position2);
                    global.bottomoffset = lerp(40, 40, position2);
                    
                    if (instance_exists(obj_bigspike))
                        obj_bigspike.image_alpha -= 0.16666666666666666;
                }
                
                if (timer == (endtimer - 20))
                {
                    obj_phone_2.trigger = false;
                    obj_phone_2.paused = false;
                    audio_play_sound(snd_phone, 1, false);
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_garbage);
                instance_destroy(obj_spade);
                instance_destroy(obj_bigspike);
                instance_destroy(obj_loomi_puppet);
                instance_destroy(obj_tenna_puppet);
                instance_destroy(obj_ring_size);
                instance_destroy(obj_circleblast_1);
                instance_destroy(obj_connectcircle);
                instance_destroy(obj_connectx);
                instance_destroy(obj_phone_1);
                instance_destroy(obj_phone_2);
                instance_destroy(obj_mask_shatter);
                instance_destroy(obj_mask_laugh);
                instance_destroy(obj_mask_laugh_2);
                instance_destroy(obj_box_c3);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 5:
            endtimer = 410;
            
            if (timer < endtimer)
            {
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.ystrings = true;
                    SOUL.twostring = true;
                    SOUL.twostringspace = 9;
                }
                
                percent1++;
                
                if (!global.alldown)
                {
                    if (percent1 <= (endtimer - 20))
                    {
                        var position = animcurve_channel_evaluate(curveease, percent1 / (endtimer - 20));
                        global.topoffset = lerp(0, 30, position);
                        global.bottomoffset = lerp(0, -30, position);
                    }
                    else if (percent2 <= endtimer)
                    {
                        percent2++;
                        var position = animcurve_channel_evaluate(curveease, percent2 / 20);
                        global.topoffset = lerp(30, 0, position);
                        global.bottomoffset = lerp(-30, 0, position);
                    }
                }
                
                if (timer == 1 || timer == 2)
                {
                    instance_create_depth(cx + 320, cy + 50, -400, obj_lines_c3_1);
                    instance_create_depth(cx + 320, cy + 290, -400, obj_lines_c3_1);
                }
                
                draw_set_color(c_white);
                draw_set_font(fDeterminationMW);
                
                if (timer >= 280)
                {
                    if (instance_exists(obj_lines_c3_1))
                        obj_lines_c3_1.alpha -= 0.1;
                }
                
                if (((timer - 4) % 40) == 0 && timer <= 235)
                {
                    var right1 = instance_create_depth(cx + -25, cy + 50, -403, obj_phoneside);
                    right1.image_angle = -90;
                    
                    if (!global.alldown)
                        right1.speed = 12;
                    
                    if (((timer - 12) % 80) == 0 && timer <= 250)
                        right1.purple = true;
                }
                
                if (((timer - 22) % 40) == 0 && timer <= 250)
                {
                    var left1 = instance_create_depth(cx + 665, cy + 290, -406, obj_phoneside);
                    left1.image_angle = 90;
                    
                    if (!global.alldown)
                        left1.speed = -12;
                    
                    if (((timer - 22) % 80) == 0 && timer <= 250)
                        left1.purple = true;
                }
                
                if (timer >= 260 && (timer % 60) == 0 && timer <= 370)
                {
                    var down = instance_create_depth(cx + 345, cy + -20, SOUL.depth - 1, obj_signalburst_c3);
                    down.direction = -90;
                    down.speed = 6 + counter;
                    down.vertical = true;
                    counter += 0.5;
                }
                else if (timer >= 260 && (timer % 30) == 0 && timer <= 370)
                {
                    var down = instance_create_depth(cx + 295, cy + -20, SOUL.depth - 1, obj_signalburst_c3);
                    down.direction = -90;
                    down.speed = 6 + counter;
                    down.vertical = true;
                    down.pull = 2;
                    counter += 0.5;
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_symbols_c3);
                instance_destroy(obj_phoneside);
                instance_destroy(obj_lines_c3_1);
                instance_destroy(obj_ring);
                instance_destroy(obj_cable);
                instance_destroy(obj_signalburst_c3);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 6:
            endtimer = 400;
            
            if (timer < endtimer)
            {
                obj_foane_ex_battle.sprite_index = spr_foane_ex_ringtone;
                
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.xstrings = true;
                    SOUL.twostringspace = 0;
                    SOUL.twostringoffset = 0;
                }
                
                if (!(global.leftoffset == 0))
                    var leftrightoffset = lerp(global.leftoffset, global.rightoffset, 0.5);
                else
                    var leftrightoffset = 0;
                
                var topbottomoffset;
                
                if (!(global.topoffset == 0))
                    topbottomoffset = lerp(global.topoffset, global.bottomoffset, 0.5);
                else
                    topbottomoffset = 0;
                
                if (timer >= 17)
                {
                    percent1++;
                    
                    if (percent1 <= 15)
                    {
                        var position = animcurve_channel_evaluate(curveslower, percent1 / 15);
                        global.leftoffset = lerp(0, -60, position);
                        global.rightoffset = lerp(0, 60, position);
                        global.topoffset = sin(((timer - 17) / 100) * (2 * pi)) * 4;
                        global.bottomoffset = sin(((timer - 17) / 100) * (2 * pi)) * -4;
                    }
                    else if (timer >= (endtimer - 16))
                    {
                        percent2++;
                        var position = animcurve_channel_evaluate(curveease, percent2 / 15);
                        global.leftoffset = lerp(-60, 0, position);
                        global.rightoffset = lerp(60, 0, position);
                        global.topoffset = lerp(global.topoffset, 0, position);
                        global.bottomoffset = lerp(global.bottomoffset, 0, position);
                        
                        if (instance_exists(obj_songnote_c3))
                            obj_songnote_c3.image_alpha -= 0.1;
                    }
                    else if (timer < endtimer)
                    {
                        global.topoffset = sin(((timer - 17) / 100) * (2 * pi)) * 4;
                        global.bottomoffset = sin(((timer - 17) / 100) * (2 * pi)) * -4;
                    }
                }
                
                if (((timer + 2) % 45) == 0)
                {
                    var s1 = instance_create_depth(cx + 400 + 60, cy + 170 + topbottomoffset, -401, obj_songnote_c3);
                    s1.speed = -3;
                }
                else if (((timer + 2) % 30) == 0)
                {
                    var s1 = instance_create_depth(cx + 400 + 60, cy + 170 + topbottomoffset, -401, obj_songnote_c3);
                    s1.speed = -3;
                    s1.pull = 2;
                }
                else if (((timer + 2) % 15) == 0)
                {
                    var s1 = instance_create_depth(cx + 400 + 60, cy + 170 + topbottomoffset, -401, obj_songnote_c3);
                    s1.speed = -3;
                }
                
                if (((timer + 2) % 45) == 0)
                {
                    var s2 = instance_create_depth((cx + 240) - 60, cy + 132 + topbottomoffset, -401, obj_songnote_c3);
                    s2.speed = 3;
                    s2.image_xscale = -1;
                    s2.pull = 2;
                    s2.xscalemultiplier = -1;
                }
                else if (((timer + 2) % 30) == 0)
                {
                    var s2 = instance_create_depth((cx + 240) - 60, cy + 132 + topbottomoffset, -401, obj_songnote_c3);
                    s2.speed = 3;
                    s2.image_xscale = -1;
                }
                else if (((timer + 2) % 15) == 0)
                {
                    var s2 = instance_create_depth((cx + 240) - 60, cy + 132 + topbottomoffset, -401, obj_songnote_c3);
                    s2.speed = 3;
                    s2.image_xscale = -1;
                    s2.pull = 2;
                    s2.xscalemultiplier = -1;
                }
                
                if (((timer + 2) % 45) == 0)
                {
                    var s2 = instance_create_depth((cx + 240) - 60, cy + 208 + topbottomoffset, -401, obj_songnote_c3);
                    s2.speed = 3;
                    s2.image_xscale = -1;
                }
                else if (((timer + 2) % 30) == 0)
                {
                    var s2 = instance_create_depth((cx + 240) - 60, cy + 208 + topbottomoffset, -401, obj_songnote_c3);
                    s2.speed = 3;
                    s2.image_xscale = -1;
                    s2.pull = 2;
                    s2.xscalemultiplier = -1;
                }
                else if (((timer + 2) % 15) == 0)
                {
                    var s2 = instance_create_depth((cx + 240) - 60, cy + 208 + topbottomoffset, -401, obj_songnote_c3);
                    s2.speed = 3;
                    s2.image_xscale = -1;
                    s2.pull = 2;
                    s2.xscalemultiplier = -1;
                }
                
                randomize();
                var speedoffset1 = random_range(-0.5, 0.5);
                var speedoffset2 = random_range(-0.5, 0.5);
                var speedoffset3 = random_range(-0.5, 0.5);
                
                if ((timer % 160) == 0)
                {
                    var spike1 = instance_create_depth(cx + 692, cy + 132 + topbottomoffset, -403, obj_spike_c3_1);
                    var spike2 = instance_create_depth(cx + 692, cy + 170 + topbottomoffset, -403, obj_spike_c3_1);
                    var spike3 = instance_create_depth(cx + 692, cy + 208 + topbottomoffset, -403, obj_spike_c3_1);
                    spike1.speed = -10 + speedoffset1;
                    spike2.speed = -10 + speedoffset2;
                    spike3.speed = -10 + speedoffset3;
                    spike1.image_xscale = -1;
                    spike2.image_xscale = -1;
                    spike3.image_xscale = -1;
                    
                    if (SOUL.pullpercent <= 0.5)
                    {
                        spike1.pull = 2;
                        spike3.pull = 2;
                        spike1.xscalemultiplier = -1;
                        spike2.xscalemultiplier = -1;
                        spike3.xscalemultiplier = -1;
                    }
                    else
                    {
                        spike2.pull = 2;
                        spike1.xscalemultiplier = -1;
                        spike2.xscalemultiplier = -1;
                        spike3.xscalemultiplier = -1;
                    }
                }
                else if ((timer % 80) == 0)
                {
                    var spike1 = instance_create_depth(cx - 52, cy + 132 + topbottomoffset, -403, obj_spike_c3_1);
                    var spike2 = instance_create_depth(cx - 52, cy + 170 + topbottomoffset, -403, obj_spike_c3_1);
                    var spike3 = instance_create_depth(cx - 52, cy + 208 + topbottomoffset, -403, obj_spike_c3_1);
                    spike1.speed = 10 + speedoffset1;
                    spike2.speed = 10 + speedoffset2;
                    spike3.speed = 10 + speedoffset3;
                    
                    if (SOUL.pullpercent <= 0.5)
                    {
                        spike2.pull = 2;
                    }
                    else
                    {
                        spike1.pull = 2;
                        spike3.pull = 2;
                    }
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_spike_c3_1);
                instance_destroy(obj_songnote_c3);
                instance_destroy(obj_ring);
                instance_destroy(obj_cable);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 7:
            endtimer = 340;
            
            if (timer < endtimer)
            {
                if (timer < 5)
                {
                    if (instance_exists(SOUL))
                    {
                        SOUL.purple = true;
                        SOUL.xstrings = true;
                        SOUL.twostring = true;
                        SOUL.twostringspace = 9;
                        SOUL.stringoption = 2;
                    }
                }
                
                if (timer == 17)
                    instance_create_depth(cx + 320, cy + 90, -400, obj_pie_c3);
                
                if (timer == 37)
                    instance_create_depth(cx + 320, cy + 170, -402, obj_knife_c3);
                
                if (timer >= 17 && timer <= 50)
                {
                    percent3++;
                    
                    if (percent3 <= 25)
                    {
                        var position = animcurve_channel_evaluate(curveslower, percent3 / 25);
                        global.leftoffset = lerp(0, -20, position);
                        global.rightoffset = lerp(0, 20, position);
                    }
                }
                else if (timer >= 280 && timer <= 308)
                {
                    percent1++;
                    
                    if (percent1 <= 25)
                    {
                        var position = animcurve_channel_evaluate(curveslower, percent1 / 25);
                        global.leftoffset = lerp(-20, -70, position);
                        global.rightoffset = lerp(20, 70, position);
                    }
                }
                else if (timer >= (endtimer - 20))
                {
                    percent2++;
                    
                    if (percent2 <= 20)
                    {
                        var position = animcurve_channel_evaluate(curveslower, percent2 / 20);
                        global.leftoffset = lerp(-70, 0, position);
                        global.rightoffset = lerp(70, 0, position);
                    }
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_pie_c3);
                instance_destroy(obj_pie_split_c3);
                instance_destroy(obj_knife_c3);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 8:
            endtimer = 360;
            draw_set_color(c_white);
            draw_set_font(fDeterminationMW);
            
            if (timer < endtimer)
            {
                if (timer < 5)
                {
                    if (instance_exists(SOUL))
                    {
                        SOUL.purple = true;
                        SOUL.xstrings = true;
                        SOUL.twostring = true;
                        SOUL.twostringspace = -6;
                        SOUL.stringoption = 2;
                    }
                }
                
                if (timer >= 17 && timer <= 47)
                {
                    percent1++;
                    
                    if (percent1 <= 30)
                    {
                        var position = animcurve_channel_evaluate(curveease, percent1 / 30);
                        
                        if (!global.alldown)
                        {
                            global.leftoffset = lerp(0, -120, position);
                            global.rightoffset = lerp(0, -40, position);
                            global.topoffset = lerp(0, 120, position);
                            global.bottomoffset = lerp(0, 60, position);
                        }
                    }
                }
                else if (timer < (endtimer - 20))
                {
                    percent2++;
                    
                    if (percent2 <= 310)
                    {
                        var position = animcurve_channel_evaluate(curveease, percent2 / 310);
                        
                        if (!global.alldown)
                        {
                            global.leftoffset = lerp(-120, 120, position);
                            global.rightoffset = lerp(-40, 100, position);
                        }
                    }
                }
                else if (timer >= (endtimer - 20))
                {
                    percent3++;
                    
                    if (percent3 <= 20)
                    {
                        var position = animcurve_channel_evaluate(curveease, percent3 / 20);
                        
                        if (!global.alldown)
                        {
                            global.leftoffset = lerp(120, 0, position);
                            global.rightoffset = lerp(100, 0, position);
                            global.topoffset = lerp(topoffsetsave, 60, position);
                        }
                    }
                }
                
                if (timer > 47 && timer <= (endtimer - 20))
                {
                    if (!global.alldown)
                    {
                        global.topoffset = 120 + (sin(((timer - 48) / 100) * (2 * pi)) * 6);
                        global.bottomoffset = 60 + (sin(((timer - 48) / 100) * (2 * pi)) * 6);
                        topoffsetsave = global.topoffset;
                        bottomoffsetsave = global.bottomoffset;
                    }
                }
                
                if (timer == 17)
                {
                    instance_create_depth(cx + 540, cy + 246, -404, obj_mask_laugh);
                    instance_create_depth(cx + 460, cy + 116, -404, obj_mask_laugh_1);
                    instance_create_depth(cx + 100, cy + 246, -404, obj_mask_laugh_2);
                    instance_create_depth(cx + 180, cy + 116, -404, obj_mask_laugh_3);
                }
                
                var laugh1 = [50, 120, 150, 190, 240, 280];
                
                if (array_contains(laugh1, timer))
                {
                    obj_mask_laugh.image_speed = 1;
                    obj_mask_laugh.image_index = 1;
                    var c1 = instance_create_depth(obj_mask_laugh.x - 28, obj_mask_laugh.y - 34, -406, obj_circleblast_1);
                    c1.pull = 2;
                    c1.multiplier = 2/3;
                }
                
                var laugh2 = [60, 140, 190];
                
                if (array_contains(laugh2, timer))
                {
                    obj_mask_laugh_1.image_speed = 1;
                    obj_mask_laugh_1.image_index = 1;
                    var c2 = instance_create_depth(obj_mask_laugh_1.x - 28, obj_mask_laugh_1.y - 34, -406, obj_circleblast_1);
                    c2.pull = 2;
                    c2.multiplier = 2/3;
                }
                
                var laugh3 = [70, 150, 190, 230];
                
                if (array_contains(laugh3, timer))
                {
                    obj_mask_laugh_2.image_speed = 1;
                    obj_mask_laugh_2.image_index = 1;
                    var c3 = instance_create_depth(obj_mask_laugh_2.x + 28, obj_mask_laugh_2.y + 34, -406, obj_circleblast_1);
                    c3.pull = 1;
                    c3.multiplier = 2/3;
                }
                
                var laugh4 = [90, 130, 190, 250, 280];
                
                if (array_contains(laugh4, timer))
                {
                    obj_mask_laugh_3.image_speed = 1;
                    obj_mask_laugh_3.image_index = 1;
                    var c4 = instance_create_depth(obj_mask_laugh_3.x + 28, obj_mask_laugh_3.y + 34, -406, obj_circleblast_1);
                    c4.pull = 1;
                    c4.multiplier = 2/3;
                }
                
                if (array_contains(laugh1, timer) || array_contains(laugh2, timer) || array_contains(laugh3, timer) || array_contains(laugh4, timer))
                {
                    audio_play_sound(snd_flealaugh, 1, false, 1.1);
                    audio_play_sound(snd_phone, 1, false, 0.66, 0, 0.66);
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_circleblast);
                instance_destroy(obj_circleblast_1);
                instance_destroy(obj_mask_laugh);
                instance_destroy(obj_mask_laugh_1);
                instance_destroy(obj_mask_laugh_2);
                instance_destroy(obj_mask_laugh_3);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 9:
            endtimer = 380;
            draw_set_color(c_white);
            draw_set_font(fDeterminationMW);
            
            if (timer < endtimer)
            {
                obj_foane_ex_battle.sprite_index = spr_foane_ex_puppetry;
                
                if (timer < 5)
                {
                    if (instance_exists(SOUL))
                    {
                        SOUL.purple = true;
                        SOUL.xstrings = true;
                        SOUL.twostringspace = 0;
                        SOUL.twostringoffset = 0;
                    }
                }
                
                var targety1 = cy + 192;
                var targety2 = cy + 230;
                var targety3 = cy + 268;
                var targetx1 = cx + 120;
                var targetx2 = cx + 520;
                var soundgain = 0.75;
                randomize();
                var soundpitch = random_range(0.9, 1.1);
                
                if (timer == 17)
                    var f1 = instance_create_depth(cx + 320, cy + 0, -401, obj_foane_puppet);
                
                if (timer == 35)
                {
                    obj_foane_puppet.shift = true;
                    audio_play_sound(snd_arrow, 1, false, soundgain);
                    var r1 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1.targetangle = 90;
                    r1.targety = targety1;
                    r1.targetx = targetx2;
                    var r2 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2.targetangle = 90;
                    r2.targety = targety2;
                    r2.targetx = targetx2;
                    var r3 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3.targetangle = 90;
                    r3.targety = targety3;
                    r3.targetx = targetx2;
                }
                
                if (timer == 55 || timer == 95)
                {
                    if (!global.alldown)
                        audio_play_sound(snd_arrow, 1, false, soundgain);
                    
                    var r1 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1.targetangle = 90;
                    r1.targety = targety1;
                    r1.targetx = targetx2;
                    r1.pull = 2;
                    var r2 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2.targetangle = 90;
                    r2.targety = targety2;
                    r2.targetx = targetx2;
                    r2.pull = 2;
                    var r3 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3.targetangle = 90;
                    r3.targety = targety3;
                    r3.targetx = targetx2;
                    r3.pull = 2;
                }
                
                if (timer == 55 || timer == 95)
                {
                    var r1 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1.targetangle = -90;
                    r1.targety = targety1;
                    r1.targetx = targetx1;
                    r1.pull = 2;
                    var r2 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2.targetangle = -90;
                    r2.targety = targety2;
                    r2.targetx = targetx1;
                    r2.pull = 2;
                    var r3 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3.targetangle = -90;
                    r3.targety = targety3;
                    r3.targetx = targetx1;
                    r3.pull = 2;
                }
                
                if (timer == 75 || timer == 115)
                {
                    if (!global.alldown)
                        audio_play_sound(snd_arrow, 1, false, soundgain);
                    
                    var r1 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1.targetangle = -90;
                    r1.targety = targety1;
                    r1.targetx = targetx1;
                    var r2 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2.targetangle = -90;
                    r2.targety = targety2;
                    r2.targetx = targetx1;
                    var r3 = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3.targetangle = -90;
                    r3.targety = targety3;
                    r3.targetx = targetx1;
                }
                
                if (timer == 135 || timer == 175)
                {
                    if (!global.alldown)
                        audio_play_sound(snd_arrow, 1, false, soundgain);
                    
                    var r1a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1a.targetangle = -90;
                    r1a.targety = targety1;
                    r1a.targetx = targetx1;
                    var r2a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2a.targetangle = 90;
                    r2a.targety = targety2;
                    r2a.targetx = targetx2;
                    r2a.pull = 2;
                    var r3a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3a.targetangle = -90;
                    r3a.targety = targety3;
                    r3a.targetx = targetx1;
                }
                
                if (timer == 155 || timer == 195)
                {
                    if (!global.alldown)
                        audio_play_sound(snd_arrow, 1, false, soundgain);
                    
                    var r1a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1a.targetangle = 90;
                    r1a.targety = targety1;
                    r1a.targetx = targetx2;
                    r1a.pull = 2;
                    var r2a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2a.targetangle = -90;
                    r2a.targety = targety2;
                    r2a.targetx = targetx1;
                    r2a.pull = 1;
                    var r3a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3a.targetangle = 90;
                    r3a.targety = targety3;
                    r3a.targetx = targetx2;
                    r3a.pull = 2;
                }
                
                if (timer == 210)
                {
                    if (!global.alldown)
                        audio_play_sound(snd_arrow, 1, false, soundgain);
                    
                    var r1a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1a.targetangle = 90;
                    r1a.targety = targety1;
                    r1a.targetx = targetx2;
                    r1a.pull = 2;
                    var r2a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2a.targetangle = 90;
                    r2a.targety = targety2;
                    r2a.targetx = targetx2;
                    r2a.pull = 2;
                    var r3a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3a.targetangle = -90;
                    r3a.targety = targety3;
                    r3a.targetx = targetx1;
                    r3a.pull = 1;
                }
                
                if (timer == 225)
                {
                    if (!global.alldown)
                        audio_play_sound(snd_arrow, 1, false, soundgain);
                    
                    var r1a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1a.targetangle = 90;
                    r1a.targety = targety1;
                    r1a.targetx = targetx2;
                    r1a.pull = 2;
                    var r2a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2a.targetangle = -90;
                    r2a.targety = targety2;
                    r2a.targetx = targetx1;
                    r2a.pull = 1;
                    var r3a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3a.targetangle = -90;
                    r3a.targety = targety3;
                    r3a.targetx = targetx1;
                    r3a.pull = 1;
                }
                
                if (timer >= 240 && (timer % 15) == 0 && timer < (endtimer - 25))
                {
                    if (!global.alldown)
                        audio_play_sound(snd_arrow, 1, false, soundgain, false, soundpitch);
                    
                    var r1a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1a.targetangle = -90;
                    r1a.targety = targety1;
                    r1a.targetx = targetx1;
                    r1a.pull = 2;
                    var r2a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2a.targetangle = -90;
                    r2a.targety = targety2;
                    r2a.targetx = targetx1;
                    r2a.pull = 2;
                    var r3a = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3a.targetangle = -90;
                    r3a.targety = targety3;
                    r3a.targetx = targetx1;
                    r3a.pull = 2;
                    var r1b = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r1b.targetangle = 90;
                    r1b.targety = targety1;
                    r1b.targetx = targetx2;
                    r1b.pull = 2;
                    var r2b = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r2b.targetangle = 90;
                    r2b.targety = targety2;
                    r2b.targetx = targetx2;
                    r2b.pull = 2;
                    var r3c = instance_create_depth(cx + 320, cy + 66, -400, obj_ring_1);
                    r3c.targetangle = 90;
                    r3c.targety = targety3;
                    r3c.targetx = targetx2;
                    r3c.pull = 2;
                }
                
                if (timer == (endtimer - 25))
                    obj_foane_puppet.shift = false;
                
                if (timer == 260)
                {
                    var sb1 = instance_create_depth(cx + 660, targety1, -405, obj_signalburst_c3);
                    sb1.speed = -8;
                }
                
                if (timer == 290)
                {
                    var sb2 = instance_create_depth(cx - 20, targety3, -405, obj_signalburst_c3);
                    sb2.speed = 8;
                }
                
                if (timer >= 17 && timer <= 47)
                {
                    percent1++;
                    var position = animcurve_channel_evaluate(curveease, percent1 / 20);
                    var position2 = animcurve_channel_evaluate(curveease, percent1 / 15);
                    global.leftoffset = lerp(0, 63, position);
                    global.rightoffset = lerp(0, -63, position);
                    global.topoffset = lerp(0, 60, position);
                    global.bottomoffset = lerp(0, 60, position);
                    obj_foane_puppet.yy = lerp(cy + 0, cy + 66, position);
                    obj_foane_puppet.image_alpha = lerp(0, 1, position2);
                }
                else if (timer >= (endtimer - 20))
                {
                    percent2++;
                    var position = animcurve_channel_evaluate(curveease, percent2 / 20);
                    global.leftoffset = lerp(63, 0, position);
                    global.rightoffset = lerp(-63, 0, position);
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_foane_puppet);
                instance_destroy(obj_ring_1);
                instance_destroy(obj_signalburst_c3);
                instance_destroy(obj_mask_laugh_1);
                instance_destroy(obj_mask_laugh_2);
                instance_destroy(obj_mask_laugh_3);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 10:
            if (timer < endtimer)
            {
                obj_foane_ex_battle.sprite_index = spr_foane_ex_incoming;
                percent7++;
                
                if (percent7 == 0)
                {
                    if (!global.alldown)
                        audio_play_sound(snd_rocket, 1, false, 0.3);
                }
                
                if (instance_exists(SOUL))
                {
                    if (timer == 1 || timer == 2)
                    {
                        SOUL.purple = true;
                        SOUL.xstrings = true;
                        SOUL.ystrings = false;
                        SOUL.twostring = false;
                        SOUL.onestring = true;
                        SOUL.twostringspace = 0;
                        SOUL.twostringoffset = 0;
                        SOUL.stringoption = 1;
                    }
                }
                
                if (timer == 17)
                {
                    endtimer = 500;
                    instance_create_depth(cx + 450, cy + 90, -401, obj_phone_3);
                    obj_phone_3.paused = false;
                    
                    if (!global.alldown)
                        audio_play_sound(snd_phone, 1, false);
                }
                
                if (((timer + 7) % 25) == 0 && timer >= 27 && timer <= (endtimer - 40))
                {
                    if (timer <= 260)
                    {
                        var b4 = instance_create_depth(cx + 440, cy + 260, -400, obj_bigspike);
                        b4.speed = -3;
                        b4.image_angle = 180;
                        b4.pull = 1;
                        b4.image_alpha = 0.9;
                    }
                    else
                    {
                        var b1 = instance_create_depth(cx + 285, cy + 250 + global.topoffset, -400, obj_bigspike);
                        b1.speed = 4;
                        b1.direction = 90;
                        b1.image_angle = 90;
                        b1.pull = 1;
                        b1.image_alpha = 0.9;
                        var b2 = instance_create_depth(cx + 320, (cy + 250) - global.topoffset, -400, obj_bigspike);
                        b2.speed = 4;
                        b2.direction = -90;
                        b2.image_angle = -90;
                        b2.pull = 1;
                        b2.image_alpha = 0.9;
                        var b3 = instance_create_depth(cx + 355, cy + 250 + global.topoffset, -400, obj_bigspike);
                        b3.speed = 4;
                        b3.direction = 90;
                        b3.image_angle = 90;
                        b3.pull = 1;
                        b3.image_alpha = 0.9;
                    }
                }
                
                if (instance_exists(obj_phone_3))
                {
                    if (obj_phone_3.trigger)
                    {
                        if (obj_phone_3.characterpick == 0)
                        {
                            if ((timer % 15) == 0 && timer <= 175)
                            {
                            }
                            
                            if (timer == 40)
                            {
                                var bl1 = instance_create_depth(cx + 360, cy + 240, -401, obj_berdly_line);
                                bl1.frequency = 0.031415926535897934;
                                bl1.amplitude = 20;
                            }
                            
                            if (timer == 80)
                            {
                                var bl2 = instance_create_depth(cx + 340, cy + 240, -401, obj_berdly_line);
                                bl2.amplitude = 40;
                                bl2.frequency = 0.015707963267948967;
                            }
                            
                            if (timer == 120)
                            {
                                var bl3 = instance_create_depth(cx + 320, cy + 240, -401, obj_berdly_line);
                                bl3.frequency = 0.02356194490192345;
                                bl3.amplitude = 30;
                            }
                            
                            if (timer == 160)
                            {
                                var bl4 = instance_create_depth(cx + 300, cy + 240, -401, obj_berdly_line);
                                bl4.amplitude = 60;
                                bl4.frequency = 0.015707963267948967;
                            }
                            
                            if (timer == 160)
                            {
                                var bl5 = instance_create_depth(cx + 330, cy + 240, -401, obj_berdly_line);
                                bl5.amplitude = 60;
                                bl5.frequency = 0.007853981633974483;
                            }
                        }
                        else if (obj_phone_3.characterpick == 1)
                        {
                            randomize();
                            var randomxchoice1 = irandom_range(cx + 100, cx + 200);
                            var randomxchoice2 = irandom_range(cx + 440, cx + 540);
                            var randomychoice = irandom_range(cy + 100, cy + 210);
                            var randomchoice = choose(0, 1);
                            
                            if (timer >= 300 && (timer % 20) == 0 && timer <= 460)
                            {
                                if (randomchoice == 0)
                                    instance_create_depth(randomxchoice1, randomychoice, -402, obj_queen_arrow);
                                else
                                    instance_create_depth(randomxchoice2, randomychoice, -402, obj_queen_arrow);
                            }
                        }
                    }
                }
                
                if (timer >= 17 && timer <= 37)
                {
                    percent1++;
                    var position = animcurve_channel_evaluate(curveease, percent1 / 20);
                    global.topoffset = lerp(0, 120, position);
                    global.bottomoffset = lerp(0, 60, position);
                }
                
                if (timer == 37)
                {
                    obj_phone_3.trigger = true;
                    obj_phone_3.paused = true;
                    
                    if (!global.alldown)
                        audio_play_sound(snd_noise, 1, false);
                    
                    randomize();
                    obj_phone_3.characterid = irandom_range(0, 100);
                    
                    if (obj_phone_3.characterid == 66)
                        obj_phone_3.characterpick = 66;
                    else
                        obj_phone_3.characterpick = 0;
                }
                
                if (timer == 260)
                {
                    SOUL.purple = true;
                    SOUL.ystrings = true;
                    SOUL.xstrings = false;
                    SOUL.twostringspace = 0;
                    SOUL.twostringoffset = 0;
                    SOUL.x = cx + 320;
                    SOUL.stringoption = 1;
                    SOUL.string0percent = 0;
                    SOUL.string1percent = 0;
                    SOUL.string2percent = 0;
                    SOUL.string_start_x = cx + 320;
                    SOUL.string_end_x = cx + 320;
                    SOUL.onestring = false;
                    instance_destroy(obj_spade);
                    var sm = instance_create_depth(cx + 320, cy + 260, -404, obj_staticsmall);
                    sm.image_xscale = 0.71;
                    sm.image_yscale = 0.41;
                    sm.image_alpha = 1;
                    obj_phone_3.trigger = false;
                    obj_phone_3.paused = false;
                    
                    if (!global.alldown)
                        audio_play_sound(snd_phone, 1, false);
                }
                
                if (instance_exists(obj_staticsmall))
                {
                    obj_staticsmall.x = cx + 320;
                    obj_staticsmall.y = cy + 260;
                }
                
                if (timer == 280)
                {
                    instance_destroy(obj_staticsmall);
                    obj_phone_3.trigger = true;
                    obj_phone_3.paused = true;
                    
                    if (!global.alldown)
                        audio_play_sound(snd_noise, 1, false);
                    
                    randomize();
                    obj_phone_3.characterid = irandom_range(0, 100);
                    
                    if (obj_phone_3.characterid == 66)
                        obj_phone_3.characterpick = 66;
                    else
                        obj_phone_3.characterpick = 1;
                }
                
                if (timer >= (endtimer - 20))
                {
                    percent2++;
                    var position2 = animcurve_channel_evaluate(curveease, percent2 / 20);
                    global.topoffset = lerp(120, 40, position2);
                    global.bottomoffset = lerp(60, 40, position2);
                    
                    if (instance_exists(obj_bigspike))
                        obj_bigspike.image_alpha -= 0.16666666666666666;
                }
                
                if (timer == (endtimer - 20))
                {
                    obj_phone_3.trigger = false;
                    obj_phone_3.paused = false;
                    
                    if (!global.alldown)
                        audio_play_sound(snd_phone, 1, false);
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_queen_arrow);
                instance_destroy(obj_berdly_arrow);
                instance_destroy(obj_berdly_line);
                instance_destroy(obj_bigspike);
                instance_destroy(obj_tenna_puppet);
                instance_destroy(obj_queen_ray);
                instance_destroy(obj_circleblast_1);
                instance_destroy(obj_connectcircle);
                instance_destroy(obj_connectx);
                instance_destroy(obj_phone_2);
                instance_destroy(obj_phone_3);
                instance_destroy(obj_mask_shatter);
                instance_destroy(obj_mask_laugh);
                instance_destroy(obj_mask_laugh_2);
                instance_destroy(obj_box_c3);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 11:
            overlaycase = turn;
            
            if (timer < endtimer)
            {
                if (instance_exists(SOUL))
                {
                    if (timer == 1 || timer == 2)
                    {
                        SOUL.purple = true;
                        SOUL.xstrings = true;
                        SOUL.ystrings = false;
                        SOUL.twostring = false;
                        SOUL.onestring = true;
                        SOUL.twostringspace = 0;
                        SOUL.twostringoffset = 0;
                        SOUL.stringoption = 1;
                    }
                }
                
                endtimer = 440;
                var aciduptimer = 150;
                
                if (timer == 17)
                {
                    var num1 = 204;
                    var num2 = 204;
                    var a1 = instance_create_depth(cx + 320, cy + 300, -400, obj_foane_acid);
                    a1.image_blend = make_color_rgb(0, num1, 0);
                    a1.image_alpha = 0.8;
                    a1.yoffset = 8;
                    var a2 = instance_create_depth(cx + 320, cy + 300, -399, obj_foane_acid);
                    a2.image_blend = make_color_rgb(0, num2, 0);
                    a2.image_alpha = 0.8;
                    a2.image_xscale *= -1;
                    a2.speedmultiplier = 1.2;
                    a2.yoffset = 0;
                    a2.pull = 2;
                }
                
                var randomxrange = irandom_range(cx + 264 + (global.leftoffset * 1.5), cx + 376 + (global.rightoffset * 1.5));
                
                if ((timer % 20) == 0 && timer >= (aciduptimer + 30))
                {
                    randomize();
                    var anglespeed = random_range(-5, 5);
                    var house1 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house1.anglespeed = anglespeed;
                    house1.directionrange = -40;
                    house1.acidspeedmultiplier = 3;
                    var house2 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house2.anglespeed = anglespeed;
                    house2.directionrange = -90;
                    house2.image_index = 1;
                    house2.acidspeedmultiplier = 3;
                    var house3 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house3.anglespeed = anglespeed;
                    house3.directionrange = -150;
                    house3.image_index = 2;
                    house3.acidspeedmultiplier = 3;
                }
                else if ((timer % 12) == 0 && timer <= (aciduptimer - 30))
                {
                    randomize();
                    var anglespeed = random_range(-5, 5);
                    var house1 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house1.anglespeed = anglespeed;
                    house1.directionrange = irandom_range(-20, -70);
                    var house2 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house2.anglespeed = anglespeed;
                    house2.directionrange = irandom_range(-70, -120);
                    house2.image_index = 1;
                    var house3 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house3.anglespeed = anglespeed;
                    house3.directionrange = irandom_range(-120, -170);
                    house3.image_index = 2;
                }
                else if ((timer % 6) == 0 && timer <= (aciduptimer - 30))
                {
                    randomize();
                    var anglespeed = random_range(-5, 5);
                    var house1 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house1.anglespeed = anglespeed;
                    house1.directionrange = irandom_range(-20, -70);
                    house1.pull = 2;
                    var house2 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house2.anglespeed = anglespeed;
                    house2.directionrange = irandom_range(-70, -120);
                    house2.image_index = 1;
                    house2.pull = 2;
                    var house3 = instance_create_depth(randomxrange, cy - 16, -404, obj_foane_acidhouse1);
                    house3.anglespeed = anglespeed;
                    house3.directionrange = irandom_range(-120, -170);
                    house3.image_index = 2;
                    house3.pull = 2;
                }
                
                if (timer >= 17 && timer <= 37)
                {
                    percent1++;
                    var position2 = animcurve_channel_evaluate(curveease, percent1 / 20);
                    global.topoffset = lerp(0, 0, position2);
                    global.bottomoffset = lerp(0, 40, position2);
                }
                
                if (timer == (aciduptimer - 20))
                {
                    var acidwarning = instance_create_depth(cx + 320, cy + 120, -405, obj_foane_acidwarning);
                    acidwarning.image_xscale = 2;
                    acidwarning.image_yscale = 2;
                    obj_foane_acid.image_blend = obj_foane_acid.purplecolor;
                }
                
                if (timer == aciduptimer)
                {
                    obj_foane_acid.triggerup = true;
                    obj_foane_acid.pull = 2;
                    instance_destroy(obj_foane_acidwarning);
                }
                
                if (timer >= aciduptimer)
                {
                    percent2++;
                    
                    if (percent2 <= 30)
                    {
                        var position1 = animcurve_channel_evaluate(curveease, percent2 / 30);
                        SOUL.twostringoffset = lerp(0, 20, position1);
                        global.leftoffset = lerp(0, 10, position1);
                        global.rightoffset = lerp(0, -10, position1);
                    }
                }
                
                if (timer >= (endtimer - 20))
                {
                    percent3++;
                    
                    if (percent3 <= 20)
                    {
                        var position3 = animcurve_channel_evaluate(curvelinear, percent3 / 20);
                        global.leftoffset = lerp(10, 0, position3);
                        global.rightoffset = lerp(-10, 0, position3);
                        global.bottomoffset = lerp(40, 0, position3);
                    }
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_foane_acid);
                instance_destroy(obj_foane_acidhouse1);
                instance_destroy(obj_berdly_line);
                instance_destroy(obj_bigspike);
                instance_destroy(obj_tenna_puppet);
                instance_destroy(obj_queen_ray);
                instance_destroy(obj_circleblast_1);
                instance_destroy(obj_connectcircle);
                instance_destroy(obj_connectx);
                instance_destroy(obj_phone_2);
                instance_destroy(obj_phone_3);
                instance_destroy(obj_mask_shatter);
                instance_destroy(obj_mask_laugh);
                instance_destroy(obj_mask_laugh_2);
                instance_destroy(obj_box_c3);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 12:
            endtimer = 360;
            
            if (timer < endtimer)
            {
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.ystrings = true;
                    SOUL.twostringspace = 0;
                    SOUL.twostringoffset = 0;
                }
                
                percent1++;
                
                if (!global.alldown)
                {
                    if (percent1 <= (endtimer - 20))
                    {
                        var position = animcurve_channel_evaluate(curveease, percent1 / (endtimer - 20));
                        global.topoffset = lerp(0, 30, position);
                        global.bottomoffset = lerp(0, -30, position);
                    }
                    else if (percent2 <= endtimer)
                    {
                        percent2++;
                        var position = animcurve_channel_evaluate(curveease, percent2 / 20);
                        global.topoffset = lerp(30, 0, position);
                        global.bottomoffset = lerp(-30, 0, position);
                    }
                }
                
                if (timer == 1 || timer == 2)
                {
                    if (!instance_exists(obj_lines_c3_1))
                        instance_create_depth(cx + 320, cy + 30, -370, obj_lines_c3_1);
                }
                
                draw_set_color(c_white);
                draw_set_font(fDeterminationMW);
                
                if (timer >= (endtimer - 15))
                {
                    if (instance_exists(obj_lines_c3_1))
                        obj_lines_c3_1.alpha -= 0.1;
                }
                
                var switchtimer = [72, 168, 240];
                
                if (timer == 1 || timer == 2)
                    percent6 = 2;
                
                if (timer == 80)
                    percent6 = 1;
                
                if (timer == 160)
                {
                    percent5 = 1;
                    percent6 = 2;
                }
                
                if (timer == 240)
                {
                    percent5 = 0;
                    percent6 = 1;
                }
                
                if ((timer % 24) == 0 && !array_contains(switchtimer, timer))
                {
                    var spike1 = instance_create_depth(305 + (percent5 * 35), 0, -403, obj_spike_c3_1);
                    spike1.image_yscale /= 2.5;
                    spike1.direction = -90;
                    spike1.image_angle = -90;
                    spike1.speed = 4;
                    spike1.image_alpha = 0.5;
                    spike1.noecho = true;
                }
                else if ((timer % 12) == 0 && !array_contains(switchtimer, timer))
                {
                    var spike1 = instance_create_depth(305 + (percent5 * 35), 0, -403, obj_spike_c3_1);
                    spike1.image_yscale /= 2.5;
                    spike1.direction = -90;
                    spike1.image_angle = -90;
                    spike1.speed = 4;
                    spike1.image_alpha = 2/3;
                    spike1.pull = 2;
                    spike1.yscalemultiplier = 0.4;
                    spike1.noecho = true;
                }
                
                if ((timer % 24) == 0 && !array_contains(switchtimer, timer))
                {
                    var spike2 = instance_create_depth(305 + (percent6 * 35), 0, -403, obj_spike_c3_1);
                    spike2.image_yscale /= 2.5;
                    spike2.direction = -90;
                    spike2.image_angle = -90;
                    spike2.speed = 4;
                    spike2.image_alpha = 0.5;
                    spike2.noecho = true;
                }
                else if ((timer % 12) == 0 && !array_contains(switchtimer, timer))
                {
                    var spike2 = instance_create_depth(305 + (percent6 * 35), 0, -403, obj_spike_c3_1);
                    spike2.image_yscale /= 2.5;
                    spike2.direction = -90;
                    spike2.image_angle = -90;
                    spike2.speed = 4;
                    spike2.image_alpha = 2/3;
                    spike2.pull = 2;
                    spike2.yscalemultiplier = 0.4;
                    spike2.noecho = true;
                }
                
                percent7 = 2;
                
                if ((timer % 24) == 0 && !array_contains(switchtimer, timer) && timer >= (endtimer - 38))
                {
                    var spike3 = instance_create_depth(305 + (percent7 * 35), 0, -403, obj_spike_c3_1);
                    spike3.image_yscale /= 2.5;
                    spike3.direction = -90;
                    spike3.image_angle = -90;
                    spike3.speed = 4;
                    spike3.image_alpha = 0.5;
                    spike3.noecho = true;
                }
                else if ((timer % 12) == 0 && !array_contains(switchtimer, timer) && timer >= (endtimer - 38))
                {
                    var spike3 = instance_create_depth(305 + (percent7 * 35), 0, -403, obj_spike_c3_1);
                    spike3.image_yscale /= 2.5;
                    spike3.direction = -90;
                    spike3.image_angle = -90;
                    spike3.speed = 4;
                    spike3.image_alpha = 2/3;
                    spike3.pull = 2;
                    spike3.yscalemultiplier = 0.4;
                    spike3.noecho = true;
                }
                
                if (((timer + 2) % 68) == 0 && timer <= 300)
                {
                    var right1 = instance_create_depth(cx + -25, cy + 30, -403, obj_phoneside_1);
                    right1.image_angle = -90;
                    
                    if (!global.alldown)
                        right1.speed = 12;
                    
                    right1.pullobject = 2;
                }
                else if (((timer + 2) % 34) == 0 && timer <= 300)
                {
                    var right1 = instance_create_depth(cx + -25, cy + 30, -403, obj_phoneside_1);
                    right1.image_angle = -90;
                    
                    if (!global.alldown)
                        right1.speed = 12;
                    
                    right1.pullobject = 1;
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_symbols_c3);
                instance_destroy(obj_phoneside_1);
                instance_destroy(obj_lines_c3_1);
                instance_destroy(obj_spike_c3_1);
                instance_destroy(obj_cable);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 13:
            endtimer = 420;
            
            if (timer < endtimer)
            {
                obj_foane_ex_battle.sprite_index = spr_foane_ex_ringtone;
                
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.xstrings = true;
                    SOUL.twostringspace = 0;
                    SOUL.twostringoffset = 0;
                }
                
                if (!(global.leftoffset == 0))
                    var leftrightoffset = lerp(global.leftoffset, global.rightoffset, 0.5);
                else
                    var leftrightoffset = 0;
                
                var topbottomoffset;
                
                if (!(global.topoffset == 0))
                    topbottomoffset = lerp(global.topoffset, global.bottomoffset, 0.5);
                else
                    topbottomoffset = 0;
                
                if (timer >= 17)
                {
                    percent1++;
                    
                    if (percent1 <= 15)
                    {
                        var position = animcurve_channel_evaluate(curveslower, percent1 / 15);
                        global.leftoffset = lerp(0, -80, position);
                        global.rightoffset = lerp(0, 80, position);
                        global.topoffset = sin(((timer - 17) / 100) * (2 * pi)) * 4;
                        global.bottomoffset = sin(((timer - 17) / 100) * (2 * pi)) * -4;
                    }
                    else if (timer >= (endtimer - 16))
                    {
                        percent2++;
                        var position = animcurve_channel_evaluate(curveease, percent2 / 15);
                        global.leftoffset = lerp(-80, 0, position);
                        global.rightoffset = lerp(80, 0, position);
                        global.topoffset = lerp(global.topoffset, 0, position);
                        global.bottomoffset = lerp(global.bottomoffset, 0, position);
                        
                        if (instance_exists(obj_songnote_c3))
                            obj_songnote_c3.image_alpha -= 0.1;
                    }
                    else if (timer < endtimer)
                    {
                        global.topoffset = sin(((timer - 17) / 100) * (2 * pi)) * 4;
                        global.bottomoffset = sin(((timer - 17) / 100) * (2 * pi)) * -4;
                    }
                }
                
                if (timer < 200)
                {
                    if (((timer + 2) % 36) == 0)
                    {
                        var s1 = instance_create_depth(cx + 400 + 80, cy + 170 + topbottomoffset, -401, obj_songnote_c3_1);
                        s1.speed = 3;
                        s1.speedmultiplier = -1;
                    }
                    else if (((timer + 2) % 24) == 0)
                    {
                        var s1 = instance_create_depth(cx + 400 + 80, cy + 170 + topbottomoffset, -401, obj_songnote_c3_1);
                        s1.speed = 3;
                        s1.speedmultiplier = -1;
                        s1.pull = 2;
                    }
                    else if (((timer + 2) % 12) == 0)
                    {
                        var s1 = instance_create_depth(cx + 400 + 80, cy + 170 + topbottomoffset, -401, obj_songnote_c3_1);
                        s1.speed = 3;
                        s1.speedmultiplier = -1;
                    }
                    
                    if (((timer + 2) % 36) == 0)
                    {
                        var s2 = instance_create_depth((cx + 240) - 80, cy + 132 + topbottomoffset, -401, obj_songnote_c3_1);
                        s2.speed = 3;
                        s2.image_xscale = 1;
                        s2.pull = 2;
                        s2.xscalemultiplier = -1;
                    }
                    else if (((timer + 2) % 24) == 0)
                    {
                        var s2 = instance_create_depth((cx + 240) - 80, cy + 132 + topbottomoffset, -401, obj_songnote_c3_1);
                        s2.speed = 3;
                        s2.image_xscale = 1;
                        s2.xscalemultiplier = -1;
                    }
                    else if (((timer + 2) % 12) == 0)
                    {
                        var s2 = instance_create_depth((cx + 240) - 80, cy + 132 + topbottomoffset, -401, obj_songnote_c3_1);
                        s2.speed = 3;
                        s2.image_xscale = 1;
                        s2.pull = 2;
                        s2.xscalemultiplier = -1;
                    }
                    
                    if (((timer + 2) % 36) == 0)
                    {
                        var s2 = instance_create_depth((cx + 240) - 80, cy + 208 + topbottomoffset, -401, obj_songnote_c3_1);
                        s2.speed = 3;
                        s2.image_xscale = 1;
                        s2.xscalemultiplier = -1;
                    }
                    else if (((timer + 2) % 24) == 0)
                    {
                        var s2 = instance_create_depth((cx + 240) - 80, cy + 208 + topbottomoffset, -401, obj_songnote_c3_1);
                        s2.speed = 3;
                        s2.image_xscale = 1;
                        s2.pull = 2;
                        s2.xscalemultiplier = -1;
                    }
                    else if (((timer + 2) % 12) == 0)
                    {
                        var s2 = instance_create_depth((cx + 240) - 80, cy + 208 + topbottomoffset, -401, obj_songnote_c3_1);
                        s2.speed = 3;
                        s2.image_xscale = 1;
                        s2.pull = 2;
                        s2.xscalemultiplier = -1;
                    }
                }
                
                if (timer == 200 || timer == 300)
                {
                    if (!global.alldown)
                        audio_play_sound(snd_sfx_a_swordappear, 1, false, 1);
                    
                    obj_songnote_c3_1.trigger = true;
                }
                
                randomize();
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_spike_c3_1);
                instance_destroy(obj_songnote_c3);
                instance_destroy(obj_songnote_c3_1);
                instance_destroy(obj_cable);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 14:
            if (timer < endtimer)
            {
                obj_foane_ex_battle.sprite_index = spr_foane_ex_incoming;
                
                if (instance_exists(SOUL))
                {
                    if (timer == 1 || timer == 2)
                    {
                        SOUL.purple = true;
                        SOUL.xstrings = true;
                        SOUL.ystrings = false;
                        SOUL.twostring = false;
                        SOUL.onestring = true;
                        SOUL.twostringspace = 0;
                        SOUL.twostringoffset = 0;
                        SOUL.stringoption = 1;
                    }
                }
                
                if (timer == 17)
                {
                    randomize();
                    percent5 = irandom_range(0, 1);
                    endtimer = 180;
                    instance_create_depth(cx + 450, cy + 90, -401, obj_phone_4);
                    obj_phone_4.paused = false;
                    
                    if (!global.alldown)
                        audio_play_sound(snd_phone, 1, false);
                }
                
                if (timer >= 17 && timer <= 37)
                {
                    if (!global.alldown)
                        percent1++;
                    
                    var position = animcurve_channel_evaluate(curveease, percent1 / 20);
                    global.topoffset = lerp(0, 143, position);
                    global.bottomoffset = lerp(0, 17, position);
                    global.leftoffset = lerp(0, 63, position);
                    global.rightoffset = lerp(0, -63, position);
                }
                
                if (timer == 37)
                {
                    obj_phone_4.trigger = true;
                    instance_create_depth(obj_phone_4.x - 120, obj_phone_4.y + 4, -405, obj_phoneheads_spamton);
                    obj_phone_4.paused = true;
                    
                    if (!global.alldown)
                        audio_play_sound(snd_noise, 1, false);
                    
                    randomize();
                    obj_phone_4.characterid = irandom_range(0, 100);
                    
                    if (obj_phone_4.characterid == 66)
                        obj_phone_4.characterpick = 66;
                    else
                        obj_phone_4.characterpick = 0;
                }
                
                if (timer >= 105)
                {
                    if (!global.alldown)
                        percent2++;
                    
                    if (percent5 == 0)
                    {
                        var position2 = animcurve_channel_evaluate(curveease, percent2 / 60);
                        global.leftoffset = lerp(63, 0, position2);
                        sprite_index = spr_bulletboard_phonehead;
                    }
                    else
                    {
                        var position2 = animcurve_channel_evaluate(curveease, percent2 / 45);
                        global.rightoffset = lerp(-63, 0, position2);
                        image_xscale *= -1;
                        sprite_index = spr_bulletboard_phonehead;
                    }
                }
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_queen_arrow);
                instance_destroy(obj_berdly_arrow);
                instance_destroy(obj_berdly_line);
                instance_destroy(obj_bigspike);
                instance_destroy(obj_tenna_puppet);
                instance_destroy(obj_queen_ray);
                instance_destroy(obj_phoneheads_spamton);
                instance_destroy(obj_connectcircle);
                instance_destroy(obj_connectx);
                instance_destroy(obj_phone_3);
                instance_destroy(obj_phone_4);
                instance_destroy(obj_mask_shatter);
                instance_destroy(obj_mask_laugh);
                instance_destroy(obj_mask_laugh_2);
                instance_destroy(obj_box_c3);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 15:
            endtimer = 360;
            
            if (timer < endtimer)
            {
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.ystrings = true;
                    SOUL.twostring = true;
                    SOUL.twostringspace = 9;
                }
                
                if (((timer + 2) % 44) == 0)
                {
                    if (!block1)
                    {
                        var r1 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r1.speed = 6;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 1;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r2.speed = 6;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 1;
                    }
                    
                    block1 = true;
                }
                else if (((timer + 2) % 22) == 0)
                {
                    if (!block2)
                    {
                        var r1 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r1.speed = 6;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 2;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r2.speed = 6;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 2;
                    }
                    
                    block2 = true;
                }
                else if ((timer % 44) == 0)
                {
                    if (!block1)
                    {
                        var r1 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r1.speed = 6;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 1;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r2.speed = 6;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 1;
                    }
                    
                    block1 = true;
                }
                else if ((timer % 22) == 0)
                {
                    if (!block2)
                    {
                        var r1 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r1.speed = 6;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 2;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r2.speed = 6;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 2;
                    }
                    
                    block2 = true;
                }
                
                if (timer >= 80 && (timer % 100) == 0)
                {
                    var c1 = instance_create_depth(cx + 293, cy + 500, -400, obj_cable);
                    c1.speed = 4;
                    c1.direction = 90;
                    c1.image_angle = -90;
                    c1.pull = 2;
                }
                else if (timer >= 80 && (timer % 50) == 0)
                {
                    var c1 = instance_create_depth(cx + 346, cy + 500, -400, obj_cable);
                    c1.speed = 4;
                    c1.direction = 90;
                    c1.image_angle = -90;
                    c1.pull = 1;
                }
                
                if (block1)
                {
                    block1timer++;
                    
                    if (block1timer == 3)
                    {
                        block1 = false;
                        block1timer = -1;
                    }
                }
                
                if (block2)
                {
                    block2timer++;
                    
                    if (block2timer == 3)
                    {
                        block2 = false;
                        block2timer = -1;
                    }
                }
                
                if (instance_exists(obj_cable))
                    obj_cable.speed = 4 + ((timer - 90) / 45);
                
                if (timer >= 17)
                {
                    if (!global.alldown)
                        timer2++;
                }
                
                global.topoffset = 10 + (sin(((timer2 + 25) / 100) * (2 * pi)) * -10);
                global.bottomoffset = -10 + (sin(((timer2 + 25) / 100) * (2 * pi)) * 10);
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_ring);
                instance_destroy(obj_cable);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        default:
            randomize();
            var randomturn = irandom_range(3, 15);
            turn = randomturn;
            
            if (timer == endtimer)
            {
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
        case 666:
            endtimer = 1980;
            
            if (timer < endtimer)
            {
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                draw_set_font(fDeterminationMW);
                draw_set_color(c_white);
                var timerleft = round((endtimer - timer) / 30);
                draw_text_color(cx + 320, cy + 62, timerleft, c_black, c_black, c_black, c_black, 1);
                draw_text_color(cx + 320, cy + 58, timerleft, c_black, c_black, c_black, c_black, 1);
                draw_text_color(cx + 318, cy + 60, timerleft, c_black, c_black, c_black, c_black, 1);
                draw_text_color(cx + 322, cy + 60, timerleft, c_black, c_black, c_black, c_black, 1);
                draw_text_color(cx + 320, cy + 60, timerleft, c_white, c_white, c_fuchsia, c_fuchsia, 1);
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(SOUL))
                {
                    SOUL.purple = true;
                    SOUL.ystrings = true;
                    SOUL.twostring = true;
                    SOUL.twostringspace = 9;
                }
                
                if (((timer + 2) % 34) == 0)
                {
                    if (!block1)
                    {
                        var r1 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r1.speed = 6;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 1;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r2.speed = 6;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 1;
                    }
                    
                    block1 = true;
                }
                else if (((timer + 2) % 17) == 0)
                {
                    if (!block2)
                    {
                        var r1 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r1.speed = 6;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 2;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r2.speed = 6;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 2;
                    }
                    
                    block2 = true;
                }
                else if ((timer % 34) == 0)
                {
                    if (!block1)
                    {
                        var r1 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r1.speed = 6;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 1;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r2.speed = 6;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 1;
                    }
                    
                    block1 = true;
                }
                else if ((timer % 17) == 0)
                {
                    if (!block2)
                    {
                        var r1 = instance_create_depth(cx + 293, cy - 20, -400, obj_ring);
                        r1.speed = 6;
                        r1.direction = -90;
                        r1.image_angle = 180;
                        r1.pull = 2;
                    }
                    else
                    {
                        var r2 = instance_create_depth(cx + 346, cy - 20, -400, obj_ring);
                        r2.speed = 6;
                        r2.direction = -90;
                        r2.image_angle = 180;
                        r2.pull = 2;
                    }
                    
                    block2 = true;
                }
                
                if (timer >= 80 && (timer % 80) == 0)
                {
                    var c1 = instance_create_depth(cx + 293, cy + 500, -400, obj_cable);
                    c1.speed = 6;
                    c1.direction = 90;
                    c1.image_angle = -90;
                    c1.pull = 2;
                }
                else if (timer >= 80 && (timer % 40) == 0)
                {
                    var c1 = instance_create_depth(cx + 346, cy + 500, -400, obj_cable);
                    c1.speed = 6;
                    c1.direction = 90;
                    c1.image_angle = -90;
                    c1.pull = 1;
                }
                
                if (block1)
                {
                    block1timer++;
                    
                    if (block1timer == 3)
                    {
                        block1 = false;
                        block1timer = -1;
                    }
                }
                
                if (block2)
                {
                    block2timer++;
                    
                    if (block2timer == 3)
                    {
                        block2 = false;
                        block2timer = -1;
                    }
                }
                
                if (instance_exists(obj_cable))
                    obj_cable.speed = 6 + ((timer - 90) / 45);
                
                if (timer >= 17)
                {
                    if (!global.alldown)
                        timer2++;
                }
                
                global.topoffset = 10 + (sin(((timer2 + 25) / 100) * (2 * pi)) * -10);
                global.bottomoffset = -10 + (sin(((timer2 + 25) / 100) * (2 * pi)) * 10);
            }
            
            if (timer == endtimer)
            {
                instance_destroy(obj_ring);
                instance_destroy(obj_cable);
                
                if (!global.harmonizing)
                {
                    alpha = 1;
                    spawn = false;
                    SOUL.ending = true;
                }
                else
                {
                    SOUL.moving = false;
                    harmonizing = true;
                }
            }
            
            break;
    }
}

draw_sprite_ext(sprite_index, image_index, x, y + global.topoffset, image_xscale, image_yscale, 0, c_white, alpha);

if (timer >= 17 && spawn)
{
    draw_rectangle_color(cam_x + 249 + global.leftoffset, cam_y + 99 + global.topoffset, cam_x + 390 + global.rightoffset, cam_y + 240 + global.bottomoffset, c_black, c_black, c_black, c_black, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 98 + global.topoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 248 + global.leftoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 241 + global.bottomoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 391 + global.rightoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
}
else
{
    alpha = 1;
    image_speed = 1;
}

if (overlaycase == turn)
{
    if (timer >= 20 && timer <= 37)
    {
        var gcolor1 = 48896;
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 238 + global.bottomoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, gcolor1, gcolor1, gcolor1, gcolor1, 0);
    }
}

subimg30fps++;

if (instance_exists(ENGINE))
{
    if (global.alldown)
    {
        image_speed = 0;
        exit;
    }
}
