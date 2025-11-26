draw_set_font(fDeterminationMW);
draw_set_color(c_white);
draw_set_halign(fa_left);
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (global.dialogue >= 36 && global.dialogue < 48)
{
    subimg += 0.1;
    draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 394, 1, 1, 0, c_white, 1);
}

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
draw_set_color(c_white);
draw_text(text_x, text_y, global.displayed_text);
