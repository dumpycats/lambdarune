var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (hitnoise)
{
    audio_play_sound(snd_metalhit_big, 1, false, 1.2 + noiseoffset, false, 0.8 + hitoffset);
    hitnoise = false;
}

if (rise)
{
    percentrise++;
    
    if (percentrise <= 70)
    {
        image_speed = 0.5;
        var positiona = animcurve_channel_evaluate(curveslower, percentrise / 70);
        y = lerp(655, 255, positiona);
    }
    
    switch (percentrise)
    {
        case 70:
            camera_set_view_pos(view_camera[0], 20, 26);
            audio_play_sound(snd_screenshake, 1, false);
            audio_stop_sound(snd_chain_extend);
            break;
        case 72:
            camera_set_view_pos(view_camera[0], 20, 14);
            break;
        case 74:
            camera_set_view_pos(view_camera[0], 20, 24);
            break;
        case 76:
            camera_set_view_pos(view_camera[0], 20, 16);
            break;
        case 78:
            camera_set_view_pos(view_camera[0], 20, 22);
            break;
        case 80:
            camera_set_view_pos(view_camera[0], 20, 18);
            break;
        case 82:
            camera_set_view_pos(view_camera[0], 20, 21);
            break;
        case 84:
            camera_set_view_pos(view_camera[0], 20, 19);
            break;
        case 86:
            camera_set_view_pos(view_camera[0], 20, 20);
            break;
        default:
            break;
    }
}

depth = -199;

if (aura)
{
    auratimer++;
    draw_sprite_ext(spr_maximike_dbz, subimg, x, y, image_xscale + (auratimer / 60), image_yscale + (auratimer / 90), 0, c_white, image_alpha - (auratimer / 45));
    
    switch (auratimer)
    {
        case 0:
            camera_set_view_pos(view_camera[0], 20, 30);
            break;
        case 2:
            camera_set_view_pos(view_camera[0], 20, 10);
            break;
        case 4:
            camera_set_view_pos(view_camera[0], 20, 26);
            break;
        case 6:
            camera_set_view_pos(view_camera[0], 20, 14);
            break;
        case 8:
            camera_set_view_pos(view_camera[0], 20, 23);
            break;
        case 10:
            camera_set_view_pos(view_camera[0], 20, 17);
            break;
        case 12:
            camera_set_view_pos(view_camera[0], 20, 21);
            break;
        case 14:
            camera_set_view_pos(view_camera[0], 20, 19);
            break;
        case 16:
            camera_set_view_pos(view_camera[0], 20, 20);
            image_speed = 1;
            break;
        default:
            break;
    }
}

draw_self();

if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    
    if (!obj_battle_sio.textact)
        x = xx + xoffset;
}

if (flicker)
{
    subimg2 += 0.16666666666666666;
    flickertimer++;
    draw_sprite_ext(spr_maximike_screen, subimg2, x, y, image_xscale, image_yscale, 0, c_white, 1);
    draw_sprite_ext(spr_maximike_screen, subimg2, x, y, image_xscale + (flickertimer / 40), image_yscale + (flickertimer / 65), 0, c_white, image_alpha - (flickertimer / 20));
    obj_maximike_foreground.image_index = 0;
}

if (off)
{
    draw_sprite_ext(spr_maximike_tennaeject, subimgoff, x, y, image_xscale * 2, image_yscale * 2, 0, c_white, 1);
    
    if (eject)
    {
        subimgoff += 0.5;
        subimgoff = clamp(subimgoff, 0, 14);
    }
    
    if (pandown)
    {
        percentpan++;
        var position = animcurve_channel_evaluate(curveease, percentpan / 66);
        y = lerp(255, 680, position);
    }
    
    var timerchange = -20;
    
    if (percentpan == 20)
    {
        audio_play_sound(snd_fall_cool_deep, 1, false);
        instance_create_depth(cx + 280, cy - 60, -150, obj_tenna_sio_aftermath);
    }
    
    if (percentpan == (66 + timerchange))
    {
        obj_maximike_background.reattach = true;
        audio_play_sound(snd_chain_extend, 1, true);
    }
    
    if (percentpan == (96 + timerchange))
    {
        camera_set_view_pos(view_camera[0], 16, 20);
        audio_stop_sound(snd_chain_extend);
        audio_play_sound(snd_screenshake, 1, false);
    }
    
    if (percentpan == (98 + timerchange))
        camera_set_view_pos(view_camera[0], 24, 20);
    
    if (percentpan == (100 + timerchange))
        camera_set_view_pos(view_camera[0], 18, 20);
    
    if (percentpan == (102 + timerchange))
        camera_set_view_pos(view_camera[0], 22, 20);
    
    if (percentpan == (104 + timerchange))
        camera_set_view_pos(view_camera[0], 19, 20);
    
    if (percentpan == (106 + timerchange))
        camera_set_view_pos(view_camera[0], 20, 20);
    
    if (percentpan == (114 + timerchange))
        audio_play_sound(snd_jump_bc, 1, false);
    
    if (percentpan == (130 + timerchange))
    {
        instance_create_depth(cx + 420, cy - 60, -150, obj_mike_sio_aftermath);
        instance_destroy();
    }
}

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x + 4, y, image_xscale, image_yscale, image_angle, flashcolorx, flashalphax);
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

if (shake)
{
    shaketimer++;
    
    switch (shaketimer)
    {
        case 0:
            x += 10;
            break;
        case 2:
            x -= 20;
            break;
        case 4:
            x += 16;
            break;
        case 6:
            x -= 12;
            break;
        case 8:
            x += 9;
            break;
        case 10:
            x -= 6;
            break;
        case 12:
            x += 4;
            break;
        case 14:
            x -= 2;
            break;
        case 16:
            x += 1;
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

if (instance_exists(obj_battle_sio))
{
    if (obj_battle_sio.krismercy || obj_battle_sio.susiemercy || obj_battle_sio.ralseimercy)
    {
        flashcolor = 65535;
        flashpercent += (1/30);
        
        if (flashpercent <= 0.5)
        {
            flashalpha += 0.016666666666666666;
        }
        else
        {
            flashalpha -= 0.016666666666666666;
            flashalpha = clamp(flashalpha, 0, 1);
        }
    }
    else
    {
        flashcolor = 16777215;
    }
}

if (reset)
{
    percentreset++;
    
    if (percentreset <= 60)
    {
        var position = animcurve_channel_evaluate(curveease, percentreset / 60);
        image_index = lerp(resetindex, 69, position);
    }
}

subimg += 0.5;
