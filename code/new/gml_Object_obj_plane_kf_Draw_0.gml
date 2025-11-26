var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (explosion)
{
    explosiontimer++;
    explosionpercent1++;
    explosionalpha += 0.038461538461538464;
    
    if (explosionpercent1 <= 30)
    {
        var position = animcurve_channel_evaluate(curveslower, explosionpercent1 / 30);
        explosionscale1 = lerp(0, 7, position);
        explosionscale2 = lerp(0, 10, position);
        explosionscale3 = lerp(0, 13, position);
    }
    
    draw_sprite_ext(spr_circle_500x500, 0, cx + 520, cy + 264 + obj_kreid_c3.yoffset, explosionscale3 / 10, explosionscale3 / 10, 0, c_white, 1 - explosionalpha);
    draw_sprite_ext(spr_circle_500x500, 0, cx + 520, cy + 264 + obj_kreid_c3.yoffset, explosionscale2 / 10, explosionscale2 / 10, 0, c_white, 1 - (explosionalpha * 1.2));
    draw_sprite_ext(spr_circle_500x500, 0, cx + 520, cy + 264 + obj_kreid_c3.yoffset, explosionscale1 / 10, explosionscale1 / 10, 0, c_white, 1 - (explosionalpha * 1.5));
}

draw_self();
