draw_set_font(fDeterminationMW);
draw_set_color(c_white);
draw_set_halign(fa_left);
var text = get_lang_string("gml_Object_oTextMoney_Draw_0_0") + string(global.money);
var text_x = 438;
var text_y = 419;

if (global.shadowtalking)
    text_x = 1000;

var shadow_color = 8192771;
var tracking = -2;
var leading = 6;

for (var i = 1; i <= string_length(text); i++)
{
    var current_char = string_char_at(text, i);
    
    if (current_char == "\n")
    {
        text_x = 438;
        text_y += (string_height(current_char) + leading);
    }
    else
    {
        draw_set_color(c_white);
        draw_text(text_x, text_y, current_char);
        text_x += (string_width(current_char) + tracking);
    }
}
