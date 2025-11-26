var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
image_alpha = 1;
timer++;
timer2++;

if (timer == 2)
{
    instance_create_depth(x, y, depth + 1, obj_shadowbullet_echo);
    depth = -51;
    timer = 0;
}

if (timer2 == 3)
{
    oKrisPlayerC3.sprite_index = sKrisWalkRight;
    oSusieC3.sprite_index = sSusieShocked;
}

if (timer2 > 3 && timer2 <= 11)
{
    percent1 += 0.2;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = 374;
    var _end = 334;
    var _distance = _end - _start;
    oKrisPlayerC3.x = _start + (_distance * position);
    percent2 += 0.2;
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = 374;
    var _end2 = 414;
    var _distance2 = _end2 - _start2;
    oSusieC3.x = _start2 + (_distance2 * position2);
}

if (timer2 == 35)
{
    global.dialoguetop = false;
    global.dialogue = 4;
    global.charactertalking = true;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sSusieDialogueSprite;
    oDialogueSprite.image_index = 34;
    instance_create_depth(320, cam_y - 270, -50, oTextC3R3);
}

if (global.dialogue == 7)
{
    if (!dim_active)
    {
        dim_timer = 0;
        dim_active = true;
    }
    
    if (dim_active && dim_timer <= dim_duration)
    {
        var blend_ratio = dim_timer / dim_duration;
        oSusieC3.image_blend = merge_color(c_white, c_black, 0.5 * blend_ratio);
        dim_timer++;
    }
    
    if (dim_timer > dim_duration)
        dim_active = true;
}
