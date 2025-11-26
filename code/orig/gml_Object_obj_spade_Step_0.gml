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

direction = image_angle;
var dsoul = point_direction(x, y, SOUL.x, SOUL.y);

if (randompick == 0)
    xxend = xx + 100;
else
    xxend = xx - 100;

image_alpha += 0.16666666666666666;
image_alpha = clamp(image_alpha, 0, 1);
var s1 = instance_create_depth(x, y, depth + 2, obj_spade_echo);
s1.image_angle = image_angle;
s1.image_alpha = image_alpha / 2;
s1.image_xscale = image_xscale;
s1.image_yscale = image_yscale;
percent1++;

if (percent1 <= 14)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 14);
    x = lerp(xx, xxend, position);
    image_angle = lerp(360, dsoul, position);
}
else if (percent1 == 15)
{
    audio_play_sound(snd_arrow, 1, false);
    speed += 3;
}
else if (percent1 == 16)
{
    speed += 2;
}
else if (percent1 == 17)
{
    speed += 1;
}
else if (percent1 == 17)
{
    speed += (2/3);
}
else
{
    speed += 0.5;
}

if (instance_exists(BULLETBOARD))
{
    if (place_meeting(x, y, SOUL) && image_alpha > 0.6)
    {
        if (pull == 1 && SOUL.pullpercent <= 0.5)
        {
            SOUL.hurt = true;
            instance_destroy();
        }
        
        if (pull == 2 && SOUL.pullpercent > 0.5)
        {
            SOUL.hurt = true;
            instance_destroy();
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

if (pull == 2)
{
    var time = current_time / 1000;
    image_xscale = 0.83;
    image_yscale = 0.83;
    image_blend = purplecolor;
}
