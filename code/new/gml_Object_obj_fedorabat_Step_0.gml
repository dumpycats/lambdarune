if (instance_exists(obj_battle_kf))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

timer++;
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!(global.leftoffset == 0))
    var leftrightoffset = lerp(global.leftoffset, global.rightoffset, 0.5);
else
    var leftrightoffset = 0;

var topbottomoffset;

if (!(global.topoffset == 0))
    topbottomoffset = lerp(global.topoffset, global.bottomoffset, 0.5);
else
    topbottomoffset = 0;

if (stringposition == 1 || stringposition == 4)
    pos = cy + 132 + topbottomoffset;
else if (stringposition == 2 || stringposition == 5)
    pos = cy + 170 + topbottomoffset;
else if (stringposition == 3 || stringposition == 6)
    pos = cy + 208 + topbottomoffset;

if (xtoup)
{
    image_alpha += 0.25;
    percent1 += 0.05;
    
    if (percent1 <= 1)
    {
        percent1 = clamp(percent1, 0, 1);
        var position1 = animcurve_channel_evaluate(curveslower, percent1);
        var delta_x = targetx - (obj_kreid_c3.x + 16);
        var delta_y = (cy + 260) - (obj_kreid_c3.y + 16);
        x = obj_kreid_c3.x + 16 + (delta_x * position1);
        y = obj_kreid_c3.y + 16 + (delta_y * position1);
    }
    else
    {
        percent2 += 0.02;
        var position1 = animcurve_channel_evaluate(curvefaster, percent2);
        var delta_y = targety - (cy + 260);
        y = cy + 260 + (delta_y * position1);
        
        if (percent2 == 1)
            instance_destroy();
    }
}
else if (strings)
{
    stringpercent += (1/15);
    stringpercent = clamp(stringpercent, 0, 1);
    var position1 = animcurve_channel_evaluate(curveease, stringpercent);
    var delta_y = pos - (obj_kreid_c3.y + 16);
    y = obj_kreid_c3.y + 16 + (delta_y * position1);
    percent1 += (1/120);
    percent1 = clamp(percent1, 0, 2);
    var position = animcurve_channel_evaluate(curvelinear, percent1);
    image_alpha = position * 40;
    x = (obj_kreid_c3.x + 16) - (position * 640);
}
else
{
    percent1 += 0.005;
    percent1 = clamp(percent1, 0, 2);
    var position = animcurve_channel_evaluate(curvelinear, percent1);
    image_alpha = position * 40;
    x = (obj_kreid_c3.x + 16) - (position * 640);
    y = obj_kreid_c3.y + 16 + ((sin(degtorad(percent1 * (720 * randomizer * flip))) * (80 * randomizer)) - (position * timer));
    image_angle = sin(timer * 0.2) * 10;
}

if (x < -50)
    instance_destroy();

if (instance_exists(obj_bulletboard_kf))
{
    if (place_meeting(x, y, obj_SOUL_battle) && image_alpha > 0.6 && !hit)
    {
        obj_SOUL_battle.hurt = true;
        hit = true;
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_SOUL_TP) && !obj_SOUL_battle.hurt && image_alpha > 0.6)
{
    tptimer++;
    
    if (tptimer == 1)
        obj_SOUL_TP.add = true;
    
    if (tptimer == 6)
        tptimer = 0;
}
