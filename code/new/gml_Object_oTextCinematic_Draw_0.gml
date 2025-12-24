draw_set_font(fDeterminationMW);
draw_set_color(c_white);
draw_set_halign(fa_left);
var text_x = 30;
var text_y = 380;
var shadow_color = 0;
var tracking = 0;
var leading = 3;

for (var i = 1; i <= string_length(global.displayed_text); i++)
{
    var current_char = string_char_at(global.displayed_text, i);
    
    if (current_char == lang("oTextCinematic_Draw_0_0"))
    {
        text_x = 448;
        text_y += (string_height(current_char) + leading);
    }
    else
    {
        draw_set_color(shadow_color);
        draw_text(text_x + 1, text_y + 1, current_char);
        draw_set_color(c_white);
        draw_text(text_x, text_y, current_char);
        text_x += (string_width(current_char) + tracking);
    }
}
