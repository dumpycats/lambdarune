global.afterfirstopen = true;
global.timer += 1;

if (global.timer == 15)
{
    audio_play_sound(mus_ch3legend, 1, false, 1);
    audio_sound_gain(mus_ch3legend, 0, 0);
}

if (global.timer == 16)
    audio_sound_gain(mus_ch3legend, 1, 300);

if (global.timer == 79)
{
    instance_create_depth(320, 0, 0, oFrame1);
    oFrame1.image_xscale = 2;
    oFrame1.image_yscale = 2;
}

if (global.timer == 284)
{
    reset_dialogue();
    global.cinematicdialogue = 2;
    instance_create_depth(320, 0, -1, oFrame2);
    oFrame2.image_xscale = 2;
    oFrame2.image_yscale = 2;
}

if (global.timer == 417)
{
    reset_dialogue();
    global.cinematicdialogue = 3;
    instance_create_depth(320, 0, -2, oFrame3);
}

if (global.timer == 510)
{
    instance_create_depth(320, 180, 0, oFrame4);
    instance_create_depth(320, 602, -50, o640x480fade);
    oFrame4.image_xscale = 2;
    oFrame4.image_yscale = 2;
}

if (global.timer == 630)
{
    reset_dialogue();
    global.cinematicdialogue = 4;
    instance_create_depth(320, 0, -3, oFrame5);
    oFrame5.image_xscale = 2;
    oFrame5.image_yscale = 2;
}

if (global.timer == 670)
{
    reset_dialogue();
    global.cinematicdialogue = 5;
}

if (global.timer == 742)
{
    instance_create_depth(320, 0, -4, oFrame6);
    oFrame6.image_xscale = 2;
    oFrame6.image_yscale = 2;
}

if (global.timer == 777)
{
    reset_dialogue();
    global.cinematicdialogue = 6;
}

if (global.timer == 853)
{
    instance_create_depth(320, 0, -5, oFrame7);
    oFrame7.image_xscale = 2;
    oFrame7.image_yscale = 2;
}

if (global.timer == 892)
{
    reset_dialogue();
    global.cinematicdialogue = 7;
}

if (global.timer == 1000)
    instance_create_depth(320, 240, -50, o640x480fade);

if (global.timer == 1120)
{
    reset_dialogue();
    global.cinematicdialogue = 8;
}

if (global.timer == 1125)
{
    reset_dialogue();
    global.cinematicdialogue = 9;
    instance_create_depth(320, 240, -50, o640x480fade2);
    instance_create_depth(320, -406, -6, oFrame8);
    oFrame8.image_xscale = 2;
    oFrame8.image_yscale = 2;
}

if (global.timer == 1244)
{
    reset_dialogue();
    global.cinematicdialogue = 10;
}

if (global.timer == 1317)
    instance_create_depth(320, 240, -50, o640x480fade);

if (global.timer == 1437)
{
    instance_destroy(oFrame8);
    instance_destroy(oTextCinematic);
}

if (global.timer == 1537)
    audio_sound_gain(mus_ch3legend, 0, 300);

if (global.timer == 1610)
{
    global.c3cutscenecompleted = true;
    oPersistent.androidsavetimer = -1;
    audio_stop_sound(mus_ch3legend);
    room_goto(rLambdaruneLogo);
}

sprite_prefetch(sLambdaruneLogo);
var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));

if (global.timer > 16 && global.c3cutscenecompleted && global.timer < 1244)
{
    if (advance_pressed)
    {
        fadeout = true;
        global.c3cutscenecompleted = true;
    }
    
    if (fadeout)
    {
        blackalpha += 0.03334;
        audio_sound_gain(mus_ch3legend, 0, 300);
    }
    
    if (blackalpha > 2)
    {
        audio_stop_sound(mus_ch3legend);
        room_goto(rLambdaruneLogoToC3);
    }
}
