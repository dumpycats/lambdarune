if (instance_exists(self))
{
    draw_set_font(fDamage);
    draw_set_color(image_blend);
    draw_set_halign(fa_right);
    draw_set_valign(fa_middle);
    draw_set_alpha(image_alpha);
    var tracking = 2;
    var total_width = 0;
    
    for (var i = 1; i <= string_length(value); i++)
    {
        var current_char = string_char_at(value, i);
        total_width += ((string_width(current_char) * image_xscale) + tracking);
    }
    
    total_width -= tracking;
    var text_x;
    
    if (!maximum && !miss)
        text_x = (x - total_width) + 30;
    else
        text_x = x - 30;
    
    var text_y = y + 15;
    tracking = 2;
    
    for (var i = 1; i <= string_length(value); i++)
    {
        var current_char = string_char_at(value, i);
        
        if (!maximum && !miss)
        {
            draw_set_color(c_black);
            draw_text_transformed(text_x + 2, text_y, current_char, image_xscale, image_yscale, 0);
            draw_set_color(c_black);
            draw_text_transformed(text_x, text_y + 2, current_char, image_xscale, image_yscale, 0);
            draw_set_color(c_black);
            draw_text_transformed(text_x - 2, text_y, current_char, image_xscale, image_yscale, 0);
            draw_set_color(c_black);
            draw_text_transformed(text_x, text_y - 2, current_char, image_xscale, image_yscale, 0);
            draw_set_color(c_black);
            draw_text_transformed(text_x + 1, text_y, current_char, image_xscale, image_yscale, 0);
            draw_set_color(c_black);
            draw_text_transformed(text_x, text_y + 1, current_char, image_xscale, image_yscale, 0);
            draw_set_color(c_black);
            draw_text_transformed(text_x - 1, text_y, current_char, image_xscale, image_yscale, 0);
            draw_set_color(c_black);
            draw_text_transformed(text_x, text_y - 1, current_char, image_xscale, image_yscale, 0);
            draw_set_color(image_blend);
            draw_text_transformed(text_x, text_y, current_char, image_xscale, image_yscale, 0);
            text_x += (string_width(current_char) + tracking);
        }
        else if (maximum)
        {
            draw_sprite_ext(spr_max_text, 0, text_x, text_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
        }
        else if (miss)
        {
            draw_sprite_ext(spr_miss_text, 0, text_x, text_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
        }
    }
}

draw_set_alpha(1);
draw_set_valign(fa_top);
