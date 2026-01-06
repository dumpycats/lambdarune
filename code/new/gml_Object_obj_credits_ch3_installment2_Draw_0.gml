draw_sprite_ext(sWhiteScreen, 0, 320, 240, 2, 2, 0, c_white, whitealpha);
draw_self();
draw_sprite_ext(spr_credits_ch3_installment2_1_logo, 0, x, y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_credits_ch3_installment2_2, 0, x, y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_credits_ch3_image_1, 0, x, y + 5540, 1, 1, 0, c_white, 1);
direction = 90;
percent1 += (1 * boost);

if (percent1 <= 3000)
{
    var position = animcurve_channel_evaluate(curvelinear, percent1 / 3000);
    y = lerp(500, -6512, position);
}

var hold;

if (percent1 <= 2770)
{
    hold = (keyboard_check(ord("Z")) || keyboard_check(vk_enter)) || (keyboard_check(ord(get_lang_string("gml_Object_obj_credits_ch3_installment2_Draw_0_0"))) || keyboard_check(vk_shift));
}
else
{
    audio_sound_gain(mus_ch3_credits, 0, 500);
    hold = 0;
}

if (hold)
{
    whitealpha += 0.02;
    boost += 0.1;
    boostpitch += 0.0033333333333333335;
}
else
{
    whitealpha -= 0.04;
    boost -= 0.2;
    boostpitch -= 0.125;
}

whitealpha = clamp(whitealpha, 0, 1/3);
boost = clamp(boost, 1, 6);
boostpitch = clamp(boostpitch, 1, 1.1);

if (percent1 >= 3010)
{
    audio_stop_all();
    room_goto(rm_ch3_promo);
}

audio_sound_pitch(mus_ch3_credits, boostpitch);
