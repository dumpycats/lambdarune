var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
delayed_positions = [];
delayed_sprites = [];
delay_frames = 12;
interpolation_counter = 0;
first_movement_triggered = false;
target_position = [oKrisPlayerC3.x, oKrisPlayerC3.y];

for (var i = 0; i < delay_frames; i++)
{
    array_push(delayed_positions, [oKrisPlayerC3.x, oKrisPlayerC3.y]);
    array_push(delayed_sprites, oKrisPlayerC3.sprite_index);
}

image_xscale = 2;
image_yscale = 2;

if (room == rChapter3Room1)
{
    sprite_index = sSusieGetUp;
    dialogue2timer = 0;
    dialogue12timer = 0;
    geartimer = 0;
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
    curve6 = animcurve_get_channel(Linear, "acLinear");
    percent6 = 0;
}

if (room == rChapter3Room5)
{
    sprite_index = sSusieWalkRight;
    image_speed = 0;
    timer = 0;
    clicktimer = 0;
    xclicktimer = 0;
    dialogue3timer = 0;
    dialogue6timer = 0;
    curve1 = animcurve_get_channel(LinearXX, "acVibrate");
    percent1 = 0;
}

if (room == rChapter3Room2)
{
    timer = 0;
    sprite_index = sSusieWalkDown;
    image_speed = 0;
    dialogue8timer = 0;
    d15timer = 0;
    xx = 0;
    yy = 0;
    d31timer = 0;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
    curve2 = animcurve_get_channel(Linear, "acLinear");
    percent2 = 0;
}
