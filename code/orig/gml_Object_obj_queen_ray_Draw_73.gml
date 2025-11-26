if (pull == 1)
    draw_self();

image_blend = purplecolor;

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        timer++;
        xscaleextra += 2;
        image_xscale = xscaleextra / 3;
    }
}

if (timer >= 15)
{
    speed += 3;
    image_yscale += (1/3);
    image_alpha -= 0.1;
}

draw_set_color(c_white);
draw_set_font(fDeterminationMW);
