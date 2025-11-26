draw_set_font(fDeterminationMW);
draw_set_color(c_white);
draw_set_halign(fa_left);

if (global.shopmainmenu)
{
    var text = lang("oTextOptions_Draw_0_0");
    var text_x = 478;
    var text_y = 260;
    var shadow_color = 8192771;
    var tracking = -2;
    var leading = 7;
    
    for (var i = 1; i <= string_length(text); i++)
    {
        var current_char = string_char_at(text, i);
        
        if (current_char == lang("oTextOptions_Draw_0_1"))
        {
            text_x = 478;
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

if (global.shopbuymenu)
{
    var text = lang("oTextOptions_Draw_0_2");
    var text_x = 58;
    var text_y = 260;
    var shadow_color = 8192771;
    var tracking = -1;
    var leading = 7;
    
    for (var i = 1; i <= string_length(text); i++)
    {
        var current_char = string_char_at(text, i);
        
        if (current_char == lang("oTextOptions_Draw_0_3"))
        {
            text_x = 58;
            text_y += (string_height(current_char) + leading);
        }
        else
        {
            draw_set_color(c_white);
            draw_text(text_x, text_y, current_char);
            text_x += (string_width(current_char) + tracking);
        }
    }
    
    var text2 = lang("oTextOptions_Draw_0_4");
    var text_x2 = 298;
    var text_y2 = 260;
    var tracking2 = -1;
    var leading2 = 7;
    
    for (var i = 1; i <= string_length(text2); i++)
    {
        var current_char2 = string_char_at(text2, i);
        
        if (current_char2 == lang("oTextOptions_Draw_0_5"))
        {
            text_x2 = 298;
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

if (global.shoptalkmenu && !global.shopmainmenu && !global.shopbuymenu)
{
    var text = lang("oTextOptions_Draw_0_6");
    var text_x = 58;
    var text_y = 260;
    var shadow_color = 8192771;
    var yellow_color = 65535;
    var tracking = -1;
    var leading = 7;
    
    for (var i = 1; i <= string_length(text); i++)
    {
        var current_char = string_char_at(text, i);
        
        if (current_char == lang("oTextOptions_Draw_0_7"))
        {
            text_x = 58;
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
