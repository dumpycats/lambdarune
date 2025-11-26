draw_sprite_ext(spr_string_purple_idle, subimg5, x + 16, y - 20, 1, 1, 0, halfcolor, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg6, x - 7, y - 20, 1, 1, 0, halfcolor, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg7, x - 27, y - 20, 1, 1, 0, halfcolor, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg8, x + 20, y - 20, 1, 1, 0, halfcolor, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg1, x + 36, y - 20, 2, 2, 0, c_white, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg2, x - 3, y - 20, 2, 2, 0, c_white, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg3, x + 12, y - 20, 2, 2, 0, c_white, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg4, x - 27, y - 20, 2, 2, 0, c_white, image_alpha);

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        subimg1 += speed1;
        subimg2 += speed2;
        subimg3 += speed3;
        subimg4 += speed4;
        subimg5 += speed5;
        subimg6 += speed6;
        subimg7 += speed7;
        subimg8 += speed8;
    }
}

draw_self();

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
    }
}

y = yy + round(sin((timer / (80 * speed1)) * (2 * pi)) * 14);
image_alpha += 0.1;
