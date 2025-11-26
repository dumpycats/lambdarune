var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
percent1 += (1/30);

if (percent1 == (1/30))
    audio_sound_gain(mus_greenroom, 0, 1000);

if (percent1 <= 1)
{
    var position1 = animcurve_channel_evaluate(curvelinear, percent1);
    var delta_x1 = (obj_kris_c3.x + 30) - sx;
    var delta_y1 = (obj_kris_c3.y + 30) - sy;
    obj_susie_c3.x = sx + (delta_x1 * position1);
    obj_susie_c3.y = sy + (delta_y1 * position1);
    var delta_x2 = obj_kris_c3.x - 30 - rx;
    var delta_y2 = (obj_kris_c3.y + 30) - ry;
    obj_ralsei_c3.x = rx + (delta_x2 * position1);
    obj_ralsei_c3.y = ry + (delta_y2 * position1);
    obj_susie_c3.depth = -obj_susie_c3.y + (obj_susie_c3.follow_order * 2);
    obj_ralsei_c3.depth = -obj_ralsei_c3.y + (obj_ralsei_c3.follow_order * 2);
    
    if (percent1 < 1)
    {
        if (obj_ralsei_c3.y >= obj_kris_c3.y)
            obj_ralsei_c3.sprite_index = sRalseiWalkUp;
        else if (obj_ralsei_c3.y <= obj_kris_c3.y)
            obj_ralsei_c3.sprite_index = sRalseiWalkDown;
        
        if (obj_susie_c3.y >= obj_kris_c3.y)
            obj_susie_c3.sprite_index = sSusieWalkUp;
        else if (obj_susie_c3.y <= obj_kris_c3.y)
            obj_susie_c3.sprite_index = sSusieWalkDown;
    }
    
    if (percent1 == 1)
    {
        audio_stop_sound(mus_greenroom);
        obj_susie_c3.image_speed = 0;
        obj_susie_c3.image_index = 0;
        obj_susie_c3.sprite_index = sSusieWalkUp;
        obj_ralsei_c3.image_speed = 0;
        obj_ralsei_c3.image_index = 0;
        obj_ralsei_c3.sprite_index = sRalseiWalkUp;
        talking = true;
        
        with (obj_susie_c3)
        {
            array_resize(delayed_positions, 0);
            array_resize(delayed_sprites, 0);
            
            for (var i = 0; i < delay_frames; i++)
            {
                array_push(delayed_positions, [x, y]);
                array_push(delayed_sprites, sprite_index);
            }
            
            first_movement_triggered = false;
        }
        
        with (obj_ralsei_c3)
        {
            array_resize(delayed_positions, 0);
            array_resize(delayed_sprites, 0);
            
            for (var i = 0; i < delay_frames; i++)
            {
                array_push(delayed_positions, [obj_susie_c3.x, obj_susie_c3.y]);
                array_push(delayed_sprites, sprite_index);
            }
            
            first_movement_triggered = false;
        }
    }
}
