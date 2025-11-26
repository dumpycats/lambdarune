var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (room == rm_ch3_foaneend)
{
}

depth = obj_ralsei_sof.depth - 2;
draw_sprite_ext(sprite_index, 12, cx + percent8, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(sprite_index, 12, (cx + percent8) - 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);
multiplier = obj_foane_background_2.multiplier;

if (trigger)
{
    percenty1++;
    
    if (percenty1 <= 40)
    {
        var position = animcurve_channel_evaluate(curveslower, percenty1 / 40);
        yoffset = lerp(80, 0, position);
    }
}

if (alpha <= 0)
{
    if (!instance_exists(obj_battle_sof))
        multiplier += 0.05;
    else if (instance_exists(obj_battle_sof) && obj_battle_sof.finaltalktimer >= 0)
        multiplier += 0.0020833333333333333;
    else if (instance_exists(obj_battle_sof) && global.endofbattle)
        multiplier -= 0.025;
    
    multiplier = clamp(multiplier, 0, 1);
}

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        percent10 += (2 * multiplier);
        percent9 += (1.8 * multiplier * -1);
        percent8 += (1.6 * multiplier);
        percent7 += (1.4 * multiplier * -1);
        percent6 += (1.2 * multiplier);
        percent5 += (1 * multiplier * -1);
        percent4 += (0.8 * multiplier);
        percent3 += (0.6 * multiplier * -1);
        percent2 += (0.4 * multiplier);
        percent1 += (0.2 * multiplier * -1);
        percent0 += (0.2 * multiplier * -1);
    }
}
else
{
    percent10 += (2 * multiplier);
    percent9 += (1.8 * multiplier * -1);
    percent8 += (1.6 * multiplier);
    percent7 += (1.4 * multiplier * -1);
    percent6 += (1.2 * multiplier);
    percent5 += (1 * multiplier * -1);
    percent4 += (0.8 * multiplier);
    percent3 += (0.6 * multiplier * -1);
    percent2 += (0.4 * multiplier);
    percent1 += (0.2 * multiplier * -1);
    percent0 += (0.2 * multiplier * -1);
}

if (percent10 >= 960)
    percent10 = 320;

if (percent9 <= -320)
    percent9 = 320;

if (percent8 >= 960)
    percent8 = 320;

if (percent7 <= -320)
    percent7 = 320;

if (percent6 >= 960)
    percent6 = 320;

if (percent5 <= -320)
    percent5 = 320;

if (percent4 >= 960)
    percent4 = 320;

if (percent3 <= -320)
    percent3 = 320;

if (percent2 >= 960)
    percent2 = 320;

if (percent1 <= -320)
    percent1 = 320;

if (percent0 <= -320)
    percent0 = 320;

if (room == rm_ch3_sof)
{
}
