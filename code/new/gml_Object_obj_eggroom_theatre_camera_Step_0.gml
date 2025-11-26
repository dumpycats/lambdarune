var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));

if (place_meeting(x, y, obj_kris_c3) && !on && advance_pressed)
{
    instance_create_depth(320, 240, -10, obj_eggroom_theatre_display);
    audio_play_sound(snd_noise, 1, false);
    on = true;
    image_index = 1;
    var roomchange = instance_create_depth(320, 212, -12, oRoomChange);
    roomchange.image_xscale = 5;
    roomchange.image_yscale = 1;
    roomchange.image_alpha = 0;
    roomchange.roomchanging = true;
    roomchange.roomtarget = rm_ch3_eggroom;
}

depth = -y;
