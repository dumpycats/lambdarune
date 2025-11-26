draw_sprite_ext(spr_string_purple_idle, subimg6, xhead - 2, y, 0.5, 1, 0, halfcolor, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg7, xhead - 6, y, 0.5, 1, 0, halfcolor, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg8, xhead + 8, y, 0.5, 1, 0, halfcolor, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg2, xhead + 7, y, 1, 1, 0, c_white, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg3, xhead, y, 1, 1, 0, c_white, image_alpha);
draw_sprite_ext(spr_string_purple_idle, subimg4, xhead - 10, y, 1, 1, 0, c_white, image_alpha);
draw_sprite_ext(sprite_index, 0, xhead, y, 2, 2, 0, c_white, image_alpha);
draw_sprite_ext(sprite_index, 2, xbody, y, 2, 2, angle1, c_white, image_alpha);
draw_sprite_ext(sprite_index, 3, xlegs, y, 2, 2, angle1, c_white, image_alpha);

if (global.alldown)
    exit;

timer++;
y = yy + (sin((timer / 100) * (2 * pi)) * 6);
xhead = xx + xoffset0;
xbody = xx + xoffset1;
xlegs = xx + xoffset2;

if (shift)
{
    shifttimer++;
    percent2 = 0;
    xoffset0 = sin((shifttimer / 20) * (2 * pi)) * 2;
    xoffset1 = sin((shifttimer / 17) * (2 * pi)) * 2;
    angle1 = sin((shifttimer / 17) * (2 * pi)) * 4;
    xoffset2 = sin((shifttimer / 12) * (2 * pi)) * 2;
    angle2 = sin((shifttimer / 12) * (2 * pi)) * 7;
}
else
{
    shifttimer = -1;
    percent2++;
    var position = animcurve_channel_evaluate(curveslower, percent2 / 20);
    xoffset0 = lerp(xoffset0, 0, position);
    xoffset1 = lerp(xoffset1, 0, position);
    xoffset2 = lerp(xoffset2, 0, position);
    angle1 = lerp(angle1, 0, position);
    angle2 = lerp(angle2, 0, position);
}

subimg1 += speed1;
subimg2 += speed2;
subimg3 += speed3;
subimg4 += speed4;
subimg5 += speed5;
subimg6 += speed6;
subimg7 += speed7;
subimg8 += speed8;
