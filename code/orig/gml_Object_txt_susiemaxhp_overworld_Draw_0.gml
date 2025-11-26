var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
draw_set_font(fHP);
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

if (global.susiehp <= (global.susiemaxhp * 0.2))
    draw_set_color(c_yellow);
else
    draw_set_color(c_white);

if (global.susiehp <= 0)
    draw_set_color(c_red);

var text = string(global.susiemaxhp);
var letter_spacing = 8;
var total_width = string_length(text) * letter_spacing;
var start_x = (cam_x + 532 + global.cxoffset) - total_width;

for (var i = 1; i <= string_length(text); i++)
{
    var char = string_char_at(text, i);
    draw_text(start_x + ((i - 1) * letter_spacing), cam_y + 433 + global.cyoffset, char);
}

draw_set_font(-1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
