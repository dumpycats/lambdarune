timer++;

if (timer == 1)
{
    audio_play_sound(mus_wind, 1, true, 0.1, false, 0.5);
    
    if (global.c3outskirtscompleted == false)
        audio_sound_gain(mus_wind, 10, 1000);
    
    if (global.c3outskirtscompleted == true)
        audio_sound_gain(mus_wind, 0, 0);
}

if (global.c3outskirtscompleted)
{
    if (timer == 1)
    {
        audio_play_sound(mus_broadcastworld, 1, true);
        audio_sound_gain(mus_broadcastworld, 1, 100);
    }
}

if (menuaccessible)
{
    if (!instance_exists(oBlackScreen1Chapter3Menu))
    {
        if (global.c3foanecompleted)
        {
            if (keyboard_check_pressed(vk_left))
            {
                if (column == 1)
                {
                    column--;
                }
                else
                {
                }
            }
            
            if (keyboard_check_pressed(vk_right))
            {
                if (column == 0)
                {
                    column++;
                }
                else
                {
                }
            }
        }
        
        if (column == 0)
        {
            oChapter3_I.image_index = 0;
            oChapter3_II.image_index = 0;
            oChapter3_III.image_index = 0;
            oChapter3_IV.image_index = 0;
            oChapter3_V.image_index = 0;
        }
        else
        {
            oChapter3_I.image_index = 1;
            oChapter3_II.image_index = 1;
            oChapter3_III.image_index = 1;
            oChapter3_IV.image_index = 1;
            oChapter3_V.image_index = 1;
        }
        
        if (keyboard_check_pressed(vk_down))
            selectoption += 1;
        
        if (keyboard_check_pressed(vk_up))
            selectoption -= 1;
    }
}

if (selectoption < 1)
    selectoption = 7;

if (selectoption > 8) //
    selectoption = 1;

if (selectoption == 1)
{
    x = 25;
    y = 195;
    oChapter3_I.image_blend = yellow;
}
else
{
    oChapter3_I.image_blend = c_white;
}

if (selectoption == 2)
{
    x = 25;
    y = 227;
    
    if (oChapter3_II.image_index == 0)
        oChapter3_II.image_blend = yellow;
    else
        oChapter3_II.image_blend = yellow;
}
else if (oChapter3_II.image_index == 0)
{
    oChapter3_II.image_blend = c_white;
}
else
{
    oChapter3_II.image_blend = c_white;
}

if (selectoption == 3)
{
    x = 25;
    y = 259;
    
    if (oChapter3_III.image_index == 0)
        oChapter3_III.image_blend = yellow;
    else
        oChapter3_III.image_blend = yellow;
}
else if (oChapter3_III.image_index == 0)
{
    oChapter3_III.image_blend = c_white;
}
else
{
    oChapter3_III.image_blend = c_white;
}

if (selectoption == 4)
{
    x = 25;
    y = 291;
    
    if (oChapter3_IV.image_index == 0)
        oChapter3_IV.image_blend = yellow;
    else
        oChapter3_IV.image_blend = yellow;
}
else if (oChapter3_IV.image_index == 0)
{
    oChapter3_IV.image_blend = c_white;
}
else
{
    oChapter3_IV.image_blend = c_white;
}

if (selectoption == 5)
{
    x = 25;
    y = 323;
    
    if (oChapter3_V.image_index == 0)
        oChapter3_V.image_blend = yellow;
    else
        oChapter3_V.image_blend = yellow;
}
else if (oChapter3_V.image_index == 0)
{
    oChapter3_V.image_blend = c_white;
}
else
{
    oChapter3_V.image_blend = c_white;
}


//
translation_switch_color = c_white;

if (selectoption == 6)
{
    x = 25;
    y = 387;
    translation_switch_color = c_yellow;
}

if (selectoption == 8)
{
    if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && menuaccessible)
    {
        
    }
}
//


if (selectoption == 7) //
{
    x = 25;
    y = 419;
    oChapter3Extras.image_blend = yellow;
}
else
{
    oChapter3Extras.image_blend = c_white;
}

if (selectoption == 8) //
{
    x = 25;
    y = 451;
    oChapter3ChapterSelect.image_blend = yellow;
}
else
{
    oChapter3ChapterSelect.image_blend = c_white;
}

