timer++;
spawntimer++;

if (timer == 30)
{
    instance_create_depth(320, 240, -30, oTextDadTalk);
    audio_play_sound(g, 1, true, 0.1);
    audio_sound_gain(g, 10, 1500);
}

if (spawntimer == 120)
{
    instance_create_depth(320, -30, 10, oPerseveranceLine);
    spawntimer = 0;
}

if (global.daddialogue == 6)
{
    whiteouttimer++;
    
    if (whiteouttimer == 64)
        instance_create_depth(320, 240, -50, oWhiteFadeRoom1);
}
