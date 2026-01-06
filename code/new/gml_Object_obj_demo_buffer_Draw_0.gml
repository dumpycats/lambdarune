timer++;

if (timer < 10)
    draw_set_alpha(timer / 10);
else if (timer >= 50)
    draw_set_alpha(1 - ((timer - 50) / 10));

if (timer == 10)
    audio_play_sound(snd_leave, 1, false, 1.6);

draw_set_font(fDeterminationMW);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(320, 240, get_lang_string("obj_demo_buffer_Draw_0_0"), 1, 1, 0);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (timer == 60)
{
    audio_stop_sound(snd_leave);
    room_goto(rLambdaruneLogoToC3);
}
