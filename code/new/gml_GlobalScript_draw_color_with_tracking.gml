function draw_color_with_tracking(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    var current_x = arg0;
    var current_y = arg1;
    draw_set_alpha(arg7);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    for (var i = 1; i <= string_length(arg2); i++)
    {
        var char = string_char_at(arg2, i);
        
        if (char == lang("draw_color_with_tracking_0"))
        {
            current_x = arg0;
            current_y += (string_height(char) + arg9);
        }
        else
        {
            draw_text_color(current_x, current_y, char, arg3, arg4, arg5, arg6, arg7);
            current_x += (string_width(char) + arg8);
        }
    }
    
    draw_set_alpha(1);
}
