if (!global.alldown)
    percent1 += (0.005555555555555556 * obj_foane.amp);

function point_line_distance(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var dx = arg4 - arg2;
    var dy = arg5 - arg3;
    var len_sq = (dx * dx) + (dy * dy);
    
    if (len_sq == 0)
        return point_distance(arg0, arg1, arg2, arg3);
    
    var t = (((arg0 - arg2) * dx) + ((arg1 - arg3) * dy)) / len_sq;
    t = clamp(t, 0, 1);
    var closest_x = arg2 + (t * dx);
    var closest_y = arg3 + (t * dy);
    return point_distance(arg0, arg1, closest_x, closest_y);
}

var position1 = animcurve_channel_evaluate(curve1, percent1);
var delta_out = 1000;
out = 0 + (delta_out * position1);
draw_set_color(c_white);
draw_set_alpha(1);
var hole_size = 20 + holeoffset;
var angle_offset = anglecounter + (percent1 * 180);
var soul_exists = false;
var tp_exists = false;
var soul_x, soul_y;

if (instance_exists(obj_SOUL_battle_sof))
{
    soul_x = obj_SOUL_battle_sof.x;
    soul_y = obj_SOUL_battle_sof.y;
    soul_exists = true;
}

if (instance_exists(obj_SOUL_TP_sof))
{
    var tp_x = obj_SOUL_TP_sof.x;
    var tp_y = obj_SOUL_TP_sof.y;
    tp_exists = true;
}

for (var i = 0; i < 4; i++)
{
    var radius = out + i;
    var angle_step = 6;
    
    for (var angle = 0; angle < 360; angle += angle_step)
    {
        var adjusted_angle = angle + angle_offset;
        adjusted_angle = adjusted_angle % 360;
        var skip = false;
        
        for (var h = 0; h < hole_count; h++)
        {
            var start_angle = (h * (360 / hole_count)) + angle_offset;
            var end_angle = start_angle + hole_size;
            start_angle = start_angle % 360;
            end_angle = end_angle % 360;
            
            if (start_angle < end_angle)
            {
                if (adjusted_angle >= start_angle && adjusted_angle <= end_angle)
                {
                    skip = true;
                    break;
                }
            }
            else if (adjusted_angle >= start_angle || adjusted_angle <= end_angle)
            {
                skip = true;
                break;
            }
        }
        
        if (!skip)
        {
            var rad1 = degtorad(adjusted_angle);
            var rad2 = degtorad(adjusted_angle + angle_step);
            var x1 = x + (cos(rad1) * radius);
            var y1 = y + (sin(rad1) * radius);
            var x2 = x + (cos(rad2) * radius);
            var y2 = y + (sin(rad2) * radius);
            draw_line(x1, y1, x2, y2);
            
            if (!hit && soul_exists)
            {
                var dist = point_line_distance(soul_x, soul_y, x1, y1, x2, y2);
                var collision_threshold = 5;
                
                if (dist < collision_threshold)
                {
                    if (!instance_exists(obj_specialboom))
                    {
                        obj_SOUL_battle_sof.hurt = true;
                        hit = true;
                    }
                    else if (obj_specialboom.percent4 < 0.25)
                    {
                        obj_SOUL_battle_sof.hurt = true;
                        hit = true;
                    }
                }
            }
        }
    }
}

draw_set_alpha(1);

if (percent1 >= 1)
    instance_destroy();

if (deleteable && deleteself)
    instance_destroy();
