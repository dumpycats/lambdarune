var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
delayed_positions = [];
delayed_sprites = [];
delay_frames = 12;

for (var i = 0; i < delay_frames; i++)
{
    array_push(delayed_positions, [oKrisPlayerC3.x, oKrisPlayerC3.y]);
    array_push(delayed_sprites, oKrisPlayerC3.sprite_index);
}

image_xscale = 2;
image_yscale = 2;
dialogue2timer = 0;
dialogue12timer = 0;
curve1 = animcurve_get_channel(LinearXX, "acVibrate");
percent1 = 0;
curve2 = animcurve_get_channel(LinearXX, "acVibrate");
percent2 = 0;
curve3 = animcurve_get_channel(LinearXX, "acVibrate");
percent3 = 0;
curve4 = animcurve_get_channel(Linear, "acLinear");
percent4 = 0;
curve5 = animcurve_get_channel(Linear, "acLinear");
percent5 = 0;
