var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
timer++;

if (timer == 3)
{
    if (yy == 123)
        endy = 215;
    
    if (yy == 157)
        endy = 223;
    
    if (yy == 191)
        endy = 230;
    
    if (yy == 324)
        endy = 279;
    
    if (yy == 358)
        endy = 287;
    
    if (yy == 392)
        endy = 295;
}

if (!reveal)
    y = round(yy + global.yoffset);

if (slightmove)
{
    image_speed = random_range(0.7, 1);
    y -= 6;
    x += 6;
    slightmove = false;
}

if (sprite_index == spr_shadowman_idle)
{
    tracktimer++;
    
    if (tracktimer == 3)
        tracky = y;
}

if (closein)
{
    percent1 += 0.05;
    var position1 = animcurve_channel_evaluate(curvelinear, percent1);
    var delta_y;
    
    if (y < 255)
        delta_y = (endy + kreidtouchoffset) - tracky;
    else
        delta_y = endy - kreidtouchoffset - tracky;
    
    y = tracky + (delta_y * position1);
    
    if (place_meeting(x, y, obj_kreid_plane))
        kreidtouchoffset--;
    else
        kreidtouchoffset++;
    
    kreidtouchoffset = clamp(kreidtouchoffset, 0, 20);
    
    if (percent1 > 2)
    {
    }
    
    if (percent1 == 1.5)
    {
        obj_plane_text.talking = true;
        obj_plane_text.dialogue = 16;
        
        with (obj_plane_text)
            reset_dialogue_normal();
    }
}

if (sprite_index == spr_shadowman_sit)
    depth = -y - 25;
else
    depth = -y - 31;

if (image_index >= 4 && sprite_index == spr_shadowman_sit)
    image_speed = 0;

if (obj_kreid_plane.begone)
    speed = -obj_kreid_plane.begonevalue;
