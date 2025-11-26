timer++;

if (timer < 11)
    image_alpha += 0.06;

if (image_alpha > 6)
    image_alpha = 6;

if (!chosen)
{
    if (keyboard_check_pressed(vk_left))
        choice = -1;
    
    if (keyboard_check_pressed(vk_right))
        choice = 1;
}

var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));

if (choice == -1)
{
    obj_continue_giveup.image_index = 1;
    percent1 += 0.08333333333333333;
    position1 = animcurve_channel_evaluate(curve1, percent1);
    var _start1 = x;
    var _end1 = 216;
    var _distance1 = _end1 - _start1;
    x = _start1 + (_distance1 * position1);
    percent2 = 0;
    
    if (advance_pressed)
    {
        audio_stop_sound(AUDIO_DEFEAT);
        chosen = true;
        savior = true;
    }
}

if (choice == 1)
{
    obj_continue_giveup.image_index = 2;
    percent2 += 0.08333333333333333;
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = x;
    var _end2 = 424;
    var _distance2 = _end2 - _start2;
    x = _start2 + (_distance2 * position2);
    percent1 = 0;
    
    if (advance_pressed)
    {
        audio_stop_sound(AUDIO_DEFEAT);
        chosen = true;
        failure = true;
    }
}

if (chosen)
{
    image_alpha -= 0.06;
    obj_continue_giveup.image_alpha -= 0.1;
}

if (savior)
{
    saviortimer++;
    
    if (saviortimer == 30)
        instance_create_depth(320, 240, -15, obj_whitescreenout);
}

if (failure)
{
    failuretimer++;
    image_alpha = 0;
    obj_continue_giveup.image_alpha = 0;
    obj_gameover_title.image_alpha = 0;
    
    if (failuretimer == 15)
        audio_play_sound(AUDIO_DARKNESS, 1, false);
    
    if (failuretimer == 2135)
        game_end();
}
