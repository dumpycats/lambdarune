draw_sprite_ext(spr_kris_fall, subimg, x - 2, y + 10, 2, 2, 0, make_color_rgb(blendvalue, blendvalue, blendvalue), krisalpha);
timer++;

if ((timer % 2) == 0)
    var a = instance_create_depth(x, y, depth + 5, obj_sof_krisfall_echo);

droppercent++;

if (droppercent <= 45)
{
    var position = animcurve_channel_evaluate(curveslower, droppercent / 45);
    y = lerp(100, 240, position);
}

if (shake)
{
    shaketimer++;
    hurtingtimer--;
    draw_sprite_ext(spr_soul_stabfade, 0, x, y, 1 + (shaketimer / 50), 1 + (shaketimer / 50), 0, c_white, hurtingtimer / 50);
    draw_sprite_ext(sSOUL, 0, x, y, 1 + (shaketimer / 15), 1 + (shaketimer / 15), 0, c_white, hurtingtimer / 30);
    
    switch (shaketimer)
    {
        case 0:
            camera_set_view_pos(view_camera[0], -10, 0);
            break;
        case 2:
            camera_set_view_pos(view_camera[0], 10, 0);
            break;
        case 4:
            camera_set_view_pos(view_camera[0], -6, 0);
            break;
        case 6:
            camera_set_view_pos(view_camera[0], 6, 0);
            break;
        case 8:
            camera_set_view_pos(view_camera[0], -4, 0);
            break;
        case 10:
            camera_set_view_pos(view_camera[0], 4, 0);
            break;
        case 12:
            camera_set_view_pos(view_camera[0], -2, 0);
            break;
        case 14:
            camera_set_view_pos(view_camera[0], 2, 0);
            break;
        case 16:
            camera_set_view_pos(view_camera[0], -1, 0);
            break;
        case 18:
            camera_set_view_pos(view_camera[0], 1, 0);
            break;
        case 20:
            camera_set_view_pos(view_camera[0], 0, 0);
            break;
    }
}

subimg += (1/3);

if (hurt)
{
    hurttimer++;
    image_speed = 1;
    
    if (hurttimer == 0)
        audio_play_sound(snd_hurt1, 1, false);
    
    if (hurttimer == 40)
    {
        hurt = false;
        hurttimer = -1;
        image_speed = 0;
        image_index = 0;
    }
}
