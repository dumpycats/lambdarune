var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
image_alpha = 0;
leftright = 1;
timer = -1;
surf2 = -2;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = 0;
radius = 90;
spinstatic = false;
golinear = false;
godiagonal = false;
startx = x;
starty = y;
endx = 0;
endy = 0;
down = false;
up = false;
randomshoot = false;
speedmultiplier = 1;
phase1end = 7;
speedoffset = 1;
angle2 = 0;

if (instance_exists(obj_SOUL_battle) && global.turn == 12)
{
    x = cx + 320 + (cos(degtorad(angle2)) * radius * 10);
    y = cy + 170 + (sin(degtorad(angle2)) * radius * 10);
}

if (instance_exists(obj_SOUL_battle) && (global.turn == 3 || global.turn == phase1end || global.turn == 9 || global.turn == 13))
{
    if (global.turn == phase1end)
        percentoffset = 2/3;
    else if (global.turn == 9)
        percentoffset = 1;
    else
        percentoffset = 1;
    
    angle1 = random_range(0, 360);
    distance = random_range(150, 200);
    
    if (global.turn == 9)
        distance = random_range(200, 280);
    
    target_x = obj_SOUL_battle.x + lengthdir_x(distance, angle1);
    target_y = obj_SOUL_battle.y + lengthdir_y(distance, angle1);
    start_x = target_x;
    start_y = target_y;
    end_x = obj_SOUL_battle.x - (target_x - obj_SOUL_battle.x);
    end_y = obj_SOUL_battle.y - (target_y - obj_SOUL_battle.y);
}

hit = false;
tptimer = 0;
