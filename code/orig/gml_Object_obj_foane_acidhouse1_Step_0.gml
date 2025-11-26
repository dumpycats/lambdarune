if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
image_angle += anglespeed;

if (place_meeting(x, y - 20, obj_foane_acid))
{
    hitacid = true;
    speed = acidspeed;
    acidtimer++;
    acidspeed -= (1 / (20 * acidspeedmultiplier));
    acidspeed = clamp(acidspeed, 0, 2.5);
    direction = directionrange;
    image_alpha -= (1 / (30 * acidspeedmultiplier));
    
    if (image_alpha < 0)
        instance_destroy();
}

if (acidtimer == 0)
{
    randomize();
    
    if (obj_foane_acid.triggerup)
    {
        var pitchoffset = random_range(0, 0.2);
        audio_play_sound(snd_impact_water, 1, false, 0.6, false, 1 - pitchoffset);
    }
    else
    {
        var pitchoffset = random_range(0.3, 0.5);
        audio_play_sound(snd_impact_water, 1, false, 0.6, false, 1 - pitchoffset);
    }
}

if (pull == 1)
    depth = SOUL.depth - 4;
else
    depth = SOUL.depth - 1;

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
