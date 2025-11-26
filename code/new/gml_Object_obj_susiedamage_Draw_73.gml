if (instance_exists(obj_susiedamage))
{
    draw_set_font(fDamage);
    draw_set_color(c_white);
    draw_set_halign(fa_right);
    draw_set_valign(fa_middle);
    draw_set_alpha(image_alpha);
    var text_x = x - 30;
    var text_y = y + 12;
    var tracking = 2;
    
    for (var i = 1; i <= string_length(value); i++)
    {
        var current_char = string_char_at(value, i);
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
        draw_set_color(c_white);
        draw_text_transformed(text_x, text_y, current_char, image_xscale, image_yscale, 0);
        text_x += (string_width(current_char) + tracking);
    }
}

draw_set_alpha(1);
