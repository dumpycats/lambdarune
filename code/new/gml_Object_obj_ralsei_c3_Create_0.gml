var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
delayed_positions = [];
delayed_sprites = [];
delay_frames = 12;
interpolation_counter = 0;
first_movement_triggered = false;
target_position = [obj_susie_c3.x, obj_susie_c3.y];

for (var i = 0; i < delay_frames; i++)
{
    array_push(delayed_positions, [obj_susie_c3.x, obj_susie_c3.y]);
    array_push(delayed_sprites, obj_susie_c3.sprite_index);
}

image_xscale = 2;
image_yscale = 2;
follow_order = 2;

if (room == rm_ch3_foanepath)
    sprite_index = sRalseiWalkUp;
