draw_self();
draw_set_font(fDeterminationMW);
draw_set_color(c_white);
draw_set_halign(fa_left);
var text;

if (global.buyitems == 1)
    text = lang("oShopMenu2_Draw_0_0");

if (global.buyitems == 2)
    text = lang("oShopMenu2_Draw_0_1");

if (global.buyitems == 3)
    text = lang("oShopMenu2_Draw_0_2");

if (global.buyitems == 4)
    text = lang("oShopMenu2_Draw_0_3");

if (global.buyitems == 5)
    text = lang("oShopMenu2_Draw_0_4");

var text_x = x - 82;
var text_y = y - 90;
var shadow_color = 8192771;
var tracking = -2;
var leading = 6;

for (var i = 1; i <= string_length(text); i++)
{
    var current_char = string_char_at(text, i);
    
    if (current_char == lang("oShopMenu2_Draw_0_5"))
    {
        text_x = x - 82;
        text_y += (string_height(current_char) + leading);
    }
    else
    {
        draw_set_color(c_white);
        draw_text(text_x, text_y, current_char);
        text_x += (string_width(current_char) + tracking);
    }
}
