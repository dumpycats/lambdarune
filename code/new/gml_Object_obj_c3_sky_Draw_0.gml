var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_sprite_ext(spr_c3_sky, 0, pos_x, pan_y, 2, 2, 0, c_white, image_alpha);
draw_sprite_ext(spr_c3_sky, 0, pos_x + 640, pan_y, 2, 2, 0, c_white, image_alpha);
draw_sprite_ext(spr_kreidmoon, 0, pos_x2 + 60, cy + 80 + (pan_y - 512), 2, 2, 0, c_white, image_alpha);

for (var i = 0; i < 3; i++)
{
    var glow_size = ((sin(timer / 28.64788975654116) * 0.02) + 1.1 + (i * 0.05)) * 2;
    var glow_alpha = (sin(timer / 28.64788975654116) * 0.002) + 0.06;
    draw_sprite_ext(spr_kreidmoon, 0, pos_x2 + 60, cy + 80 + (pan_y - 512), glow_size, glow_size, 0, c_white, image_alpha * glow_alpha);
}

draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, blackalpha);

if (instance_exists(obj_battle_kf))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

percent1 += (0.00016666666666666666 * xmultiplier);
percent1moon += (0.00016666666666666666 * xmultiplier);
timer++;
var position1 = animcurve_channel_evaluate(curvelinear, percent1);
var position2 = animcurve_channel_evaluate(curvelinear, percent1moon);
var delta_x = cx - 320 - (cx + 320);
pos_x = cx + 320 + (delta_x * position1);
var delta_x2 = cx - 160 - (cx + 480);
pos_x2 = cx + 480 + (delta_x * position2);

if (percent1 == 1)
    percent1 = 0;

if (room == rm_ch3_kreidfight || room == rm_ch3_kreidfight_skip)
{
    y = pan_y;
    
    if (finalpanning)
    {
        finalpercent += 0.0010309278350515464;
        var position3 = animcurve_channel_evaluate(curvefaster, finalpercent);
        var delta_y = (cy + 0) - pan_y_tracker;
        pan_y = pan_y_tracker + (delta_y * position3);
    }
    else if (panning)
    {
        panpercent += 0.00022222222222222223;
        var position3 = animcurve_channel_evaluate(curvelinear, panpercent);
        var delta_y = (cy + 100) - 512;
        pan_y = 512 + (delta_y * position3);
        pan_y_tracker = pan_y;
    }
    else
    {
        pan_y_tracker = pan_y;
    }
}
else if (room == rm_ch3_plane)
{
    panpercent += 0.0005;
    var position3 = animcurve_channel_evaluate(curveslower, panpercent);
    var delta_y = (cy + 400) - -10;
    pan_y = -10 + (delta_y * position3);
}
