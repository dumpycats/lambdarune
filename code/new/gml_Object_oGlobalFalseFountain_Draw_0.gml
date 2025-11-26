draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, alpha);

if (percentfadeout <= 1)
{
    percentfadeout += 0.016666666666666666;
    var position1 = animcurve_channel_evaluate(curvelinear, percentfadeout);
    var delta_alpha = -1;
    alpha = 1 + (delta_alpha * position1);
}
