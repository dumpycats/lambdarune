var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_sprite_ext(sprite_index, image_index, cx + 320, y, image_xscale, image_yscale, 0, c_white, image_alpha);
timer++;

if (!global.alldown)
{
    if (clampalpha)
    {
        image_alpha -= 0.025;
        image_alpha = clamp(image_alpha, 0, 1);
        
        if (image_alpha <= 0)
            clampalpha = false;
    }
    
    if (timer == 0)
    {
        image_alpha = 1/3;
        audio_play_sound(snd_bombfall, 1, false);
        clampalpha = false;
    }
    else if (timer == 2)
    {
        clampalpha = true;
    }
    
    if (timer == 15)
    {
        image_alpha = 1/3;
        audio_play_sound(snd_bombfall, 1, false);
        clampalpha = false;
    }
    else if (timer == 17)
    {
        clampalpha = true;
    }
    
    if (timer == 45)
    {
        image_alpha = 1/3;
        audio_play_sound(snd_bombfall, 1, false);
        clampalpha = false;
    }
    else if (timer == 47)
    {
        clampalpha = true;
    }
    
    if (timer == 49)
    {
        image_alpha = 0.5;
        audio_play_sound(snd_bombfall, 1, false);
        clampalpha = false;
    }
    else if (timer == 51)
    {
        audio_play_sound(snd_lilhit, 1, false, 0.2);
        image_alpha = 1;
        image_index = 2;
        instance_create_depth(340, 190, depth - 5, obj_middleblock_white);
    }
}

if (image_index == 2 && !global.alldown)
{
    image_alpha = 0;
    var num_bars = 32;
    var bar_width = 143 / num_bars;
    var ax = x - 71;
    var ay = y;
    
    for (var i = 0; i < num_bars; i++)
    {
        var bar_height = random_range(1, 18);
        
        if (!global.alldown)
        {
            gain = audio_sound_get_gain(mus_tennasiblings_boss);
            bar_height *= gain;
        }
        
        var bar_x = ax + (i * bar_width);
        draw_rectangle_color(bar_x, ay - bar_height, (bar_x + bar_width) - 2, ay + bar_height, c_white, c_white, c_white, c_white, false);
    }
    
    if (instance_exists(obj_bulletboard_sio))
    {
        if (place_meeting(x, y, obj_SOUL_battle_sio) && image_index == 2 && !hit)
        {
            obj_SOUL_battle_sio.hurt = true;
            hit = true;
        }
    }
    
    if (hit)
    {
        hittimer++;
        
        if (hittimer == 15)
        {
            hit = false;
            hittimer = -1;
        }
    }
    
    if (place_meeting(x, y, obj_SOUL_TP_sio) && !obj_SOUL_battle_sio.hurt && image_alpha > 0.6 && !hit)
    {
        tptimer++;
        
        if (tptimer == 1)
            obj_SOUL_TP_sio.add = true;
        
        if (tptimer == 6)
            tptimer = 0;
    }
}
