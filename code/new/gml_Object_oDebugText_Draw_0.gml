draw_set_font(fDeterminationMW);
draw_set_color(c_green);
draw_set_halign(fa_left);
var textt = get_lang_string("gml_Object_oDebugText_Draw_0_0");
var text_xt = 20;
var text_yt = 20;
draw_text(text_xt, text_yt, textt);

if (global.midnightcrewoptiondone)
{
    var text = get_lang_string("gml_Object_oDebugText_Draw_0_1");
    var text_x = 20;
    var text_y = 20;
    draw_text(text_x, text_y, text);
}

if (global.revengeoptiondone)
{
    var text2 = get_lang_string("gml_Object_oDebugText_Draw_0_2");
    var text_x2 = 20;
    var text_y2 = 50;
    draw_text(text_x2, text_y2, text2);
}

if (global.shadowbardone)
{
    var text3 = get_lang_string("gml_Object_oDebugText_Draw_0_3");
    var text_x3 = 20;
    var text_y3 = 80;
    draw_text(text_x3, text_y3, text3);
}

if (global.cathodecrewoptiondone)
{
    var text4 = get_lang_string("gml_Object_oDebugText_Draw_0_4");
    var text_x4 = 20;
    var text_y4 = 110;
    draw_text(text_x4, text_y4, text4);
}

if (global.shopexperiencedone)
{
    var text5 = get_lang_string("gml_Object_oDebugText_Draw_0_5");
    var text_x5 = 20;
    var text_y5 = 140;
    draw_text(text_x5, text_y5, text5);
}
