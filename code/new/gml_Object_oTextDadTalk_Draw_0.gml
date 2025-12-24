draw_set_font(fDeterminationMW);
draw_set_halign(fa_left);
var text_x = 85;
var text_y = 210;
var shadow_color = 6579300;
var wave_amplitude = 4;
var wave_speed = 0.05;
var wave_frequency = 0.5;
var current_x = text_x;
var current_y = text_y;
var time_offset = current_time / 1000;

for (var i = 1; i <= string_length(global.displayed_text); i++)
{
    var current_char = string_char_at(global.displayed_text, i);
    
    if (current_char == translation_get_string("gml_Object_oTextDadTalk_Draw_0_0"))
    {
        current_x = text_x;
        current_y += string_height(current_char);
    }
    else
    {
        var wave_offset = sin((i * wave_frequency) + time_offset) * wave_amplitude;
        draw_set_color(shadow_color);
        draw_text(current_x, current_y + wave_offset, current_char);
        current_x += string_width(current_char);
    }
}

draw_set_color(c_white);
draw_text(text_x, text_y, global.displayed_text);
