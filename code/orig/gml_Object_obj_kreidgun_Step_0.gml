var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (instance_exists(obj_battle_kf))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

percent1 += (1/120);
percent2 += (1/120);
percent1 = clamp(percent1, 0, 100);
globaltimer++;

if (globaltimer < 5)
{
    image_alpha += 0.25;
    image_alpha = clamp(image_alpha, 0, 1);
}

var angle;

if (spin)
    angle = percent1 * 360;
else
    angle = percent1 * 360;

x = cx + 320 + (cos(degtorad(angle)) * radius);
y = cy + 170 + (sin(degtorad(angle)) * radius);
image_angle = point_direction(x, y, obj_SOUL_battle.x, obj_SOUL_battle.y) - 180;
timer++;

if ((timer % 30) == 0 && timer > 1)
{
    shottrigger = true;
    image_index = 1;
    
    if (audible)
        audio_play_sound(snd_bulletshot, 1, false, 0.8);
    
    if (image_alpha >= 0.6)
    {
        var a = instance_create_depth(x, y, depth + 1, obj_kreidbullet_2);
        a.follow = true;
        a.image_angle = image_angle;
        a.direction = image_angle - 180;
    }
}

if (shottrigger)
{
    timer2++;
    
    if (timer2 == 3)
    {
        if (onebullet)
            out = true;
        
        shottrigger = false;
        timer2 = -1;
        image_index = 0;
    }
}

if (out)
{
    outpercent += 0.2;
    var position1 = animcurve_channel_evaluate(curvelinear, outpercent);
    var delta_x = -1;
    image_alpha = 1 + (delta_x * position1);
}

if (timer > 5 && image_alpha <= 0)
    instance_destroy();
