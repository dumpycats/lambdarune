if (global.intro_done)
{
    var old_font = draw_get_font();
    var old_halign = draw_get_halign();
    var old_valign = draw_get_valign();
    var old_color = draw_get_color();
    var old_alpha = draw_get_alpha();

    draw_set_font(fDeterminationSans);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_alpha(1);
    
    draw_set_color(c_black);
    draw_rectangle(0, 0, 640, 480, false);

    draw_set_color(c_white);
    draw_text(room_width / 2, room_height / 2, translation_get_string("oLambdaruneLogo_Draw_0_0"));

    draw_set_font(old_font);
    draw_set_halign(old_halign);
    draw_set_valign(old_valign);
    draw_set_color(old_color);
    draw_set_alpha(old_alpha);
}
