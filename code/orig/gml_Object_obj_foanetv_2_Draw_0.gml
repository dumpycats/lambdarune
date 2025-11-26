image_blend = make_color_hsv(obj_fountainfloor_c3.hue, 255, 255);
subimg++;

if (timer <= 10)
    alpha = image_alpha;

draw_sprite_ext(spr_foanetv_lblack, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(talksprite, subimg, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_foanetv_lstatic, subimg, x, y, image_xscale, image_yscale, 0, c_white, alpha);

if (outropercent >= 1)
    draw_sprite_ext(spr_foanetv_lwhite, outrosubimg, x, y, image_xscale, image_yscale, 0, c_white, 1);

draw_self();
timer++;

switch (timer)
{
    case 59:
        talksprite = spr_foanetv_foane;
        break;
    case 60:
        alpha = 0.25;
        break;
    case 63:
        alpha = 0.75;
        break;
    case 67:
        alpha = 0.5;
        break;
    case 71:
        alpha = 0.25;
        break;
    case 100:
        talking = true;
        break;
    default:
        break;
}

if (d2trigger)
{
    d2timer++;
    
    switch (d2timer)
    {
        case 0:
            alpha = 0.5;
            break;
        case 1:
            alpha = 0.75;
            break;
        case 2:
            alpha = 1;
            talksprite = spr_foanetv_feighline;
            break;
        case 8:
            alpha = 0.75;
            break;
        case 9:
            alpha = 0.5;
            break;
        case 10:
            alpha = 0.25;
            talking = true;
            dialogue = 3;
            reset_dialogue_normal();
            break;
        default:
            break;
    }
}

if (d4trigger)
{
    d4timer++;
    
    switch (d4timer)
    {
        case 0:
            alpha = 0.5;
            break;
        case 1:
            alpha = 0.75;
            break;
        case 2:
            alpha = 1;
            talksprite = spr_foanetv_foane;
            break;
        case 8:
            alpha = 0.75;
            break;
        case 9:
            alpha = 0.5;
            break;
        case 10:
            alpha = 0.25;
            talking = true;
            dialogue = 5;
            reset_dialogue_normal();
            break;
        default:
            break;
    }
}

if (d12trigger)
{
    d12timer++;
    
    switch (d12timer)
    {
        case 0:
            alpha = 0.5;
            break;
        case 1:
            alpha = 0.75;
            break;
        case 2:
            alpha = 1;
            talksprite = spr_foanetv_feighline;
            break;
        case 8:
            alpha = 0.75;
            break;
        case 9:
            alpha = 0.5;
            break;
        case 10:
            alpha = 0.25;
            talking = true;
            dialogue = 13;
            reset_dialogue_normal();
            break;
        default:
            break;
    }
}

if (outro)
{
    outropercent += (1/30);
    var position1 = animcurve_channel_evaluate(curveease, outropercent);
    
    if (outrosubimg < 4)
        alpha = lerp(0.25, 1, position1);
    
    if (outropercent == (1/15))
        audio_sound_gain(mus_f_noise, 0.5, 500);
    
    if (outropercent >= 1)
    {
        talksprite = spr_empty;
        outrosubimg++;
        outrosubimg = clamp(outrosubimg, 0, 11);
    }
    
    if (outrosubimg == 4)
        alpha = 0;
    
    if (outrosubimg == 5)
    {
        audio_play_sound(snd_bell_bc, 1, false);
        audio_stop_sound(mus_f_noise);
    }
    
    if (outropercent == 1.4)
    {
        moveout = true;
        audio_play_sound(snd_spearrise, 1, false);
    }
}

if (moveout)
{
    movepercent += 0.1;
    var position2 = animcurve_channel_evaluate(curveslower, movepercent);
    y = lerp(165, -60, position2);
    
    if (movepercent == 3)
    {
        camera_set_view_size(view_camera[0], 640, 480);
        camera_set_view_pos(view_camera[0], 0, 0);
        obj_foanetv_1.x += 640;
    }
    
    if (movepercent >= 7)
    {
        obj_foanetv_1.blackalpha -= 1/30;
        obj_kris_c3.y = obj_susie_c3.y;
        obj_susie_c3.sprite_index = sSusieWalkUp;
        obj_susie_c3.image_index = 0;
    }
    
    if (movepercent == 11)
        instance_create_depth(320, 240, -120, obj_falsefountainend_text);
}
