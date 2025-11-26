if (!maximum)
{
}
else
{
    image_blend = c_lime;
}

if (instance_exists(self))
{
    draw_set_font(mercyfont);
    draw_set_color(image_blend);
    draw_set_halign(fa_right);
    draw_set_valign(fa_middle);
    draw_set_alpha(image_alpha);
    var text_x = x - 30;
    var text_y = y + 15;
    var tracking = 0;
    
    for (var i = 1; i <= string_length(value); i++)
    {
        var current_char = string_char_at(value, i);
        
        if (!maximum)
        {
            draw_set_color(image_blend);
            draw_text_transformed(text_x, text_y, current_char, image_xscale, image_yscale, 0);
            text_x += (string_width(current_char) + tracking);
        }
        else
        {
            draw_sprite_ext(spr_numbers_100, 0, text_x, text_y, image_xscale, image_yscale, 0, image_blend, image_alpha);
        }
    }
}

draw_set_alpha(1);
draw_set_valign(fa_top);
