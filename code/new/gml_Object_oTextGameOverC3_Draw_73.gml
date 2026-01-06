draw_set_font(fDeterminationMW);
draw_set_color(c_white);
draw_set_halign(fa_left);
var text_x = 146;
var text_y = 300;
var tracking = 8;
var leading = 7;

for (var i = 1; i <= string_length(global.displayed_text); i++)
{
    var current_char = string_char_at(global.displayed_text, i);
    
    if (current_char == "\n")
    {
        text_x = 146;
        text_y += (string_height(current_char) + leading);
    }
    else
    {
        draw_set_color(c_black);
        draw_text(text_x + 1, text_y + 100, current_char);
        draw_set_color(c_white);
        draw_text(text_x, text_y, current_char);
        text_x += (string_width(current_char) + tracking);
    }
}
