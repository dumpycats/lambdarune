initialtimer++;
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (purple && !ending)
{
}

if (instance_exists(obj_SOUL_TP_sof))
    obj_SOUL_TP_sof.depth = depth;

var stringcolor0;

if (stringoption == 0)
    stringcolor0 = make_color_rgb((126 * stringalpha) / divider, (31 * stringalpha) / divider, (128 * stringalpha) / divider);
else
    stringcolor0 = make_color_rgb(126 * stringalpha, 31 * stringalpha, 128 * stringalpha);

var stringcolor1;

if (stringoption == 1)
    stringcolor1 = make_color_rgb((126 * stringalpha) / divider, (31 * stringalpha) / divider, (128 * stringalpha) / divider);
else
    stringcolor1 = make_color_rgb(126 * stringalpha, 31 * stringalpha, 128 * stringalpha);

var stringcolor2;

if (stringoption == 2)
    stringcolor2 = make_color_rgb((126 * stringalpha) / divider, (31 * stringalpha) / divider, (128 * stringalpha) / divider);
else
    stringcolor2 = make_color_rgb(126 * stringalpha, 31 * stringalpha, 128 * stringalpha);

if (purple && initialtimer > 17 && !ending)
{
    alphapercent += 0.16666666666666666;
    var position1 = animcurve_channel_evaluate(curvelinear, alphapercent);
    var stringalphastart = 1;
    stringalpha = 0 + (stringalphastart * position1);
    var leftrightoffset;
    
    if (!(global.leftoffset == 0))
        leftrightoffset = lerp(global.leftoffset, global.rightoffset, 0.5);
    else
        leftrightoffset = 0;
    
    var topbottomoffset;
    
    if (!(global.topoffset == 0))
        topbottomoffset = lerp(global.topoffset, global.bottomoffset, 0.5);
    else
        topbottomoffset = 0;
    
    if (ystrings)
    {
        if (!onestring && !twostring)
            draw_rectangle_color(cam_x + 285 + leftrightoffset, cam_y + 99 + global.topoffset, cam_x + 285 + leftrightoffset, cam_y + 240 + global.bottomoffset, stringcolor0, stringcolor0, stringcolor0, stringcolor0, 0);
        
        draw_rectangle_color((cam_x + 320 + leftrightoffset + twostringoffset) - twostringspace, cam_y + 99 + global.topoffset, (cam_x + 320 + leftrightoffset + twostringoffset) - twostringspace, cam_y + 240 + global.bottomoffset, stringcolor1, stringcolor1, stringcolor1, stringcolor1, 0);
        
        if (!onestring)
            draw_rectangle_color(cam_x + 355 + leftrightoffset + twostringoffset + twostringspace, cam_y + 99 + global.topoffset, cam_x + 355 + leftrightoffset + twostringoffset + twostringspace, cam_y + 240 + global.bottomoffset, stringcolor2, stringcolor2, stringcolor2, stringcolor2, 0);
    }
    else if (xstrings)
    {
        if (!onestring && !twostring)
            draw_rectangle_color(cam_x + 249 + global.leftoffset, cam_y + 132 + topbottomoffset, cam_x + 390 + global.rightoffset, cam_y + 132 + topbottomoffset, stringcolor0, stringcolor0, stringcolor0, stringcolor0, 0);
        
        draw_rectangle_color(cam_x + 249 + global.leftoffset, (cam_y + 170 + topbottomoffset + twostringoffset) - twostringspace, cam_x + 390 + global.rightoffset, (cam_y + 170 + topbottomoffset + twostringoffset) - twostringspace, stringcolor1, stringcolor1, stringcolor1, stringcolor1, 0);
        
        if (!onestring)
            draw_rectangle_color(cam_x + 249 + global.leftoffset, cam_y + 208 + topbottomoffset + twostringoffset + twostringspace, cam_x + 390 + global.rightoffset, cam_y + 208 + topbottomoffset + twostringoffset + twostringspace, stringcolor2, stringcolor2, stringcolor2, stringcolor2, 0);
    }
}
