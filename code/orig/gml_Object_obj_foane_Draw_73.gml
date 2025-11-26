draw_set_color(c_orange);
draw_set_color(c_white);

if (finalout)
{
    if (percent4 == 0.045454545454545456)
        instance_create_depth(x, y, -20, obj_specialboom);
    
    var time = current_time / 1000;
    percent4 += 0.045454545454545456;
    var position4 = animcurve_channel_evaluate(curve1, percent4);
    var size_offset = 150;
    var scale = 10 + (size_offset * position4);
    draw_sprite_ext(spr_specialboom, 0, x + 22, y - 258, 0.2 * scale, 0.2 * scale, 0, c_white, 1);
    
    if (percent4 > 0.5)
        instance_destroy(obj_circleblast);
    
    if (percent4 > 2.25)
    {
        alpha += 0.0334;
        draw_sprite_ext(spr_specialboom, 0, 320, 240, 20, 20, 0, c_black, alpha);
    }
}
