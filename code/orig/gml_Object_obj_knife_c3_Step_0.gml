var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

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

if (percent1 <= 15)
{
    var position = animcurve_channel_evaluate(curveease, percent1 / 15);
    image_alpha = lerp(0, 1, position);
}

percent2 += (1 * multiplier);
var angle = (percent2 / 60) * 360;
x = cx + 320 + (cos(degtorad(angle)) * radius);
y = cy + 170 + (sin(degtorad(angle)) * radius);
image_angle = point_direction(x, y, cx + 320, cy + 170);
timer++;

if ((timer % 44) == 0 && timer >= 40 && instance_exists(obj_pie_c3) && obj_pie_c3.slash < 5)
{
    slash = true;
    radiussave = radius;
}
else if (((timer + 10) % 44) == 0 && timer >= 30 && instance_exists(obj_pie_c3) && obj_pie_c3.slash < 5)
{
    audio_play_sound(snd_bell_bc, 1, false, 0.7);
}

if (slash)
{
    slashpercent++;
    
    if (slashpercent == 2)
    {
        randomize();
        var randompitchoffset = random_range(-0.05, 0.05);
        audio_play_sound(mus_sfx_swipe, 1, false, 0.6, false, 1 + randompitchoffset);
        multiplier *= -1.2;
        obj_pie_c3.shaketimer = -1;
        obj_pie_c3.slash += 1;
        obj_pie_c3.image_angle = image_angle - (obj_pie_c3.slash * 72);
        
        if (pull == 1)
            pull = 2;
        else if (pull == 2)
            pull = 1;
    }
    
    if (slashpercent <= 15)
    {
        var position = animcurve_channel_evaluate(curveslower, slashpercent / 15);
        radius = lerp(radiussave, radiussave * -0.95, position);
    }
    else
    {
        slash = false;
        slashpercent = 0;
        
        if (obj_pie_c3.slash >= 5)
        {
            ending = true;
            obj_pie_c3.ending = true;
        }
    }
}

if (ending)
    image_alpha -= 0.1;

var s1 = instance_create_depth(x, y, depth, obj_knife_c3_echo);
s1.image_xscale = image_xscale;
s1.image_yscale = image_yscale;
s1.image_blend = image_blend;
s1.image_angle = image_angle;
s1.image_alpha = image_alpha / 2;

if (pull == 2)
{
    var time = current_time / 1000;
    image_xscale = 0.83 * xscalemultiplier * 2;
    image_yscale = 1.66;
    image_blend = purplecolor;
}
