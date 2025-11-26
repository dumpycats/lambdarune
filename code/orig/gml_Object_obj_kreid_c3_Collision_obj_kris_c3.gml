obj_kris_c3.sprite_index = spr_kris_kreidjump;
obj_kris_c3.xfinaloffset -= 6;
slaptimer++;

if (slaptimer == 1)
    audio_play_sound(snd_damage, 1, false);
