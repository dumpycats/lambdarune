generaltimer++;

if ((generaltimer % 24) == 0)
{
    randomize();
    var randomx = irandom_range(10, 630);
    instance_create_depth(randomx, -16, depth + 1, obj_primflower_leaves);
}

draw_self();

if (obj_primflowershop.selectedbuy)
{
    image_speed = 0;
    image_index = 0;
}
else if (!obj_primflower.text_complete && !(obj_primflower.dialogue == 60))
{
    image_speed = 1;
}
else
{
    image_speed = 0;
    image_index = 0;
}

if (obj_primflowershop.buymenu)
    percent1++;
else
    percent1--;

percent1 = clamp(percent1, 0, 15);
var position = animcurve_channel_evaluate(curveslower, percent1 / 15);
x = lerp(320, 250, position);
