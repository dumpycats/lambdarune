draw_sprite_ext(sBlackScreen, 0, x, y, 3, 3, 0, c_white, backgroundalpha);

if (instance_exists(obj_battle_sof) && global.finaltalk && !global.enemyturn)
{
    backgroundalpha += (1/30);
    backgroundalpha = clamp(backgroundalpha, 0, 0.5);
}
else
{
    backgroundalpha -= 0.1;
    backgroundalpha = clamp(backgroundalpha, 0, 0.5);
}

x = xx + xoffset;

if (trigger)
{
    if (instance_exists(obj_battle_sof))
    {
        if (global.alldown)
        {
            image_speed = 0;
            speed = 0;
        }
        else
        {
            floattimer += (1 * floatmultiplier);
            y = yy + (sin((floattimer / 100) * (2 * pi)) * 10);
        }
    }
    else
    {
        floattimer += (1 * floatmultiplier);
        y = yy + (sin((floattimer / 100) * (2 * pi)) * 10);
    }
}
else
{
    yy = y;
}

if (!(sprite_index == spr_foane_ex_idle) && instance_exists(obj_battle_sof))
{
    subimg += ((1/3) * image_speed);
    draw_sprite_ext(spr_foane_ex_cape, image_index_save + subimg, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    if (sprite_index == spr_foane_ex_hit)
        draw_sprite_ext(spr_foane_ex_sonic_effect_hit, image_index_save + subimg, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    else
        draw_sprite_ext(spr_foane_ex_sonic_effect, image_index_save + subimg, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    image_index_save = image_index;
    subimg = 0;
}

draw_self();

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (hit)
{
    hittimer++;
    
    switch (hittimer)
    {
        case 0:
            xoffset = 9;
            break;
        case 2:
            xoffset = -8;
            break;
        case 4:
            xoffset = 7;
            break;
        case 6:
            xoffset = -6;
            break;
        case 8:
            xoffset = 5;
            break;
        case 10:
            xoffset = -4;
            break;
        case 12:
            xoffset = 3;
            break;
        case 14:
            xoffset = -2;
            break;
        case 16:
            xoffset = 1;
            break;
        case 18:
            xoffset = 0;
            break;
    }
}

if (smallshake)
{
    smallshaketimer++;
    
    switch (smallshaketimer)
    {
        case 0:
            xoffset = 4;
            break;
        case 2:
            xoffset = -4;
            break;
        case 4:
            xoffset = 3;
            break;
        case 6:
            xoffset = -3;
            break;
        case 8:
            xoffset = 2;
            break;
        case 10:
            xoffset = -2;
            break;
        case 12:
            xoffset = 1;
            break;
        case 14:
            xoffset = -1;
            break;
        case 16:
            xoffset = 0;
            break;
        case 18:
            xoffset = 0;
            break;
    }
}

if (shake)
{
    shaketimer++;
    
    switch (shaketimer)
    {
        case 0:
            xoffset += 10;
            break;
        case 2:
            xoffset -= 20;
            break;
        case 4:
            xoffset += 16;
            break;
        case 6:
            xoffset -= 12;
            break;
        case 8:
            xoffset += 9;
            break;
        case 10:
            xoffset -= 6;
            break;
        case 12:
            xoffset += 4;
            break;
        case 14:
            xoffset -= 2;
            break;
        case 16:
            xoffset += 1;
            shake = false;
            shaketimer = -1;
            break;
    }
}

if (flash)
{
    flashtimer++;
    
    if (flashtimer == 0)
        flashalpha = 1;
    
    if (flashtimer > 0)
    {
        flashalpha -= (1/15);
        flashalpha = clamp(flashalpha, 0, 1);
    }
    
    if (flashtimer == 16)
    {
        flash = false;
        flashtimer = -1;
    }
}
