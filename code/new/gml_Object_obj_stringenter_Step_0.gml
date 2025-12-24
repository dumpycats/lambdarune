percent1++;

switch (percent1)
{
    case 0:
        x = 640;
        break;
    case 1:
        x = 640;
        break;
    case 2:
        x = 639;
        break;
    case 3:
        x = 637;
        break;
    case 4:
        x = 635;
        break;
    case 5:
        x = 633;
        break;
    case 6:
        x = 629;
        break;
    case 7:
        x = 625;
        break;
    case 8:
        x = 620;
        break;
    case 9:
        x = 614;
        break;
    case 10:
        x = 607;
        break;
    case 11:
        x = 600;
        break;
    case 12:
        x = 591;
        break;
    case 13:
        x = 581;
        break;
    case 14:
        x = 569;
        break;
    case 15:
        x = 556;
        break;
    case 16:
        x = 542;
        break;
    case 17:
        x = 525;
        break;
    case 18:
        x = 506;
        break;
    case 19:
        x = 485;
        break;
    case 20:
        x = 461;
        break;
    case 21:
        x = 434;
        break;
    case 22:
        x = 402;
        break;
    case 23:
        x = 365;
        break;
    case 24:
        x = 320;
        obj_SOUL_sof_prebattle.shake = true;
        audio_play_sound(snd_soulstab, 1, false, 1.8);
        window_set_caption(lang("obj_stringenter_Step_0_0"));
        break;
    case 25:
        x = 265;
        break;
    case 26:
        x = 192;
        break;
    case 27:
        x = 88;
        break;
    case 28:
        x = -20;
        break;
    case 48:
        instance_create_depth(660, 239, 80, obj_cablecutscene_1);
        instance_create_depth(-20, 239, 80, obj_cablecutscene_2);
        break;
}

if (instance_exists(obj_ignorewarning_c3) && obj_ignorewarning_c3.timer > 80)
{
    color += 5;
}
else if (instance_exists(obj_redpurple_flare))
{
    if (obj_redpurple_flare.image_index == 1)
        color -= 10;
}

color = clamp(color, 200, 255);
image_blend = make_color_rgb(color, color, color);
