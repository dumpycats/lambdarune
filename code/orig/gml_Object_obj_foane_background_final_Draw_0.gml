var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (room == rm_ch3_foaneend)
    draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, 0.5);

draw_set_color(c_white);

if (moving)
{
    image_alpha += 0.05;
    
    if (!instance_exists(obj_battle_sof))
        multiplier += 0.05;
    else if (global.alldown)
        multiplier = 0;
    else if (instance_exists(obj_battle_sof) && obj_battle_sof.finaltalktimer >= 0)
        multiplier += 0.0020833333333333333;
    else if (instance_exists(obj_battle_sof) && global.endofbattle)
        multiplier -= 0.025;
    
    multiplier = clamp(multiplier, 0, 1);
    image_alpha = clamp(image_alpha, 0, 1);
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

if (instance_exists(obj_battle_sof) && global.alldown)
{
    image_speed = 0;
    speed = 0;
}
else
{
    subimg1 += ((1/15) * subimgspeed);
    subimg2 += (0.1 * subimgspeed);
    subimg3 += (0.13333333333333333 * subimgspeed);
}

draw_sprite_ext(spr_foane_background_final, 0, cx + 320, y + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 1, (cx + percent1) - 258, y + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 1, cx + percent1, y + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_static_1, subimg1, (cx + percent1) - 516, y + yoffset, image_xscale, image_yscale, 0, c_white, (image_alpha / 5) + antialpha);
draw_sprite_ext(spr_foane_background_static_1, subimg1, cx + percent1, y + yoffset, image_xscale, image_yscale, 0, c_white, (image_alpha / 5) + antialpha);
draw_sprite_ext(spr_foane_background_final, 2, (cx + backpercent2) - (640 * back), y, image_xscale, image_yscale, 0, c_white, image_alpha / 3);
draw_sprite_ext(spr_foane_background_final, 2, cx + backpercent2, y, image_xscale, image_yscale, 0, c_white, image_alpha / 3);
draw_sprite_ext(spr_foane_background_final, 3, (cx + percent3) - (640 * forward), y, image_xscale, image_yscale, 0, c_white, image_alpha / 3);
draw_sprite_ext(spr_foane_background_final, 3, cx + percent3, y, image_xscale, image_yscale, 0, c_white, image_alpha / 3);
draw_sprite_ext(spr_foane_background_final, 4, (cx + backpercent4) - (640 * back), y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 4, cx + backpercent4, y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 5, (cx + percent5) - (640 * forward), y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 5, cx + percent5, y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 6, (cx + backpercent6) - (640 * back), y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 6, cx + backpercent6, y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 7, (cx + percent7) - (640 * forward), y + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 7, cx + percent7, y + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_static_2, subimg2, (cx + percent7) - (640 * forward), y + yoffset, image_xscale, image_yscale, 0, c_white, (image_alpha / 4) + antialpha);
draw_sprite_ext(spr_foane_background_static_2, subimg2, cx + percent7, y + yoffset, image_xscale, image_yscale, 0, c_white, (image_alpha / 4) + antialpha);
draw_sprite_ext(spr_foane_background_final, 9, (cx + backpercent9) - (640 * back), y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 9, cx + backpercent9, y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 10, (cx + percent10) - (640 * forward), y + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foane_background_final, 10, cx + percent10, y + yoffset, image_xscale, image_yscale, 0, c_white, image_alpha);

if (instance_exists(obj_battle_sof) && !instance_exists(obj_foane) && !(room == rm_ch3_foaneend))
{
    if (!surface_exists(surf2))
        surf2 = surface_create(660, 500);
    
    surface_set_target(surf2);
    draw_clear_alpha(c_black, 0);
    draw_sprite_ext(spr_foane_background_static_3, subimg3, (percent10 - (640 * forward)) + cx, y + yoffset, image_xscale, image_yscale, 0, c_white, 1 + antialpha);
    draw_sprite_ext(spr_foane_background_static_3, subimg3, percent10 + cx, y + yoffset, image_xscale, image_yscale, 0, c_white, 1 + antialpha);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    draw_set_color(c_white);
    
    if (surface_exists(surf_game))
    {
        draw_surface_part_ext(surf_game, 450, 134, 100, 56, (cx + percent10extra) - 100, cy + 78, 2, 2, 16777215, image_alpha);
        
        if (instance_exists(obj_SOUL_battle_sof))
        {
            draw_surface_part_ext(surf_game, (283 + SOULx) - 339, (142 + SOULy) - 189, 100, 56, (cx + percent10extra) - 100 - 640, cy + 78, 2, 2, 16777215, image_alpha);
            draw_surface_part_ext(surf_game, (283 + SOULx) - 339, (142 + SOULy) - 189, 100, 56, (cx + percent10extra) - 100 - 1280, cy + 78, 2, 2, 16777215, image_alpha);
        }
        else
        {
            draw_surface_part_ext(surf_game, (283 + SOULx) - 339, (142 + SOULy) - 189, 100, 56, (cx + percent10extra) - 100 - 640, cy + 78, 2, 2, 16777215, image_alpha);
            draw_surface_part_ext(surf_game, (283 + SOULx) - 339, (142 + SOULy) - 189, 100, 56, (cx + percent10extra) - 100 - 1280, cy + 78, 2, 2, 16777215, image_alpha);
        }
        
        draw_surface_part_ext(surf_game, 110, 136, 100, 56, cx + percent10extra + 150, cy + 222, 2, 2, 16777215, image_alpha);
        draw_surface_part_ext(surf_game, 90, 76, 100, 56, (cx + percent10extra + 150) - 640, cy + 222, 2, 2, 16777215, image_alpha);
        
        if ((flickermod % 2) == 0)
            draw_surface_part_ext(surf_game, 90, 76, 100, 56, (cx + percent10extra + 150) - 1280, cy + 222, 2, 2, 16777215, image_alpha);
        else
            draw_surface_part_ext(surf_game, 110, 136, 100, 56, (cx + percent10extra + 150) - 1280, cy + 222, 2, 2, 16777215, image_alpha);
        
        shader_set(sh_saturation);
        var saturation = 0;
        var u_sat = shader_get_uniform(sh_saturation, "u_saturation");
        shader_set_uniform_f(u_sat, saturation);
        draw_surface_part_ext(surf_game, 106, 216, 100, 66, (cx + percent10) - 210, cy + 316, 2, 2, 16777215, 1);
        draw_surface_part_ext(surf_game, 106, 216, 100, 66, (cx + percent10) - 210 - 640, cy + 316, 2, 2, 16777215, 1);
        shader_reset();
        gpu_set_colorwriteenable(1, 1, 1, 1);
    }
    
    surface_reset_target();
    draw_surface(surf2, 0, 0);
}
else if (room == rm_ch3_foaneend && surface_exists(surf2))
{
    surface_free(surf2);
    surface_free(surf_game);
    surf2 = -1;
}

if ((room == rm_ch3_sof || room == rm_ch3_sof_skip) && !(room == rm_ch3_foaneend))
{
    draw_sprite_ext(spr_foane_background_static_3, subimg3, (cx + percent10) - (640 * forward), y + yoffset, image_xscale, image_yscale, 0, c_white, (image_alpha / 6) + flicker + antialpha);
    draw_sprite_ext(spr_foane_background_static_3, subimg3, cx + percent10, y + yoffset, image_xscale, image_yscale, 0, c_white, (image_alpha / 6) + flicker + antialpha);
}
else if (!(antialpha == -2))
{
    draw_sprite_ext(spr_foane_background_static_3, subimg3, (cx + percent10) - (640 * forward), y + yoffset, image_xscale, image_yscale, 0, c_white, 0.8333333333333334 + flicker + (antialpha * 2));
    draw_sprite_ext(spr_foane_background_static_3, subimg3, cx + percent10, y + yoffset, image_xscale, image_yscale, 0, c_white, 0.8333333333333334 + flicker + (antialpha * 2));
}

draw_sprite_ext(spr_foane_background_final, 12, (cx + backpercent12) - (640 * back), y, image_xscale, image_yscale, 0, c_white, image_alpha * 1);
draw_sprite_ext(spr_foane_background_final, 12, cx + backpercent12, y, image_xscale, image_yscale, 0, c_white, image_alpha * 1);
draw_sprite_ext(spr_foane_background_final, 13, (cx + percent13) - (640 * forward), y, image_xscale, image_yscale, 0, c_white, image_alpha * 1);
draw_sprite_ext(spr_foane_background_final, 13, cx + percent13, y, image_xscale, image_yscale, 0, c_white, image_alpha * 1);
draw_sprite_ext(spr_foane_background_final, 14, (cx + backpercent14) - (640 * back), y, image_xscale, image_yscale, 0, c_white, image_alpha * 1);
draw_sprite_ext(spr_foane_background_final, 14, cx + backpercent14, y, image_xscale, image_yscale, 0, c_white, image_alpha * 1);

if (instance_exists(obj_battle_sof) && global.alldown)
{
}
else
{
    percent1 += (0.125 * multiplier * forward);
    backpercent2 += (0.25 * multiplier * back);
    percent3 += (0.375 * multiplier * forward);
    backpercent4 += (0.5 * multiplier * back);
    percent5 += (0.625 * multiplier * forward);
    backpercent6 += (0.75 * multiplier * back);
    percent7 += (1 * multiplier * forward);
    backpercent9 += (1 * multiplier * back);
    percent10 += (1.125 * multiplier * forward);
    percent10extra += (1.125 * multiplier * forward);
    backpercent12 += (1.25 * multiplier * back);
    percent13 += (1.375 * multiplier * forward);
    backpercent14 += (1.5 * multiplier * back);
}

if (percent1 <= 62 || percent1 >= 578)
    percent1 = 320;

if (backpercent2 <= -320 || backpercent2 >= 960)
    backpercent2 = 320;

if (percent3 <= -320 || percent3 >= 960)
    percent3 = 320;

if (backpercent4 <= -320 || backpercent4 >= 960)
    backpercent4 = 320;

if (percent5 <= -320 || percent5 >= 960)
    percent5 = 320;

if (backpercent6 <= -320 || backpercent6 >= 960)
    backpercent6 = 320;

if (percent7 <= -320 || percent7 >= 960)
    percent7 = 320;

if (backpercent9 <= -320 || backpercent9 >= 960)
    backpercent9 = 320;

if (percent10 <= -320 || percent10 >= 960)
{
    percent10 = 320;
    var _nearness = 10;
    var _closest_multiple = round(percent10extra / 320) * 320;
    
    if (percent10extra >= (_closest_multiple - _nearness) && percent10extra <= (_closest_multiple + _nearness))
        percent10extra = _closest_multiple;
}

if (percent10extra <= -960 || percent10extra >= 1600)
{
    if (instance_exists(obj_battle_sof) && global.alldown)
    {
    }
    else
    {
        percent10extra = 320;
        flicker = 0.5;
        flickermod += 1;
    }
}

if (backpercent12 <= -320 || backpercent12 >= 960)
    backpercent12 = 320;

if (percent13 <= -320 || percent13 >= 960)
    percent13 = 320;

if (backpercent14 <= -320 || backpercent14 >= 960)
    backpercent14 = 320;

if (instance_exists(obj_battle_sof))
    flicker -= 0.1;

flicker = clamp(flicker, 0, 1);
draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, 1/3);
draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, endalpha);
