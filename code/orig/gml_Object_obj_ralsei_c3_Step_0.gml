var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (global.playermove)
{
    var player_is_moving = obj_kris_c3.xspd != 0 || obj_kris_c3.yspd != 0;
    
    if (player_is_moving)
    {
        if (!first_movement_triggered)
        {
            first_movement_triggered = true;
            target_position = [obj_susie_c3.x, obj_susie_c3.y];
            interpolation_counter = delay_frames;
        }
        
        array_push(delayed_positions, [obj_susie_c3.x, obj_susie_c3.y]);
        array_push(delayed_sprites, obj_susie_c3.sprite_index);
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
            case sSusieWalkLeft:
                sprite_index = sRalseiWalkLeft;
                break;
            case sSusieWalkRight:
                sprite_index = sRalseiWalkRight;
                break;
            case sSusieWalkUp:
                sprite_index = sRalseiWalkUp;
                break;
            case sSusieWalkDown:
                sprite_index = sRalseiWalkDown;
                break;
            default:
                break;
        }
        
        image_speed = obj_susie_c3.image_speed;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
    
    depth = -y + (follow_order * 2);
}
