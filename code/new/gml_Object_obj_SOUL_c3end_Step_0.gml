image_blend = make_color_rgb(blend, blend, blend);
timer++;
blend++;
multiplier -= 0.011111111111111112;
multiplier = clamp(multiplier, 0, 1);
randomize();
var randomx = random_range(0, 6 * multiplier);
var randomy = random_range(0, 2 * multiplier);
x = 320 + randomx;
y = 360 + randomy;
blend = clamp(blend, 0, 255);

if (timer == 45)
{
    image_alpha = 0;
    obj_ralseiroom_scare.image_alpha = 1;
    obj_ralsei_scare.image_alpha = 1;
    obj_kris_scare.image_alpha = 1;
    audio_stop_sound(snd_rumble);
    audio_play_sound(snd_hurt1, 1, false);
    audio_play_sound(snd_impact, 1, false);
    audio_play_sound(snd_damage, 1, false, 1, false, 0.9);
}

if (timer == 46)
{
    obj_kris_scare.image_index = 0;
    obj_kris_scare.sprite_index = spr_kris_scare;
    obj_kris_scare.image_speed = 1;
    obj_kris_scare.speed = -26;
    obj_ralsei_scare.scare = true;
    obj_kris_scare.scare = true;
}

if (timer == 65)
{
}
