if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

if (pull == 1)
    depth = SOUL.depth - 2;
else
    depth = SOUL.depth - 1;

hurttimer++;

if (instance_exists(BULLETBOARD))
{
    if (place_meeting(x, y, SOUL) && image_alpha > 0.6 && hurttimer >= 30)
    {
        if (pull == 1 && SOUL.pullpercent <= 0.5)
        {
            SOUL.hurt = true;
            hurttimer = -1;
        }
        
        if (pull == 2 && SOUL.pullpercent > 0.5 && hurttimer >= 30)
        {
            SOUL.hurt = true;
            hurttimer = -1;
        }
    }
}

if (place_meeting(x, y, TP) && !SOUL.hurt && image_alpha > 0.6 && ((pull == 2 && SOUL.pullpercent > 0.2) || (pull == 1 && SOUL.pullpercent <= 0.8)))
{
    tptimer++;
    
    if (tptimer == 1)
        TP.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}

percent1++;

if (percent1 <= 50)
{
    var position = animcurve_channel_evaluate(curveease, percent1 / 50);
    yoffset = lerp(-80, 0, position);
    image_alpha = lerp(0, 1, position);
}

shaketimer++;
randomize();
var xoffsetrandom = random_range(-4, 4);
var yoffsetrandom = random_range(-4, 4);

if (shaketimer == 0)
    shakemultiplier = 1;

if (shaketimer >= 0 && shaketimer <= 15)
    shakemultiplier -= (1/15);
else if (!ending)
    shakemultiplier = 0;

if (ending)
{
    if (endingtimer == 0)
        audio_play_sound(snd_rumble, 1, false, 1);
    
    anglemultiplier -= 0.1;
    anglemultiplier = clamp(anglemultiplier, 0, 3);
    endingtimer++;
    shakemultiplier = endingtimer / 30;
    
    if (endingtimer == 15)
    {
        SOUL.purple = false;
        audio_play_sound(snd_bell, 1, false, 0.8);
        audio_stop_sound(snd_stringpull);
    }
    
    if (endingtimer == 30)
    {
        var anglepie = 36;
        var p1 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p1.direction = image_angle + (anglepie * 10);
        p1.speed = 10;
        p1.image_angle = 18;
        var p2 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p2.direction = image_angle + (anglepie * 9);
        p2.speed = 10;
        p2.image_index = 9;
        p2.image_angle = 18;
        var p3 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p3.direction = image_angle + (anglepie * 8);
        p3.speed = 10;
        p3.image_index = 8;
        p3.image_angle = 18;
        var p4 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p4.direction = image_angle + (anglepie * 7);
        p4.speed = 10;
        p4.image_index = 7;
        p4.image_angle = 18;
        var p5 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p5.direction = image_angle + (anglepie * 6);
        p5.speed = 10;
        p5.image_index = 6;
        p5.image_angle = 18;
        var p6 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p6.direction = image_angle + (anglepie * 5);
        p6.speed = 10;
        p6.image_index = 5;
        p6.image_angle = 18;
        var p7 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p7.direction = image_angle + (anglepie * 4);
        p7.speed = 10;
        p7.image_index = 4;
        p7.image_angle = 18;
        var p8 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p8.direction = image_angle + (anglepie * 3);
        p8.speed = 10;
        p8.image_index = 3;
        p8.image_angle = 18;
        var p9 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p9.direction = image_angle + (anglepie * 2);
        p9.speed = 10;
        p9.image_index = 2;
        p9.image_angle = 18;
        var p10 = instance_create_depth(x, y, depth - 6, obj_pie_split_c3);
        p10.direction = image_angle + (anglepie * 1);
        p10.speed = 10;
        p10.image_index = 1;
        p10.image_angle = 18;
        audio_stop_sound(snd_rumble);
        audio_play_sound(snd_explosion_mmx3, 1, false, 1);
        instance_destroy();
    }
}

x = xx + xoffset + (xoffsetrandom * shakemultiplier);
y = yy + yoffset + (yoffsetrandom * shakemultiplier);

if (pull == 2)
{
    var time = current_time / 1000;
    image_xscale = 0.83 * xscalemultiplier * 2;
    image_yscale = 1.66;
    image_blend = purplecolor;
}
