if (image_alpha > 1)
    image_alpha = 1;

if (image_alpha < 0)
    image_alpha = 0;

timer++;

if (timer == 1)
{
    audio_play_sound(AUDIO_DRONE, 1, true);
    audio_sound_gain(AUDIO_DRONE, 1, 1);
}

if (timer <= 10)
{
    image_alpha += 0.1;
    percent1 += 0.1;
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = cam_y + 220;
    var _end = cam_y + 240;
    var _distance = _end - _start;
    y = _start + (_distance * position);
}

if (timer > 10)
{
    if (!chapter3playdonotmenu)
    {
        if (!menuinaccessible)
        {
            if (keyboard_check_pressed(vk_down))
            {
                image_index += 1;
                audio_play_sound(snd_menumove, 1, false);
            }
            else if (keyboard_check_pressed(vk_up))
            {
                image_index -= 1;
                audio_play_sound(snd_menumove, 1, false);
            }
            
            if (image_index > 3)
                image_index = 0;
            
            if (image_index < 0)
                image_index = 3;
        }
    }
}

if (!menuinaccessible)
{
    if (image_index == 0)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            audio_play_sound(snd_acquire_lancer, 1, false);
    }
    
    if (image_index == 1)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            audio_play_sound(snd_acquire_lancer, 1, false);
    }
    
    if (image_index == 2)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            image_index = 4;
            
            if (!chapter3playdonotmenu)
                audio_play_sound(snd_select, 1, false);
            
            chapter3playdonotmenu = true;
        }
    }
}

if (chapter3playdonotmenu)
{
    if (!menuinaccessible)
    {
        if (keyboard_check_pressed(vk_right))
        {
            image_index += 1;
            audio_play_sound(snd_menumove, 1, false);
        }
        else if (keyboard_check_pressed(vk_left))
        {
            image_index -= 1;
            audio_play_sound(snd_menumove, 1, false);
        }
        
        if (image_index > 5)
            image_index = 5;
        
        if (image_index < 4)
            image_index = 4;
        
        if (image_index == 5)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                image_index = 2;
                waittimer = 0;
                chapter3playdonotmenu = false;
                audio_play_sound(snd_select, 1, false);
            }
        }
        
        if (image_index == 4 || image_index == 5)
        {
            if (keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X")))
            {
                image_index = 2;
                waittimer = 0;
                chapter3playdonotmenu = false;
                audio_play_sound(snd_swing, 1, false);
            }
        }
    }
}

if (image_index == 0)
    oChapterBackgroundC1.image_alpha += 0.1;
else
    oChapterBackgroundC1.image_alpha -= 0.1;

oChapterBackgroundC1.x = x;
oChapterBackgroundC1.y = y;
oChapterBackgroundC1.image_xscale = image_xscale;
oChapterBackgroundC1.image_yscale = image_yscale;

if (image_index == 1)
    oChapterBackgroundC2.image_alpha += 0.1;
else
    oChapterBackgroundC2.image_alpha -= 0.1;

oChapterBackgroundC2.x = x;
oChapterBackgroundC2.y = y;
oChapterBackgroundC2.image_xscale = image_xscale;
oChapterBackgroundC2.image_yscale = image_yscale;

if ((image_index == 2 || image_index == 4 || image_index == 5) && !menuinaccessible)
    oChapterBackgroundC3.image_alpha += 0.1;
else
    oChapterBackgroundC3.image_alpha -= 0.1;

oChapterBackgroundC3.x = x;
oChapterBackgroundC3.y = y;
oChapterBackgroundC3.image_xscale = image_xscale;
oChapterBackgroundC3.image_yscale = image_yscale;

if (image_index == 4)
{
    waittimer++;
    
    if (waittimer >= 2)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            if (!menuinaccessible)
                audio_play_sound(snd_select, 1, false);
            
            menuinaccessible = true;
        }
    }
}

