if (global.shoptalkmenu && !global.shopmainmenu && !global.shopbuymenu)
{
    if (global.midnightcrewoption)
        text = "Midnight Crew";
    else
        text = "";
    
    var text_x = 58;
    var text_y = 260;
    var yellow_color = 65535;
    var tracking = -1;
    var leading = 7;
    var text_width = string_width(text) + (tracking * string_length(text));
    var text_height = string_height(text);
    draw_set_color(c_black);
    draw_rectangle(text_x - 5, text_y - 5, text_x + text_width + 5, text_y + text_height + 5, false);
    
    for (var i = 1; i <= string_length(text); i++)
    {
        var current_char = string_char_at(text, i);
        
        if (current_char == "\n")
        {
            text_x = 58;
            text_y += (string_height(current_char) + leading);
        }
        else
        {
            draw_set_color(yellow_color);
            draw_text(text_x, text_y, current_char);
            text_x += (string_width(current_char) + tracking);
        }
    }
}

if (global.shoptalkmenu && !global.shopmainmenu && !global.shopbuymenu)
{
    if (global.revengeoption)
        text2 = "Revenge";
    else
        text2 = "";
    
    var text_x2 = 58;
    var text_y2 = 300;
    var yellow_color2 = 65535;
    var tracking2 = -1;
    var leading2 = 7;
    var text2_width = string_width(text2) + (tracking2 * string_length(text2));
    var text2_height = string_height(text2);
    draw_set_color(c_black);
    draw_rectangle(text_x2 - 5, text_y2 - 5, text_x2 + text2_width + 5, text_y2 + text2_height + 5, false);
    
    for (var i = 1; i <= string_length(text2); i++)
    {
        var current_char2 = string_char_at(text2, i);
        
        if (current_char2 == "\n")
        {
            text_x2 = 58;
            text_y2 += (string_height(current_char2) + leading2);
        }
        else
        {
            draw_set_color(yellow_color2);
            draw_text(text_x2, text_y2, current_char2);
            text_x2 += (string_width(current_char2) + tracking2);
        }
    }
}

if (global.shoptalkmenu && !global.shopmainmenu && !global.shopbuymenu)
{
    if (global.cathodecrewoption)
        text3 = "Cathode Crew";
    else
        text3 = "";
    
    var text_x3 = 58;
    var text_y3 = 380;
    var yellow_color3 = 65535;
    var tracking3 = -1;
    var leading3 = 7;
    var text3_width = string_width(text3) + (tracking3 * string_length(text3));
    var text3_height = string_height(text3);
    draw_set_color(c_black);
    draw_rectangle(text_x3 - 5, text_y3 - 5, text_x3 + text3_width + 5, text_y3 + text3_height + 5, false);
    
    for (var i = 1; i <= string_length(text3); i++)
    {
        var current_char3 = string_char_at(text3, i);
        
        if (current_char3 == "\n")
        {
            text_x3 = 58;
            text_y3 += (string_height(current_char3) + leading3);
        }
        else
        {
            draw_set_color(yellow_color3);
            draw_text(text_x3, text_y3, current_char3);
            text_x3 += (string_width(current_char3) + tracking3);
        }
    }
}
