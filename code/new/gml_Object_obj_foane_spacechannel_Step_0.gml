var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (turn)
{
    turntimer++;
    
    if (turntimer == 0)
    {
        if (instance_exists(obj_spacechannel_screen1))
            instance_destroy(obj_spacechannel_screen1);
        
        if (instance_exists(obj_spacechannel_screen2))
            instance_destroy(obj_spacechannel_screen2);
        
        if (instance_exists(obj_spacechannel_screen3))
            instance_destroy(obj_spacechannel_screen3);
        
        image_speed = 0;
    }
    
    if (turntimer == 15)
        sprite_index = spr_foane_turning;
    
    if (turntimer == 45)
        sprite_index = spr_foane_turnback;
    
    if (turntimer == 75)
    {
        window_set_caption(translation_get_string("gml_Object_obj_foane_spacechannel_Step_0_0"));
        audio_sound_gain(mus_broadcast_error, 1, 0);
        audio_play_sound(mus_broadcast_error, 1, true, 0.6);
    }
    
    if (turntimer == 133)
    {
        global.dialogue = 1;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3_spacechannel4);
    }
}

if (global.dialogue == 40)
{
    timer++;
    
    if (timer == 1)
    {
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 320, cam_y + 240, -60, oTextC3_spacechannel5);
        global.dialogue = 1;
    }
}

if (sprite_index == spr_foane_yank)
{
    if (image_index >= 9)
    {
        yankingtimer++;
        
        if (yankingtimer == 0)
        {
            audio_play_sound(snd_noise, 1, false);
            audio_play_sound(snd_grab, 0.5, false);
        }
    }
    
    if (image_index >= 12)
    {
        image_speed = 0;
        yanktimer++;
        
        if (yanktimer == 45)
        {
            depth = obj_bench_c3.depth + 1;
            oTextC3_spacechannel5.d3timerend = 0;
        }
    }
}

if (timetogo)
{
    leavetimer++;
    
    if (leavetimer == 0)
        sprite_index = spr_foane_left;
    
    if (leavetimer < 40)
        x -= 2;
    
    if (x < 1290)
    {
        x = 1290;
        depth = obj_bench_c3.depth - 1;
        godown = true;
        sprite_index = spr_foane_down;
    }
    
    if (godown == true)
    {
        y += 2;
        
        if (y > 680)
        {
            y = 680;
            godown = false;
            goright = true;
        }
    }
    
    if (goright == true)
    {
        depth = oKrisPlayerC3.depth - 1;
        oKrisPlayerC3.sprite_index = sKrisWalkDown;
        sprite_index = spr_foane_right;
        x += 2;
        
        if (x > 1423)
        {
            x = 1423;
            goright = false;
            godown2 = true;
        }
    }
    
    if (godown2 == true)
    {
        sprite_index = spr_foane_down;
        audio_sound_gain(mus_broadcast_error, 0, 1200);
        y += 2;
    }
}

if (y > 1100)
    obj_cameracontroller.panup = true;
