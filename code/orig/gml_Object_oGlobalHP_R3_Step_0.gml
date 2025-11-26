if (global.susiehp <= 1)
    global.susiehp = 1;

if (global.krishp <= 0)
{
    global.playermove = false;
    audio_stop_sound(mus_shadowchase);
    obj_shadowman.image_speed = 0;
}
