var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
x = cx + 390 + xoffset;
draw_self();
hittimer++;

switch (hittimer)
{
    case 0:
        if (global.generator2hp > 0)
        {
            image_index = 1;
        }
        else
        {
            image_index = 2;
            audio_play_sound(snd_metalhit_bc, 1, false);
            audio_play_sound(snd_explosion_mmx3, 1, false, 1.4);
        }
        
        audio_play_sound(snd_bomb, 1, false);
        xoffset = 6;
        break;
    case 1:
        xoffset = -6;
        break;
    case 2:
        xoffset = 3;
        
        if (global.generator2hp > 0)
            image_index = 0;
        else
            image_index = 2;
        
        break;
    case 3:
        xoffset = -3;
        break;
    case 4:
        xoffset = 1;
        break;
    case 5:
        xoffset = -1;
        break;
    case 6:
        xoffset = 0;
        break;
    default:
        xoffset = 0;
        break;
}

if (fade)
{
    image_alpha -= 0.1;
    
    if (image_alpha < 0)
        instance_destroy();
}
