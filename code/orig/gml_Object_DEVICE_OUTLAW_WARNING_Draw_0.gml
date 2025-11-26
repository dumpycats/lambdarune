var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
x = cx + 320;
y = cy + 240;
draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, 0.3);
draw_self();
image_alpha += 0.015151515151515152;
PITCH += 0.0015015015015015015;
audio_sound_pitch(AUDIO_OUTLAW_WARNING, PITCH);

if (!audio_is_playing(AUDIO_OUTLAW_WARNING))
    audio_play_sound(AUDIO_OUTLAW_WARNING, 1, true, 1, false, PITCH);

if (PITCH == 1.2972972972972974)
    game_end();
