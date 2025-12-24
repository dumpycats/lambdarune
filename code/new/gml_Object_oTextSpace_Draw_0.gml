draw_set_font(fFight);
draw_set_color(c_white);
draw_set_halign(fa_left);

if (global.shopbuymenu == true)
{
    var text = translation_get_string("gml_Object_oTextSpace_Draw_0_0") + string(global.space);
    var text_x = 521;
    var text_y = 430;
    var shadow_color = 8192771;
    var tracking = 0;
    var leading = 0;
    
    for (var i = 1; i <= string_length(text); i++)
    {
        var current_char = string_char_at(text, i);
        
        if (current_char == translation_get_string("gml_Object_oTextSpace_Draw_0_1"))
        {
            text_x = 521;
            text_y += (string_height(current_char) + leading);
        }
        else
        {
            draw_set_color(c_white);
            draw_text(text_x, text_y, current_char);
            text_x += (string_width(current_char) + tracking);
        }
    }
}
