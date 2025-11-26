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

if (pull == 1)
    depth = SOUL.depth - 2;
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

y_offset += pullspeed;
y = yy + y_offset;

if (y > (camera_get_view_y(view_camera[0]) + 520))
    instance_destroy();

x = xx + (sin(y_offset * frequency) * amplitude);
var delta = 1;
var dx = (sin((y_offset + delta) * frequency) - sin(y_offset * frequency)) * amplitude;
var dy = delta;
image_angle = 90 - radtodeg(arctan2(dy, dx));

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
    image_xscale = 0.83 * xscalemultiplier;
    image_yscale = 0.83 * xscalemultiplier;
    image_blend = purplecolor;
}
