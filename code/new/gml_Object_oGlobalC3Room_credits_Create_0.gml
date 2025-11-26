if (room == rm_ch3credits_installment1)
{
    window_set_caption(lang("oGlobalC3Room_credits_Create_0_0"));
    audio_play_sound(mus_revolution, 1, true, 0.7);
    audio_sound_pitch(mus_revolution, 1);
    sprite_prefetch(spr_credits_ch3_installment1_1);
    sprite_prefetch(spr_credits_ch3_installment1_2);
}

if (room == rm_ch3credits_installment2)
{
    window_set_caption(lang("oGlobalC3Room_credits_Create_0_1"));
    sprite_prefetch(spr_credits_ch3_installment2_1);
    sprite_prefetch(spr_credits_ch3_installment2_2);
}

timer = 0;

if (room == rm_ch3_promo)
    window_set_caption(lang("oGlobalC3Room_credits_Create_0_2"));
