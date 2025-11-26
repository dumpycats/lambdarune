var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var revert_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (advance_pressed)
{
}

timer++;

if (timer < 5)
{
    image_alpha += (1/3);
    image_alpha = clamp(image_alpha, 0, 1);
}

percent1++;
var position = animcurve_channel_evaluate(curvefaster, percent1 / 10);
x = lerp(xx, targetx, position);
var positionbuild = animcurve_channel_evaluate(curvefasterbuild, percent1 / 10);
y = lerp(yy, targety, positionbuild);
var positionease = animcurve_channel_evaluate(curveease, percent1 / 10);
image_angle = lerp(startangle, endangle, positionease);

if (percent1 == 11)
{
    instance_create_depth(x, y, depth - 500, obj_rudebuster_impact);
    obj_rudebuster_impact.damage = round(damage);
}

if (percent1 >= 11 && percent1 <= 14)
{
    if (advance_pressed && !damagechanged)
    {
        damage *= 1.1;
        
        if (instance_exists(obj_rudebuster_impact))
            obj_rudebuster_impact.damage = round(damage);
        
        damagechanged = true;
    }
}

if (percent1 > 10)
{
    image_yscale -= 0.2;
    image_alpha -= 0.125;
}

if (percent1 < 10)
    instance_create_depth(x, y, (depth + 40) - timer, obj_rudebuster_echo);

if (percent1 == 40)
    instance_destroy();
