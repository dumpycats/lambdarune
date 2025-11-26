var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (image_index == 0 && percent1 <= ((404 + fixoffset) / 400))
    draw_sprite_ext(spr_foane_1, 0, x - 2, y, 0.5, 0.5, 0, make_color_rgb(blendvalue, blendvalue, blendvalue), 1);

draw_self();
image_blend = make_color_rgb(blendvalue, blendvalue, blendvalue);
blendvalue = clamp(blendvalue, 128, 255);

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        percent1 += 0.0025;
    }
}

if (percent1 >= 0.8375)
{
    if (blendvalue < 252.7)
        blendvalue += 4.3;
    else
        blendvalue = 255;
}

if (percent1 <= 1)
{
    var position1 = animcurve_channel_evaluate(curve1, percent1);
    var delta_x = (cam_x + 100 + xx) - ((cam_x - 150) + xx);
    x = (cam_x - 150) + xx + (delta_x * position1);
}
else
{
    x = cam_x + 200 + xx;
    percent2 += 0.1;
    var position1 = animcurve_channel_evaluate(curve2, percent2);
}

if (percent1 == ((405 + fixoffset + 2) / 400))
{
    depth -= 30;
    image_speed = 1;
    image_index = 1;
    x = cam_x + 200;
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
        time = current_time / 1000;
    }
}

y = round(yy + (sin(time * 0.3 * pi) * 10) + yoffset);
xx = round(sin(time * 0.25 * pi) * -3);

if (percent1 >= ((555 + fixoffset) / 400))
{
    percent3 += 0.01;
    var position1 = animcurve_channel_evaluate(curve3, percent3);
    var delta_offset = 60;
    yoffset = 0 + (delta_offset * position1);
}

if (image_index == 16)
    sprite_index = spr_foane_idle;

if (percent1 == 1.5375)
{
    image_index = 0;
    sprite_index = spr_foane_point;
    image_speed = 1;
}

if (sprite_index == spr_foane_point && image_index >= 16)
{
    image_speed = 1;
    sprite_index = spr_foane_idle_point;
    shoottime = true;
}

if (!global.alldown)
{
    if (shoottime == true)
    {
        obj_bulletboard_sof_end.topdown += 1;
        
        if (percent1 > 1.575 && percent1 <= 2.03)
        {
            amp += 0.004;
            scalefinal += 0.03;
            var scale = 0.2 + (sin(time * 14.239) * scalefinal);
            draw_sprite_ext(spr_specialboom, 0, x + 22, y - 258, 0.2 * scale, 0.2 * scale, 0, c_white, 1);
        }
        
        if (percent1 == 1.575)
        {
            var a = instance_create_depth(x + 20, y - 257, depth - 30, obj_circleblast);
            a.holeoffset = -2;
            a.anglecounter = 70;
        }
        
        if (percent1 == 1.7)
        {
            var a = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            a.hole_count = 6;
            a.anglecounter = 30;
            a.holeoffset = -4;
        }
        
        if (percent1 == 1.8)
        {
            var b = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            b.hole_count = 5;
            b.holeoffset = -6;
        }
        
        if (percent1 == 1.875)
        {
            var a = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            a.hole_count = 4;
            a.anglecounter = 60;
            a.holeoffset = -8;
        }
        
        if (percent1 == 1.9125)
        {
            var b = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            b.hole_count = 5;
            b.holeoffset = -10;
        }
        
        if (percent1 == 1.9125)
            audio_sound_gain(snd_phone, 0.5, 500);
        
        if (percent1 == 1.95)
        {
            var a = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            a.hole_count = 6;
            a.holeoffset = -10;
        }
        
        if (percent1 == 1.975)
        {
            var b = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            b.hole_count = 4;
            b.holeoffset = -10;
        }
        
        if (percent1 == 2)
        {
            var b = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            b.hole_count = 3;
            b.holeoffset = -10;
        }
        
        if (percent1 == 2.0125)
        {
            var ba = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            ba.hole_count = 3;
            ba.holeoffset = -8;
            ba.deleteable = true;
        }
        
        if (percent1 == 2.025)
        {
            var bc = instance_create_depth(x + 22, y - 258, depth - 30, obj_circleblast);
            bc.hole_count = 2;
            bc.holeoffset = -8;
            bc.deleteable = true;
        }
        
        if (percent1 > 2.03)
            finalout = true;
    }
}
