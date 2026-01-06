draw_set_font(fDeterminationMW);
draw_set_color(c_white);
draw_set_halign(fa_left);

if (global.itemhover)
{
    var text;
    
    if (global.buyitems == 1)
        text = get_lang_string("gml_Object_oBuyItems_Draw_0_0");
    
    if (global.buyitems == 2)
        text = get_lang_string("gml_Object_oBuyItems_Draw_0_1");
    
    if (global.buyitems == 3)
        text = get_lang_string("gml_Object_oBuyItems_Draw_0_2");
    
    if (global.buyitems == 4)
        text = get_lang_string("gml_Object_oBuyItems_Draw_0_3");
    
    var text_x = 448;
    var text_y = 260;
    var shadow_color = 8192771;
    var tracking = 0;
    var leading = 4;
    
    for (var i = 1; i <= string_length(text); i++)
    {
        var current_char = string_char_at(text, i);
        
        if (current_char == "\n")
        {
            text_x = 448;
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

if (global.itemhover)
{
    var text2 = get_lang_string("gml_Object_oBuyItems_Draw_0_4");
    var text_x2 = 480;
    var text_y2 = 344;
    var shadow_color2 = 8192771;
    var tracking2 = 0;
    var leading2 = -2;
    
    for (var i = 1; i <= string_length(text2); i++)
    {
        var current_char2 = string_char_at(text2, i);
        
        if (current_char2 == "\n")
        {
            text_x2 = 480;
            text_y2 += (string_height(current_char2) + leading2);
        }
        else
        {
            draw_set_color(c_white);
            draw_text(text_x2, text_y2, current_char2);
            text_x2 += (string_width(current_char2) + tracking2);
        }
    }
}
