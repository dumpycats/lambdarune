if (timer == 30)
    audio_play_sound(snd_bell_bc, 1, false);

if (timer == 45)
    audio_play_sound(snd_chain_extend, 1, true);

if (timer >= 45)
{
    oGearLeft.image_angle -= 6;
    oGearRight.image_angle += 6;
    y += 2;
}

oGearLeft.y = y - 77;
oGearRight.y = y - 77;

if (global.geartime == true)
{
    timer++;
    
    if (timer > 15)
    {
        oSusieC3.y = y - 60;
        oKrisPlayerC3.y = y - 30;
    }
}

if (timer == 100)
    instance_create_depth(320, y, -65, oBlackScreen2Room1);
