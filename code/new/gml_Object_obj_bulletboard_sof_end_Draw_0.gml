var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var green = 49152;
var white = make_color_rgb(whitecolor1, whitecolor2, whitecolor3);
draw_sprite_ext(sBlackScreen, 0, cx + 320, cy + 240, 2, 2, 0, c_white, blackalpha);
blackalpha = clamp(blackalpha, 0, 1);

if (instance_exists(ENGINE))
{
    if (!global.alldown)
        timer++;
}

if (instance_exists(SOUL))
    SOUL.invulnerable = true;

if (timer >= 28 && timer <= 52)
{
    staticalpha1 += 0.05;
}
else
{
    if (timer == 53)
    {
        if (instance_exists(obj_foane_background_3))
            instance_destroy(obj_foane_background_3);
        
        obj_harmonize_blackscreen.image_alpha = 1;
    }
    
    if (timer < 78)
        staticalpha1 -= 0.2;
}

if (timer == 49)
{
    instance_create_depth(cx + -200, cy + 230, depth + 1, obj_foane);
    instance_create_depth(cx + 320, cy + 250, -20, obj_lines_c3);
    var up = instance_create_depth(cam_x + 690, cam_y + 420, -22, obj_phoneup);
    up.up = true;
}

if (timer <= 389)
{
    if (timer >= 74 && ((timer - 44) % 30) == 0 && !(((timer - 44) % 60) == 0))
    {
        var bigspike = instance_create_depth(cam_x + 680, SOUL.y, depth + 1, obj_bigspike_1);
        bigspike.left = true;
        bigspike.image_angle = 180;
        bigspike.echoing = true;
        bigspike.image_yscale = 0.8;
    }
    else if (timer >= 74 && ((timer - 44) % 60) == 0)
    {
        var bigspike1 = instance_create_depth(cam_x + -40, SOUL.y, depth + 1, obj_bigspike_1);
        bigspike1.left = false;
        bigspike1.image_angle = 0;
        bigspike1.echoing = true;
        bigspike1.image_yscale = 0.8;
    }
}

if (timer >= 389 && timer < 464)
{
    if (instance_exists(obj_symbols))
        obj_symbols.image_alpha -= 0.1;
    
    if (instance_exists(obj_bigspike_1))
        obj_bigspike_1.image_alpha -= 0.1;
    
    image_alpha += 0.02;
}

if (timer >= 464)
{
    if (instance_exists(obj_symbols))
        instance_destroy(obj_symbols);
    
    if (instance_exists(obj_bigspike_1))
        instance_destroy(obj_bigspike_1);
}

if (timer >= 57 && timer <= 449)
{
    percent1++;
    
    if (percent1 <= 390)
    {
        var position = animcurve_channel_evaluate(curvelinear, percent1 / 392);
        global.topoffset = lerp(0, 70, position);
        global.bottomoffset = lerp(0, 70, position);
    }
    
    SOULxx = SOUL.x;
}
else if (timer > 449)
{
    percent2++;
    
    if (percent2 <= 10)
    {
        var position = animcurve_channel_evaluate(curveslower, percent2 / 10);
        global.leftoffset = lerp(0, 170, position);
        global.rightoffset = lerp(0, 150, position);
        global.topoffset = lerp(70, -50, position);
        global.bottomoffset = lerp(70, 190, position);
        SOUL.moving = false;
        SOUL.stringoption = 1;
        SOUL.string0percent = 0;
        SOUL.string1percent = 0;
        SOUL.string2percent = 0;
        SOUL.x = lerp(SOULxx, cx + 480, position);
    }
}

if (percent2 > 10)
    global.topoffset = -50 + topdown;

if (timer == 460)
    SOUL.moving = true;

if (timer >= 393 && timer <= 443)
    staticalpha1 += 0.02;

if (timer == 412)
{
    if (instance_exists(obj_phoneup))
        instance_destroy(obj_phoneup);
}

if (timer >= 473)
{
    staticalpha1 -= 0.08333333333333333;
    staticsprite = spr_staticsmile;
}

staticalpha1 = clamp(staticalpha1, 0, 1);

