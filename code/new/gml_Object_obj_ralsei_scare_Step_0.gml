x = xx + xoffset;

if (scare)
{
    scaretimer++;
    hittimer++;
}

switch (hittimer)
{
    case 0:
        camera_set_view_pos(view_camera[0], 4, 4);
        break;
    case 1:
        camera_set_view_pos(view_camera[0], -4, -4);
        break;
    case 2:
        camera_set_view_pos(view_camera[0], 3, 3);
        break;
    case 3:
        camera_set_view_pos(view_camera[0], -2, -2);
        break;
    case 4:
        camera_set_view_pos(view_camera[0], 0, 0);
        break;
    case 8:
        camera_set_view_pos(view_camera[0], 20, 0);
        break;
    case 10:
        camera_set_view_pos(view_camera[0], -20, 0);
        break;
    case 12:
        camera_set_view_pos(view_camera[0], 10, 0);
        break;
    case 14:
        camera_set_view_pos(view_camera[0], -10, 0);
        break;
    case 16:
        camera_set_view_pos(view_camera[0], 0, 0);
        break;
}

switch (scaretimer)
{
    case 0:
        sprite_index = spr_ralsei_shock;
        image_xscale = -2;
        xoffset = 4;
        break;
    case 1:
        xoffset = -4;
        break;
    case 2:
        xoffset = 3;
        break;
    case 3:
        xoffset = -3;
        break;
    case 4:
        xoffset = 2;
        break;
    case 5:
        xoffset = -2;
        break;
    case 6:
        xoffset = 1;
        break;
    case 7:
        xoffset = -1;
        break;
    case 8:
        xoffset = 0;
        obj_kris_scare.speed = 0;
        obj_kris_scare.sprite_index = spr_kris_scare_slam;
        obj_kris_scare.x -= 24;
        audio_play_sound(snd_closet_impact, 1, false);
        break;
}