if (menuinaccessible)
{
    menuoutrotimer++;
    
    if (menuoutrotimer == 1)
        audio_play_sound(snd_aw_audience, 1, false);
    
    image_xscale -= 0.033;
    image_alpha -= 0.05;
    y -= 0.8;
    audio_sound_gain(AUDIO_DRONE, 0, 500);
}

if (menuoutrotimer == 90)
{
    audio_stop_sound(AUDIO_DRONE);
    
    if (image_index == 4)
    {
        sprite_prefetch(sDepthsDim);
        sprite_prefetch(global.sLambdaruneBlackLogoOut);
        sprite_prefetch(sBackgroundChapter3Menu);
        sprite_prefetch(sBackgroundChapter3Menu2);
        
        if (!global.c3outskirtscompleted)
            sprite_prefetch(sChapter3Memo1V2);
        else
            sprite_prefetch(sChapter3Memo1V1);
        
        if (!global.c3kreidcompleted)
        {
            sprite_prefetch(sChapter3Memo2V2);
            sprite_prefetch(sChapter3Memo3V2);
        }
        else
        {
            sprite_prefetch(sChapter3Memo2V1);
            sprite_prefetch(sChapter3Memo3V1);
        }
        
        if (!global.c3shadowshopcompleted)
            sprite_prefetch(spr_Chapter3Memo4_incomplete);
        else
            sprite_prefetch(spr_Chapter3Memo4_complete);
        
        if (!global.c3foanecompleted)
        {
            sprite_prefetch(spr_Chapter3Memo5_incomplete);
            sprite_prefetch(spr_Chapter3Memo6_incomplete);
            sprite_prefetch(spr_Chapter3Memo7_incomplete);
            sprite_prefetch(spr_Chapter3Memo8_incomplete);
            sprite_prefetch(spr_Chapter3Memo9_incomplete);
            sprite_prefetch(spr_Chapter3Memo10_incomplete);
        }
        else
        {
            sprite_prefetch(spr_Chapter3Memo5_complete);
            sprite_prefetch(spr_Chapter3Memo6_complete);
            sprite_prefetch(spr_Chapter3Memo7_complete);
            sprite_prefetch(spr_Chapter3Memo8_complete);
            sprite_prefetch(spr_Chapter3Memo9_complete);
            sprite_prefetch(spr_Chapter3Memo10_complete);
        }
        
        if (!global.c3kreidfightcompleted)
            sprite_prefetch(spr_Chapter3Memo11_incomplete);
        else
            sprite_prefetch(spr_Chapter3Memo11_complete);
        
        if (!global.c3primcompleted)
            sprite_prefetch(spr_Chapter3Memo12_incomplete);
        else
            sprite_prefetch(spr_Chapter3Memo12_complete);
        
        if (!global.c3maximikecompleted)
        {
            sprite_prefetch(spr_Chapter3Memo13_none);
            sprite_prefetch(spr_Chapter3Memo14_none);
        }
        else if (!global.c3signalcompleted)
        {
            sprite_prefetch(spr_Chapter3Memo13_part);
            sprite_prefetch(spr_Chapter3Memo14_part);
        }
        else
        {
            sprite_prefetch(spr_Chapter3Memo13_complete);
            sprite_prefetch(spr_Chapter3Memo14_complete);
        }
        
        if (!global.c3signalcompleted)
        {
            sprite_prefetch(spr_Chapter3Memo15_incomplete);
            sprite_prefetch(spr_Chapter3Memo16_incomplete);
        }
        else
        {
            sprite_prefetch(spr_Chapter3Memo15_complete);
            sprite_prefetch(spr_Chapter3Memo16_complete);
        }
        
        if (!global.c3epiloguecompleted)
            sprite_prefetch(spr_Chapter3Memo17_incomplete);
        else
            sprite_prefetch(spr_Chapter3Memo17_complete);
    }
}

if (menuoutrotimer == 92)
    room_goto(rChapter3Menu);

if (image_index == 3)
{
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        game_end();
}
