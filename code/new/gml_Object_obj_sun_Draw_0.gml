var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (instance_exists(obj_battle_sio))
{
    if (!global.alldown)
        timer++;
}

scale = 1 + (sin((timer / 100) * (2 * pi)) / 4);
draw_sprite_ext(sprite_index, image_index, x, y + yoffset, scale, scale, 0, c_white, 0.5);
y = yy + yoffset;
draw_self();

if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
        exit;
    }
}

hittimer++;

switch (hittimer)
{
    case 0:
        audio_play_sound(snd_noise, 1, false);
        
        if (instance_exists(obj_sunray))
            obj_sunray.switchsprite++;
        
        yoffset = 3;
        flashalpha = 1;
        break;
    case 1:
        yoffset = -3;
        flashalpha = 0.8;
        break;
    case 2:
        yoffset = 2;
        flashalpha = 0.6;
        break;
    case 3:
        yoffset = -2;
        flashalpha = 0.4;
        break;
    case 4:
        yoffset = 1;
        flashalpha = 0.2;
        break;
    case 5:
        yoffset = -1;
        flashalpha = 0;
        break;
    case 6:
        yoffset = 0;
        flashalpha = 0;
        break;
    default:
        yoffset = 0;
        flashalpha = 0;
        break;
}

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if ((timer % 30) == 0 && !((timer % 60) == 0))
{
    if (altered)
    {
        var a = instance_create_depth(x, y, depth + 1, obj_sunray);
        a.reversed = true;
        a.image_angle = 180;
    }
    else
    {
        var a = instance_create_depth(x, y, depth + 1, obj_sunray);
    }
}
else if ((timer % 60) == 0)
{
    if (altered)
    {
        var b = instance_create_depth(x, y, depth + 1, obj_sunray);
        b.triggernumber = 1;
        b.reversed = true;
        b.image_angle = 180;
    }
    else
    {
        var b = instance_create_depth(x, y, depth + 1, obj_sunray);
        b.triggernumber = 1;
    }
}
