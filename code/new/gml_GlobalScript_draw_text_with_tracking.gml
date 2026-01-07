function draw_text_with_tracking(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var current_x = arg0;
    var current_y = arg1;
    draw_set_color(arg3);
    var line_height = string_height(translation_get_string("draw_text_with_tracking_0"));
    
    for (var i = 1; i <= string_length(arg2); i++)
    {
        var char = string_char_at(arg2, i);
        
        if (char == "\n")
        {
            current_x = arg0;
            current_y += (line_height + arg5);
        }
        else
        {
            draw_text(current_x, current_y, char);
            current_x += (string_width(char) + arg4);
        }
    }
}
