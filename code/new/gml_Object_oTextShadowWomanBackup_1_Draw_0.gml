draw_set_font(fDeterminationMW);
draw_set_color(c_white);
draw_set_halign(fa_left);
var text_y;

if (global.shoptalkmenu == false)
{
    var text_x = 30;
    text_y = 269;
}
else
{
    var text_x = 448;
    text_y = 260;
}

if (global.itemhover)
{
    global.texttalk = false;
    var text_x = 30;
    text_y = -269;
}

var shadow_color = 8192771;
var tracking = 0;
var leading = 3;

for (var i = 1; i <= string_length(global.displayed_text); i++)
{
    var current_char = string_char_at(global.displayed_text, i);
    var text_x;
    
    if (current_char == translation_get_string("gml_Object_oTextShadowWomanBackup_1_Draw_0_0"))
    {
        if (global.shoptalkmenu == false)
            text_x = 30;
        else
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
