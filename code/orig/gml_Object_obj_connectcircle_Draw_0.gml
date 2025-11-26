draw_sprite_ext(sprite_index, image_index, x + 2, y, scale, scale, 0, c_black, 1);
draw_sprite_ext(sprite_index, image_index, x - 2, y, scale, scale, 0, c_black, 1);
draw_sprite_ext(sprite_index, image_index, x, y - 2, scale, scale, 0, c_black, 1);
draw_sprite_ext(sprite_index, image_index, x, y + 2, scale, scale, 0, c_black, 1);
draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, 0, image_blend, 1);

if (!paused)
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
            percent1++;
        }
    }
    
    if (percent1 <= 30)
    {
        var position = animcurve_channel_evaluate(curveease, percent1 / 30);
        scale = lerp(0.125, 1, position);
    }
    else
    {
        if (instance_exists(obj_battle_sof))
        {
            if (global.alldown)
            {
                image_speed = 0;
                speed = 0;
                exit;
            }
            else
            {
                percent2++;
            }
        }
        
        var position2 = animcurve_channel_evaluate(curveease, percent2 / 30);
        scale = lerp(1, 0.125, position2);
    }
}