if (selectoption == 8) //
{
    if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && menuaccessible)
    {
        leave = true;
        menuaccessible = false;
    }
    
    if (leave)
    {
        leavetimer++;
        audio_sound_gain(mus_wind, 0, 500);
        audio_sound_gain(mus_broadcastworld, 0, 500);
        
        if (leavetimer == 1)
            instance_create_depth(320, 240, -50, oBlackScreenLeaveChapter3Menu);
        
        if (leavetimer == 30)
        {
            audio_stop_all();
            room_goto(rChapterSelect);
        }
    }
}

if (selectoption == 7) //
{
    if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && menuaccessible && !memoleave)
    {
        memotimer = 0;
        memoview = true;
        menuaccessible = false;
        
        if (global.c3outskirtscompleted)
        {
            audio_sound_gain(mus_broadcastworld, 0, 500);
            audio_sound_gain(mus_wind, 10, 500);
        }
    }
}

if (memoview)
    memotimer++;

if (memotimer == 1)
{
    instance_create_depth(320, 240, -40, oBlackScreenMemoChapter3Menu);
    sprite_prefetch(sChapter3Memo1V1);
}

if (memotimer == 10)
{
    instance_create_depth(320, 240, -41, oDepthsDim);
    instance_create_depth(320, 240, -42, oChapter3Memo1);
    instance_create_depth(960, 240, -42, oChapter3Memo2);
    instance_create_depth(960, 240, -43, obj_Chapter3Memo3);
    instance_create_depth(960, 240, -44, obj_Chapter3Memo3_2);
    instance_create_depth(960, 240, -45, obj_Chapter3Memo4);
    instance_create_depth(960, 240, -46, obj_Chapter3Memo5);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo6);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo7);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo8);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo9);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo10);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo11);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo12);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo13);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo14);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo15);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo16);
    instance_create_depth(960, 240, -47, obj_Chapter3Memo17);
    instance_create_depth(320, 240, -60, oMemoArrows);
    oMemoArrows.image_index = 0;
}

if (memoview == true && memotimer >= 11)
{
    if (keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X")))
    {
        memoleave = true;
        
        if (!global.c3outskirtscompleted)
            audio_sound_gain(mus_wind, 10, 500);
        
        if (global.c3outskirtscompleted)
        {
            audio_sound_gain(mus_broadcastworld, 1, 500);
            audio_sound_gain(mus_wind, 0, 500);
        }
    }
}

if (memoleave && memoleavetimer < 11)
{
    memoleavetimer++;
    oBlackScreenMemoChapter3Menu.image_alpha -= 0.1;
    oDepthsDim.image_alpha -= 0.1;
    oChapter3Memo1.image_alpha -= 0.1;
    oChapter3Memo2.image_alpha -= 0.1;
    obj_Chapter3Memo3.image_alpha -= 0.1;
    obj_Chapter3Memo3_2.image_alpha -= 0.1;
    obj_Chapter3Memo4.image_alpha -= 0.1;
    obj_Chapter3Memo5.image_alpha -= 0.1;
    obj_Chapter3Memo6.image_alpha -= 0.1;
    obj_Chapter3Memo7.image_alpha -= 0.1;
    obj_Chapter3Memo8.image_alpha -= 0.1;
    obj_Chapter3Memo9.image_alpha -= 0.1;
    obj_Chapter3Memo10.image_alpha -= 0.1;
    obj_Chapter3Memo11.image_alpha -= 0.1;
    obj_Chapter3Memo12.image_alpha -= 0.1;
    obj_Chapter3Memo13.image_alpha -= 0.1;
    obj_Chapter3Memo14.image_alpha -= 0.1;
    obj_Chapter3Memo15.image_alpha -= 0.1;
    obj_Chapter3Memo16.image_alpha -= 0.1;
    obj_Chapter3Memo17.image_alpha -= 0.1;
    oMemoArrows.image_alpha -= 0.1;
}

if (memoleavetimer == 11)
{
    instance_destroy(oBlackScreenMemoChapter3Menu);
    instance_destroy(oDepthsDim);
    instance_destroy(oChapter3Memo1);
    instance_destroy(oChapter3Memo2);
    instance_destroy(obj_Chapter3Memo3);
    instance_destroy(obj_Chapter3Memo3_2);
    instance_destroy(obj_Chapter3Memo4);
    instance_destroy(obj_Chapter3Memo5);
    instance_destroy(obj_Chapter3Memo6);
    instance_destroy(obj_Chapter3Memo7);
    instance_destroy(obj_Chapter3Memo8);
    instance_destroy(obj_Chapter3Memo9);
    instance_destroy(obj_Chapter3Memo10);
    instance_destroy(obj_Chapter3Memo11);
    instance_destroy(obj_Chapter3Memo12);
    instance_destroy(obj_Chapter3Memo13);
    instance_destroy(obj_Chapter3Memo14);
    instance_destroy(obj_Chapter3Memo15);
    instance_destroy(obj_Chapter3Memo16);
    instance_destroy(obj_Chapter3Memo17);
    instance_destroy(oMemoArrows);
    menuaccessible = true;
    memoleave = false;
    memoview = false;
    memoleavetimer = 0;
}

if (selectoption == 1)
{
    if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && menuaccessible)
    {
        leave = true;
        menuaccessible = false;
    }
    
    if (leave)
    {
        leavetimer++;
        audio_sound_gain(mus_wind, 0, 500);
        audio_sound_gain(mus_broadcastworld, 0, 500);
        
        if (leavetimer == 1)
            instance_create_depth(320, 240, -50, oBlackScreenLeaveChapter3Menu);
        
        if (leavetimer == 60)
        {
            audio_stop_all();
            
            if (column == 0)
                room_goto(rCh3OpeningCinematic);
            else
                room_goto(rm_ch3_planegate);
        }
    }
}

