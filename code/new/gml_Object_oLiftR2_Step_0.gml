timer++;

if (global.geartime == true)
{
    if (timer > 0 && timer <= 150)
    {
        oSusieC3.y = y - 60;
        oKrisPlayerC3.y = y - 30;
    }
}

if (timer > 0 && timer <= 150)
{
    oGearLeftR2.image_angle -= 6;
    oGearRightR2.image_angle += 6;
    y += 2;
}

oGearLeftR2.y = y - 77;
oGearRightR2.y = y - 77;

if (timer == 150)
{
    audio_stop_sound(snd_chain_extend);
    audio_play_sound(snd_bell_bc, 1, false);
    global.playermove = true;
    global.geartime = false;
}
