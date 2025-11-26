var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
x = xx + xoffset;

if (endbattle)
{
    percent1 += 0.0125;
    var position1 = animcurve_channel_evaluate(curvefaster, percent1);
    var delta_x = 1180;
    xoffset = 0 + (delta_x * position1);
    obj_kreid_c3.xoffset = xoffset;
    obj_kris_c3.xoffset = xoffset;
    percent2 += 0.013513513513513514;
    var position2 = animcurve_channel_evaluate(curvelinear, percent2);
    var delta_x2 = -440;
    obj_kreid_c3.xoffsetfinal = 0 + (delta_x2 * position2);
    
    if (percent1 == 0.4875)
    {
        audio_play_sound(mus_cymbalshort, 1, false);
        audio_sound_gain(mus_kreidfight, 0, 1050);
    }
    
    if (percent1 == 0.875)
    {
        instance_create_depth(cx + 800, cy + 240, -102, obj_planeblast);
        audio_stop_sound(mus_kreidfight);
    }
}