if (selectoption == 2)
{
    if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && menuaccessible)
    {
        leave = true;
        menuaccessible = false;
    }
    
    if (leave)
    {
        leavetimer++;
        audio_sound_gain(mus_wind, 0, 500);
        audio_sound_gain(mus_broadcastworld, 0, 500);
        
        if (leavetimer == 1)
            instance_create_depth(320, 240, -50, oBlackScreenLeaveChapter3Menu);
        
        if (leavetimer == 60)
        {
            audio_stop_all();
            
            if (column == 0)
                room_goto(rSusieDadTalk);
            else
                room_goto(rm_ch3_primflower);
        }
    }
}

if (selectoption == 3)
{
    if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && menuaccessible)
    {
        leave = true;
        menuaccessible = false;
    }
    
    if (leave)
    {
        leavetimer++;
        audio_sound_gain(mus_wind, 0, 500);
        audio_sound_gain(mus_broadcastworld, 0, 500);
        
        if (leavetimer == 1)
            instance_create_depth(320, 240, -50, oBlackScreenLeaveChapter3Menu);
        
        if (leavetimer == 60)
        {
            audio_stop_all();
            
            if (column == 0)
                room_goto(rChapter3KreidRoom);
            else
                room_goto(rm_ch3_maximike_prelude);
        }
    }
}

if (selectoption == 4)
{
    if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && menuaccessible)
    {
        leave = true;
        menuaccessible = false;
    }
    
    if (leave)
    {
        leavetimer++;
        audio_sound_gain(mus_wind, 0, 500);
        audio_sound_gain(mus_broadcastworld, 0, 500);
        
        if (leavetimer == 1)
            instance_create_depth(320, 240, -50, oBlackScreenLeaveChapter3Menu);
        
        if (leavetimer == 60)
        {
            audio_stop_all();
            
            if (column == 0)
                room_goto(rShadowBar);
            else
                room_goto(rm_ch3_foanepath);
        }
    }
}

if (selectoption == 5)
{
    if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && menuaccessible)
    {
        leave = true;
        menuaccessible = false;
    }
    
    if (leave)
    {
        leavetimer++;
        audio_sound_gain(mus_wind, 0, 500);
        audio_sound_gain(mus_broadcastworld, 0, 500);
        
        if (leavetimer == 1)
            instance_create_depth(320, 240, -50, oBlackScreenLeaveChapter3Menu);
        
        if (leavetimer == 30)
        {
            audio_stop_all();
            
            if (column == 0)
                room_goto(rm_ch3_spacechannel_1);
            else
                room_goto(rm_ch3_epilogue);
        }
    }
}
