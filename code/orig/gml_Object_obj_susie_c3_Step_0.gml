var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (global.playermove)
{
    var player_is_moving = obj_kris_c3.xspd != 0 || obj_kris_c3.yspd != 0;
    
    if (player_is_moving)
    {
        if (!first_movement_triggered)
        {
            first_movement_triggered = true;
            target_position = [obj_kris_c3.x, obj_kris_c3.y];
            interpolation_counter = delay_frames;
            array_resize(delayed_positions, 0);
            array_resize(delayed_sprites, 0);
            
            for (var i = 0; i < delay_frames; i++)
            {
                array_push(delayed_positions, [obj_kris_c3.x, obj_kris_c3.y]);
                array_push(delayed_sprites, obj_kris_c3.sprite_index);
            }
        }
        
        array_push(delayed_positions, [obj_kris_c3.x, obj_kris_c3.y]);
        array_push(delayed_sprites, obj_kris_c3.sprite_index);
        var delayed_pos = array_shift(delayed_positions);
        var delayed_sprite = array_shift(delayed_sprites);
        
        if (interpolation_counter > 0)
        {
            x = lerp(x, delayed_pos[0], 1 / interpolation_counter);
            y = lerp(y, delayed_pos[1], 1 / interpolation_counter);
            interpolation_counter -= 1;
        }
        else
        {
            x = delayed_pos[0];
            y = delayed_pos[1];
        }
        
        switch (delayed_sprite)
        {
            case sKrisWalkLeft:
                sprite_index = sSusieWalkLeft;
                break;
            case sKrisWalkRight:
                sprite_index = sSusieWalkRight;
                break;
            case sKrisWalkUp:
                sprite_index = sSusieWalkUp;
                break;
            case sKrisWalkDown:
                sprite_index = sSusieWalkDown;
                break;
            default:
                break;
        }
        
        image_speed = obj_kris_c3.image_speed;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
}
else
{
    first_movement_triggered = false;
}

depth = -y + (follow_order * 2);

if (room == rm_ch3_fountain)
{
    hue += 0.25;
    hue %= 255;
    
    if (hue >= 255)
        hue = 0;
    
    flashcolor = make_color_hsv(hue, 255, 255);
    percent1 += 0.004629629629629629;
    
    if (percent1 < 1)
    {
        sprite_index = sSusieWalkUp;
        image_speed = 0.5;
        var position1 = animcurve_channel_evaluate(curvelinear, percent1);
        var delta_y = (cy + 370) - (cy + 586);
        y = cy + 586 + (delta_y * position1);
    }
    else if (percent1 == 1)
    {
        y = cy + 370;
        image_index = 0;
        image_speed = 0;
    }
    
    if (percent1 == 1.2777777777777777)
        instance_create_depth(cx + 320, cy + 240, -60, obj_falsefountain_text);
}
