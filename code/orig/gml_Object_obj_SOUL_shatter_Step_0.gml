timer++;
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (timer == 20)
{
    sprite_index = spr_SOUL_broken;
    image_index = 0;
    audio_play_sound(snd_break1, 1, false);
}

if (timer == 60)
{
    sprite_index = spr_SOUL_shatter;
    image_speed = 1;
    audio_play_sound(snd_break2, 1, false);
}

if (timer == 105)
    instance_create_depth(320, 130, -10, obj_gameover_title);

if (timer == 130)
    audio_play_sound(AUDIO_DEFEAT, 1, true);

if (timer == 140)
{
    global.dialogue = 1;
    instance_create_depth(320, 240, -10, oTextGameOverC3);
}

if (sprite_index == spr_SOUL_shatter && timer < 105)
{
    if (advance_pressed || skip_pressed)
        skip += 1;
    
    if (skip == 4)
        room_goto(rChapter3Room3);
}
