var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (timer == 1)
{
    audio_sound_pitch(mus_greenroom, 1);
    audio_sound_gain(mus_greenroom, 1, 0);
    audio_play_sound(mus_greenroom, 1, true, 1, false, 0.9);
}
