sprite_prefetch(sLambdaruneLogo);
timer += 1;

if (timer == 1)
{
    audio_play_sound(AUDIO_INTRONOISE, 1, false);
    audio_sound_gain(AUDIO_INTRONOISE, 1, 0);
}

if (timer == 375)
{
    global.intro_done = true;

    if (room == rLambdaruneLogo)
        room_goto(rChapterSelect);
    
    if (room == rLambdaruneLogoToC3)
        room_goto(rChapter3Menu);    
}

if (!fadeout)
{
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
    {
        audio_sound_gain(AUDIO_INTRONOISE, 0, 1000);
        fadeout = true;
    }
}

if (fadeout)
{
    fadetimer++;
    image_alpha -= 0.03333;
    
    if (fadetimer == 60)
    {
        global.intro_done = true;

        audio_stop_sound(AUDIO_INTRONOISE);
        
        if (room == rLambdaruneLogo)
            room_goto(rChapterSelect);
        
        if (room == rLambdaruneLogoToC3)
            room_goto(rChapter3Menu);        
    }
}