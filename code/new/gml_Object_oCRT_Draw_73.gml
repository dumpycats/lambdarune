var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
generaltimer++;

if (CRT.ShaderOn)
{
    draw_sprite_ext(spr_CRT_static, generaltimer / 3, cx + 320, cy + 240, 1, 1, 0, c_white, alpha);
    
    if (alpha == 1)
        audio_play_sound(mus_sfx_screenswitch, 1, false, 1.5);
    
    alpha -= 0.1;
}
