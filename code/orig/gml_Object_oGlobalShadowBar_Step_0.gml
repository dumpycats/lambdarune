global.timer += 1;

if (global.timer == 1)
{
    audio_play_sound(mus_shadowshop, 1, true, 1);
    audio_sound_gain(mus_shadowshop, 1, 1000);
}

if (instance_exists(oBlackScreen))
{
    if (global.timer > 12 && oBlackScreen.image_alpha > 1)
        audio_sound_gain(mus_shadowshop, 0, 300);
}

if (global.midnightcrewoptiondone && global.revengeoptiondone && global.shadowbardone && global.cathodecrewoptiondone)
    global.shopexperiencedone = true;

if (instance_exists(oBlackScreen) && global.fadeout)
{
    timerend++;
    
    if (timerend == 80)
    {
        if (global.getnew)
        {
            oPersistent.androidsavetimer = -1;
            
            if (!global.c3shadowshopcompleted)
            {
                instance_create_depth(0, 0, -59, obj_memorandum_notice_c3);
                obj_memorandum_notice_c3.image_index = 2;
                global.c3shadowshopcompleted = true;
            }
        }
        
        room_goto(rLambdaruneLogoToC3);
    }
}