if (timer == 475)
{
    var up = instance_create_depth(SOUL.stringx1, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up.up = true;
    var up2 = instance_create_depth(SOUL.stringx3, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up2.up = true;
    var down = instance_create_depth(SOUL.stringx2, cy + -40, SOUL.depth - 1, obj_spike_c3);
    down.pull = 2;
}

if (timer == 520)
{
    var down = instance_create_depth(SOUL.stringx1, cy + -40, SOUL.depth - 1, obj_spike_c3);
    down.up = false;
    down.pull = 2;
    var down2 = instance_create_depth(SOUL.stringx3, cy + -40, SOUL.depth - 1, obj_spike_c3);
    down2.up = false;
    down2.pull = 2;
    var up = instance_create_depth(SOUL.stringx2, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up.up = true;
}

if (timer == 570)
{
    var up = instance_create_depth(SOUL.stringx1, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up.up = true;
    var up2 = instance_create_depth(SOUL.stringx3, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up2.up = true;
    var down = instance_create_depth(SOUL.stringx2, cy + -40, SOUL.depth - 1, obj_spike_c3);
    down.pull = 2;
}

if (timer == 620)
{
    var down = instance_create_depth(SOUL.stringx1, cy + -40, SOUL.depth - 1, obj_spike_c3);
    down.up = false;
    down.pull = 2;
    var down2 = instance_create_depth(SOUL.stringx3, cy + -40, SOUL.depth - 1, obj_spike_c3);
    down2.up = false;
    down2.pull = 2;
    var up = instance_create_depth(SOUL.stringx2, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up.up = true;
    up.pull = 2;
}

if (timer >= 670 && ((timer - 670) % 12) == 0 && timer <= 850)
{
    var downa = instance_create_depth(SOUL.stringx1, cy + -40, SOUL.depth - 1, obj_spike_c3);
    downa.up = false;
    downa.pull = 2;
    var downa2 = instance_create_depth(SOUL.stringx3, cy + -40, SOUL.depth - 1, obj_spike_c3);
    downa2.up = false;
    downa2.pull = 2;
    var downa3 = instance_create_depth(SOUL.stringx2, cy + -40, SOUL.depth - 1, obj_spike_c3);
    downa3.up = false;
    downa3.pull = 2;
}

if (timer >= 680 && ((timer - 680) % 12) == 0 && timer <= 840)
{
    var upa = instance_create_depth(SOUL.stringx1, cy + 520, SOUL.depth - 1, obj_spike_c3);
    upa.up = true;
    upa.pull = 2;
    var upa2 = instance_create_depth(SOUL.stringx3, cy + 520, SOUL.depth - 1, obj_spike_c3);
    upa2.up = true;
    upa2.pull = 2;
    var upa3 = instance_create_depth(SOUL.stringx2, cy + 520, SOUL.depth - 1, obj_spike_c3);
    upa3.up = true;
    upa3.pull = 2;
}

if (timer == 500)
{
    var up = instance_create_depth(SOUL.stringx1, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up.up = true;
    up.sprite_index = spr_signalburst;
    up.echoing = false;
}

if (timer == 515)
{
    var upa = instance_create_depth(SOUL.stringx1, cy + 520, SOUL.depth - 1, obj_spike_c3);
    upa.up = true;
    upa.pull = 2;
    var upa2 = instance_create_depth(SOUL.stringx3, cy + 520, SOUL.depth - 1, obj_spike_c3);
    upa2.up = true;
    upa2.pull = 2;
    var upa3 = instance_create_depth(SOUL.stringx2, cy + 520, SOUL.depth - 1, obj_spike_c3);
    upa3.up = true;
    upa3.pull = 2;
}

if (timer == 530)
{
    var down = instance_create_depth(SOUL.stringx3, cy + -40, SOUL.depth - 1, obj_spike_c3);
    down.up = false;
    down.sprite_index = spr_signalburst;
    down.echoing = false;
}

if (timer == 545)
{
    var downa = instance_create_depth(SOUL.stringx1, cy + -40, SOUL.depth - 1, obj_spike_c3);
    downa.up = false;
    downa.pull = 2;
    var downa2 = instance_create_depth(SOUL.stringx3, cy + -40, SOUL.depth - 1, obj_spike_c3);
    downa2.up = false;
    downa2.pull = 2;
    var downa3 = instance_create_depth(SOUL.stringx2, cy + -40, SOUL.depth - 1, obj_spike_c3);
    downa3.up = false;
    downa3.pull = 2;
}

if (timer == 560)
{
    var up = instance_create_depth(SOUL.stringx1, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up.up = true;
    up.sprite_index = spr_signalburst;
    up.echoing = false;
}

if (timer == 590)
{
    var down = instance_create_depth(SOUL.stringx3, cy + -40, SOUL.depth - 1, obj_spike_c3);
    down.up = false;
    down.sprite_index = spr_signalburst;
    down.echoing = false;
}

if (timer == 620)
{
    var up = instance_create_depth(SOUL.stringx1, cy + 520, SOUL.depth - 1, obj_spike_c3);
    up.up = true;
    up.sprite_index = spr_signalburst;
    up.echoing = false;
}

if (spawn)
{
    if (timer == 17)
    {
        alpha = 0;
        image_speed = 0;
    }
    
    switch (turn)
    {
        case 0:
            if (instance_exists(SOUL))
            {
                SOUL.twostringspace = 0;
                SOUL.purple = true;
                SOUL.ystrings = true;
            }
            
            break;
    }
}

draw_sprite_ext(sprite_index, image_index, x, y + global.topoffset, 1, 1, 0, c_white, alpha);

if (timer >= 17 && spawn)
{
    draw_set_alpha(1);
    
    if (timer >= 357)
        draw_sprite_ext(spr_specialtransition, specialsubimg30, x, y + global.bottomoffset, 1, 1, 0, c_white, 1);
    
    if (timer >= 357 && timer <= 412)
    {
        specialsubimg30++;
        specialsubimg30 = clamp(specialsubimg30, -1, 51);
    }
    
    draw_sprite_ext(staticsprite, subimg20fps, cx + 0, cy + 0, 4, 4, 0, c_white, staticalpha1);
    draw_rectangle_color(cam_x + 249 + global.leftoffset, cam_y + 99 + global.topoffset, cam_x + 390 + global.rightoffset, cam_y + 240 + global.bottomoffset, c_black, c_black, c_black, c_black, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 98 + global.topoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 248 + global.leftoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 241 + global.bottomoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 391 + global.rightoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    
    if (timer >= 357)
    {
        whitealpha -= (1/30);
        draw_set_alpha(whitealpha);
        draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 98 + global.topoffset, c_white, c_white, c_white, c_white, 0);
        draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 248 + global.leftoffset, cam_y + 244 + global.bottomoffset, c_white, c_white, c_white, c_white, 0);
        draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 241 + global.bottomoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, c_white, c_white, c_white, c_white, 0);
        draw_rectangle_color(cam_x + 391 + global.rightoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, c_white, c_white, c_white, c_white, 0);
    }
    
    draw_set_alpha(1);
}
else
{
    alpha = 1;
    image_speed = 1;
}

subimg30fps++;
subimg20fps += (2/3);

if (instance_exists(ENGINE))
{
    if (global.alldown)
    {
        image_speed = 0;
        exit;
    }
}
