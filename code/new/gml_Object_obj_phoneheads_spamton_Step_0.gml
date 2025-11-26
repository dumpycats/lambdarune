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

timer++;
image_alpha = timer / 10;

if (timer >= 40)
{
    percentfall++;
    var falltime = 86;
    
    if (percentfall <= falltime)
    {
        var position = animcurve_channel_evaluate(curvefaster, percentfall / falltime);
        y = lerp(yy, cy + 370, position);
    }
}

if (timer == 40)
    audio_play_sound(snd_fall_cool_deep, 1, false, 1, false, 0.9);

if (pull == 1)
    depth = SOUL.depth - 2;
else
    depth = SOUL.depth - 1;

if (instance_exists(BULLETBOARD))
{
    if (place_meeting(x, y, SOUL) && image_alpha > 0.6)
    {
        if (pull == 1)
        {
            SOUL.hurt = true;
            instance_destroy();
        }
        
        if (pull == 2)
        {
            SOUL.hurt = true;
            instance_destroy();
        }
    }
}

image_blend = make_color_rgb(255, generaltimer, generaltimer);
generaltimer -= 4;
generaltimer = clamp(generaltimer, 0, 255);

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
