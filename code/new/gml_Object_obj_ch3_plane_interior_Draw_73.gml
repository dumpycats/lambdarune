draw_sprite_ext(spr_ch3_plane_exterior, 0, x, y, image_xscale, image_yscale, 0, c_white, extalpha);
percentextfade += 0.016666666666666666;

if (percentextfade < 5)
{
    var position1 = animcurve_channel_evaluate(curveease, percentextfade - 3.1666666666666665);
    var delta_alpha = -1;
    extalpha = 1 + (delta_alpha * position1);
}
