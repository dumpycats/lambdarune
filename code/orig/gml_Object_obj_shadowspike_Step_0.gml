if (instance_exists(obj_battle_kf))
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
timer++;

if (spinstatic)
{
    x = cx + 320 + (cos(degtorad(angle2)) * radius);
    y = cy + 170 + (sin(degtorad(angle2)) * radius);
    image_angle = point_direction(x, y, cx + 320, cy + 170) + 90;
    
    if (obj_shadowspike.radius < 0)
        instance_destroy(obj_shadowspike);
}
else if (godiagonal)
{
    if (x == (obj_SOUL_battle.x + 200) && y == (obj_SOUL_battle.y + 200))
    {
        endx = obj_SOUL_battle.x - 200;
        endy = obj_SOUL_battle.y - 200;
        image_angle = -135;
    }
    
    if (x == (obj_SOUL_battle.x - 200) && y == (obj_SOUL_battle.y + 200))
    {
        endx = obj_SOUL_battle.x + 200;
        endy = obj_SOUL_battle.y - 200;
        image_angle = -225;
    }
    
    if (x == (obj_SOUL_battle.x + 200) && y == (obj_SOUL_battle.y - 200))
    {
        endx = obj_SOUL_battle.x - 200;
        endy = obj_SOUL_battle.y + 200;
        image_angle = -45;
    }
    
    if (x == (obj_SOUL_battle.x - 200) && y == (obj_SOUL_battle.y - 200))
    {
        endx = obj_SOUL_battle.x + 200;
        endy = obj_SOUL_battle.y + 200;
        image_angle = 45;
    }
    
    percent1 += 0.016666666666666666;
    
    if (percent1 < (1/3))
    {
        if (!(global.turn == 15))
            image_alpha += 0.25;
    }
    else if (percent1 > (2/3))
    {
        image_alpha -= 0.25;
    }
    
    image_alpha = clamp(image_alpha, 0, 1);
    var position1 = animcurve_channel_evaluate(curvefaster, percent1);
    var delta_x = endx - startx;
    var delta_y = endy - starty;
    x = startx + (delta_x * position1);
    y = starty + (delta_y * position1);
}
else if (golinear)
{
    if (x == (obj_SOUL_battle.x + 150))
    {
        endx = obj_SOUL_battle.x - 150;
        endy = obj_SOUL_battle.y;
        image_angle = -90;
    }
    
    if (x == (obj_SOUL_battle.x - 150))
    {
        endx = obj_SOUL_battle.x + 150;
        endy = obj_SOUL_battle.y;
        image_angle = 90;
    }
    
    if (y == (obj_SOUL_battle.y + 150))
    {
        endx = obj_SOUL_battle.x;
        endy = obj_SOUL_battle.y - 150;
        image_angle = 180;
    }
    
    if (y == (obj_SOUL_battle.y - 150))
    {
        endx = obj_SOUL_battle.x;
        endy = obj_SOUL_battle.y + 150;
    }
    
    percent1 += 0.016666666666666666;
    
    if (percent1 < (1/3))
    {
        if (!(global.turn == 15))
            image_alpha += 0.25;
    }
    else if (percent1 > (2/3))
    {
        image_alpha -= 0.25;
    }
    
    image_alpha = clamp(image_alpha, 0, 1);
    var position1 = animcurve_channel_evaluate(curvefaster, percent1);
    var delta_x = endx - startx;
    var delta_y = endy - starty;
    x = startx + (delta_x * position1);
    y = starty + (delta_y * position1);
}
else if (down)
{
    if (!(global.turn == 15))
        image_alpha += 0.25;
    
    if (!up)
    {
        direction = -90;
        speed = 3.5;
    }
    else
    {
        direction = 90;
        speed = 3.5;
    }
}
else if (randomshoot)
{
    percent1 += (0.016666666666666666 * percentoffset);
    
    if (sprite_index == spr_kreidknife_2)
        image_angle = angle1 + 90;
    
    if (percent1 < 0.08333333333333333)
    {
        if (!(global.turn == 15))
            image_alpha += 0.25;
        
        image_alpha = clamp(image_alpha, 0, 1);
    }
    else if (percent1 > 0.9333333333333333)
    {
        image_alpha -= 0.25;
    }
    
    if (image_alpha < -0.25)
        instance_destroy();
    
    x = lerp(start_x, end_x, percent1);
    y = lerp(start_y, end_y, percent1);
    
    if (!(sprite_index == spr_kreidknife_2))
        image_angle = point_direction(start_x, start_y, end_x, end_y) + 90;
}
else if (global.turn == 3 || global.turn == phase1end)
{
    image_angle = point_direction(x, y, cx + 320, cy + 170) - 180;
    percent1 += 0.016666666666666666;
    percent1 = clamp(percent1, 0, 100);
    
    if (percent1 < 0.08333333333333333)
    {
        if (!(global.turn == 15))
            image_alpha += 0.25;
        
        image_alpha = clamp(image_alpha, 0, 1);
    }
    
    var angle = percent1 * 360;
    x = cx + 320 + (cos(degtorad(angle)) * radius);
    y = cy + 170 + (sin(degtorad(angle)) * radius);
}

if (global.turn == 2 || global.turn == 10)
{
    if (x < -100 && leftright == 0)
        instance_destroy();
    else if (x > 740 && leftright == 1)
        instance_destroy();
    
    if (leftright == 0)
    {
        if (timer == 0)
        {
            if (!(global.turn == 15))
                image_alpha = 1;
            
            x = cx + 217;
            speed = 3 * speedmultiplier;
        }
    }
    else if (leftright == 1)
    {
        if (timer == 0)
        {
            if (!(global.turn == 15))
                image_alpha = 1;
            
            x = cx + 423;
            speed = -3 * speedmultiplier;
        }
    }
}

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
