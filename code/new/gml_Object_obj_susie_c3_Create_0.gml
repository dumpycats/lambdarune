var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
delayed_positions = [];
delayed_sprites = [];
delay_frames = 12;
interpolation_counter = 0;
first_movement_triggered = false;
target_position = [obj_kris_c3.x, obj_kris_c3.y];

for (var i = 0; i < delay_frames; i++)
{
    array_push(delayed_positions, [obj_kris_c3.x, obj_kris_c3.y]);
    array_push(delayed_sprites, obj_kris_c3.sprite_index);
}

curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
follow_order = 1;
image_xscale = 2;
image_yscale = 2;
timer = -1;
flashalpha = 0;
flashcolor = 16777215;
flashpercent = 0;
flashtrigger = false;

if (room == rm_ch3_foanepath)
    sprite_index = sSusieWalkUp;

if (room == rm_ch3_fountain)
{
    percent1 = 0;
    hue = 0;
}
