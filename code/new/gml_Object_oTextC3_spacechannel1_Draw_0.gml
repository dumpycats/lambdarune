draw_set_font(fDeterminationMW);
draw_set_halign(fa_left);
var text_x;

if (!(global.dialogue == 1300))
{
    text_x = global.charactertalking ? (camera_get_view_x(view_camera[0]) + 174) : (camera_get_view_x(view_camera[0]) + 58);
    
    if (global.dialoguebottom)
        text_y = camera_get_view_y(view_camera[0]) + 338;
    else if (global.dialoguetop)
        text_y = camera_get_view_y(view_camera[0]) + 30;
}

var shadow_color = 8192771;
var shadow_color1 = 4667705;
draw_set_color(shadow_color);
draw_text_color(text_x + 1, text_y + 1, global.displayed_text, shadow_color1, shadow_color1, shadow_color, shadow_color, 1);

if (global.dialogue == 3)
{
    var separator = translation_get_string("oTextC3_spacechannel1_Draw_0_0");
    var text_parts = string_split(global.current_dialogue, separator);
    var color_len = string_length(separator);
    var x_offset = text_x;
    var current_displayed = global.displayed_text;
    
    for (var i = 0; i < array_length(text_parts); i++)
    {
        var part = text_parts[i];
        
        if (string_length(current_displayed) < string_length(part))
            part = string_copy(part, 1, string_length(current_displayed));
        
        draw_set_color(c_white);
        draw_text(x_offset, text_y, part);
        x_offset += string_width(part);
        current_displayed = string_delete(current_displayed, 1, string_length(part));
        
        if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
        {
            var remaining = string_copy(current_displayed, 1, color_len);
            var color;
            
            switch (i + 1)
            {
                case 1:
                    color = color1;
                    break;
                case 2:
                    color = color2;
                    audio_sound_pitch(snd_foane, 0.995);
                    break;
                case 3:
                    color = color3;
                    audio_sound_pitch(snd_foane, 0.99);
                    break;
                case 4:
                    color = color4;
                    audio_sound_pitch(snd_foane, 0.985);
                    break;
                case 5:
                    color = color5;
                    audio_sound_pitch(snd_foane, 0.98);
                    break;
                case 6:
                    color = color6;
                    audio_sound_pitch(snd_foane, 0.975);
                    break;
                default:
                    color = 16777215;
                    audio_sound_pitch(snd_foane, 1);
                    break;
            }
            
            draw_set_color(#320032);
            draw_text(x_offset + 1, text_y + 1, remaining);
            draw_set_color(color);
            draw_text(x_offset, text_y, remaining);
            x_offset += string_width(remaining);
            current_displayed = string_delete(current_displayed, 1, string_length(remaining));
        }
    }
    
    exit;
}

draw_set_color(c_white);
draw_text(text_x, text_y, global.displayed_text);
