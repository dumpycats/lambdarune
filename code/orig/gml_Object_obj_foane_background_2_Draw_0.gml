var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (room == rm_ch3_foaneend)
    draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, 0.5);

draw_sprite_ext(sprite_index, 0, cx + percent0, cy + 240, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 0, cx + percent0 + 640, cy + 240, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 1, cx + percent0, cy + 240, image_xscale, image_yscale, 0, c_white, 0.4);
draw_sprite_ext(sprite_index, 1, cx + percent0 + 640, cy + 240, image_xscale, image_yscale, 0, c_white, 0.4);
draw_sprite_ext(sprite_index, 2, cx + percent2, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 2, (cx + percent2) - 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 3, cx + percent3, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 3, cx + percent3 + 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 4, cx + percent4, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 4, (cx + percent4) - 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 5, cx + percent5, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 5, cx + percent5 + 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 6, cx + percent6, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 6, (cx + percent6) - 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 7, cx + percent7, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1/3);
draw_sprite_ext(sprite_index, 7, cx + percent7 + 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1/3);
draw_sprite_ext(sprite_index, 8, cx + percent8, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 8, cx + percent8 + 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 9, cx + percent9, cy + 240, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 9, cx + percent9 + 640, cy + 240, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 10, cx + percent10, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 10, (cx + percent10) - 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 11, cx + percent11, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 11, cx + percent11 + 640, cy + 240 + yoffset, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 13, cx + percent13, cy + 240, image_xscale, image_yscale, 0, c_white, 0.4);
draw_sprite_ext(sprite_index, 13, cx + percent13 + 640, cy + 240, image_xscale, image_yscale, 0, c_white, 0.4);
draw_sprite_ext(sprite_index, 14, cx + percent14, cy + 240, image_xscale, image_yscale, 0, c_white, 0.4);
draw_sprite_ext(sprite_index, 14, (cx + percent14) - 640, cy + 240, image_xscale, image_yscale, 0, c_white, 0.4);
draw_set_color(c_white);

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

if (trigger)
{
    percenty1++;
    
    if (percenty1 <= 40)
    {
        var position = animcurve_channel_evaluate(curveslower, percenty1 / 40);
        yoffset = lerp(80, 0, position);
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
        percent15 += (1.875 * multiplier * -1);
        percent14 += (1.75 * multiplier);
        percent13 += (1.625 * multiplier * -1);
        percent12 += (1.5 * multiplier);
        percent11 += (1.375 * multiplier * -1);
        percent10 += (1.25 * multiplier);
        percent9 += (1.125 * multiplier * -1);
        percent8 += (1 * multiplier * -1);
        percent7 += (0.875 * multiplier * -1);
        percent6 += (0.75 * multiplier);
        percent5 += (0.625 * multiplier * -1);
        percent4 += (0.5 * multiplier);
        percent3 += (0.375 * multiplier * -1);
        percent2 += (0.25 * multiplier);
        percent1 += (0.125 * multiplier * -1);
        percent0 += (0.125 * multiplier * -1);
    }
}
else
{
    percent15 += (1.875 * multiplier * -1);
    percent14 += (1.75 * multiplier);
    percent13 += (1.625 * multiplier * -1);
    percent12 += (1.5 * multiplier);
    percent11 += (1.375 * multiplier * -1);
    percent10 += (1.25 * multiplier);
    percent9 += (1.125 * multiplier * -1);
    percent8 += (1 * multiplier * -1);
    percent7 += (0.875 * multiplier * -1);
    percent6 += (0.75 * multiplier);
    percent5 += (0.625 * multiplier * -1);
    percent4 += (0.5 * multiplier);
    percent3 += (0.375 * multiplier * -1);
    percent2 += (0.25 * multiplier);
    percent1 += (0.125 * multiplier * -1);
    percent0 += (0.125 * multiplier * -1);
}

if (percent15 <= -320)
    percent15 = 320;

if (percent14 >= 960)
    percent14 = 320;

if (percent13 <= -320)
    percent13 = 320;

if (percent12 >= 960)
    percent12 = 320;

if (percent11 <= -320)
    percent11 = 320;

if (percent10 >= 960)
    percent10 = 320;

if (percent9 <= -320)
    percent9 = 320;

if (percent8 <= -320)
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

draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, 1/3);

if (room == rm_ch3_sof)
    draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, alpha);
