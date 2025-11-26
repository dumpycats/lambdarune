var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
delayed_positions = [];
delayed_sprites = [];
delay_frames = 12;
interpolation_counter = 0;
first_movement_triggered = false;
target_position = [oSusieC3.x, oSusieC3.y];

for (var i = 0; i < delay_frames; i++)
{
    array_push(delayed_positions, [oSusieC3.x, oSusieC3.y]);
    array_push(delayed_sprites, oSusieC3.sprite_index);
}

image_xscale = 2;
image_yscale = 2;

if (room == rChapter3Room6)
{
    sprite_index = sRalseiWalkDown;
    image_speed = 0;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
    curve2 = animcurve_get_channel(Linear, "acLinear");
    percent2 = 0;
}

if (room == rChapter3KreidRoom)
{
    depth = 0;
    sprite_index = spr_ralseiroll;
    x = 60;
    y = -40;
    image_speed = 1;
    falltimer = 0;
    curvefall = animcurve_get_channel(Bezier, "acSlowToFast");
    percentfall = 0;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
    curve3 = animcurve_get_channel(LinearXX, "acVibrate");
    percent3 = 0;
    timer1 = 0;
}

if (room == rChapter3Room5)
{
    sprite_index = sRalseiWalkRight;
    image_speed = 2;
    dialogue20timer = 0;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
    curve2 = animcurve_get_channel(Linear, "acLinear");
    percent2 = 0;
}

if (room == rChapter3Room7)
{
    image_index = 1;
    timer = 0;
    curve1 = animcurve_get_channel(Linear, "acLinear");
    percent1 = 0;
    curve2 = animcurve_get_channel(Linear, "acLinear");
    percent2 = 0;
    curve3 = animcurve_get_channel(Linear, "acLinear");
    percent3 = 0;
    curve4 = animcurve_get_channel(Linear, "acLinear");
    percent4 = 0;
    curve5 = animcurve_get_channel(Linear, "acLinear");
    percent5 = 0;
}
