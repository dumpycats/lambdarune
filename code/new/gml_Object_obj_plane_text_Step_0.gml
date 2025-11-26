var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
percent1 += 0.0033333333333333335;

if (percent1 == 1)
    talking = true;

if (whistle)
{
    percent2 += 0.016666666666666666;
    
    if (percent2 == 1)
    {
        reset_dialogue_normal();
        dialogue = 9;
        talking = true;
    }
}

if (reveal)
{
    obj_plane_shadowman.reveal = true;
    percent3 += (1/30);
    
    if (percent3 == (1/30))
    {
        audio_sound_gain(mus_midnightmeeting, 1, 0);
        audio_play_sound(mus_midnightmeeting, 1, true);
    }
    
    if (percent3 == 1)
    {
        susie1y = obj_susie_plane.y;
        ralsei1y = obj_ralsei_plane.y;
    }
    
    if (percent3 == 1.8333333333333333)
    {
        obj_plane_shadowman.sprite_index = spr_shadowman_idle;
        obj_plane_shadowman.image_speed = 1;
        obj_plane_shadowman.image_xscale = -1;
        obj_plane_shadowman.image_yscale = 1;
        obj_plane_shadowman.slightmove = true;
        obj_susie_plane.x = 330;
        obj_susie_plane.sprite_index = sSusieWalkUp;
        obj_susie_plane.image_index = 0;
        obj_ralsei_plane.x = 330;
        obj_ralsei_plane.sprite_index = sRalseiWalkUp;
        obj_ralsei_plane.image_index = 0;
        walkup = true;
        charactertalking = true;
        reset_dialogue_normal();
        dialogue = 10;
        talking = true;
    }
}

if (walkup)
{
    percent4 += (1/30);
    
    if (percent4 < 1)
    {
        obj_susie_plane.image_speed = 1;
        obj_ralsei_plane.image_speed = 1;
    }
    else if (percent4 < 3)
    {
        obj_susie_plane.image_speed = 0;
        obj_ralsei_plane.image_speed = 0;
        obj_susie_plane.image_index = 0;
        obj_ralsei_plane.image_index = 0;
    }
    
    var position1 = animcurve_channel_evaluate(curvelinear, percent4);
    var position2 = animcurve_channel_evaluate(curvelinear, (percent4 - 0.5) * 2);
    var delta_x1 = (cx + 360) - (cx + 330);
    var delta_x2 = (cx + 310) - (cx + 330);
    var delta_y1 = (cy + 282) - ralsei1y;
    var delta_y2 = (cy + 282) - susie1y;
    
    if (percent4 < 2)
    {
        obj_ralsei_plane.x = cx + 330 + (delta_x1 * position2);
        obj_ralsei_plane.yy = ralsei1y + (delta_y1 * position1);
        obj_susie_plane.x = cx + 330 + (delta_x2 * position2);
        obj_susie_plane.yy = susie1y + (delta_y2 * position1);
    }
}

if (waitbit)
{
    d20timer++;
    
    if (d20timer == 100)
    {
        audio_play_sound(snd_elecdoor_open, 1, false);
        audio_sound_gain(mus_wind, 1, 0);
        audio_play_sound(mus_wind, 1, true, 0.5, 0, 1.1);
    }
    
    if (d20timer == 125)
    {
    }
    
    if (d20timer == 135)
    {
        talking = true;
        dialogue = 21;
        reset_dialogue_normal();
    }
}

if (hit)
{
    hittimer++;
    
    if (hittimer == 0)
    {
        audio_play_sound(snd_damage, 1, false);
        obj_kris_plane.walkup2 = true;
    }
    
    if (hittimer == 3)
        audio_play_sound(snd_ralsei_yell, 1, false);
    
    if (hittimer == 45)
        audio_play_sound(snd_elecdoor_close, 1, false);
    else if (hittimer == 47)
        audio_stop_sound(mus_wind);
    
    if (hittimer == 80)
    {
        audio_play_sound(snd_elecdoor_open, 1, false);
        audio_play_sound(mus_wind, 1, true, 0.5, 0, 1.1);
    }
    
    if (hittimer == 90)
    {
        talking = true;
        dialogue = 22;
        reset_dialogue_normal();
    }
}

if (parachute)
{
    paratimer++;
    
    if (paratimer == 0)
        audio_play_sound(snd_jump_bc, 1, false, 0.5);
    
    if (paratimer == 70)
        obj_kris_plane.sprite_index = sKrisWalkRight;
    
    if (paratimer == 85)
    {
        talking = true;
        dialogue = 23;
        reset_dialogue_normal();
    }
}

if (kreidshove)
{
    shovetimer++;
    
    if (shovetimer == 0)
    {
        obj_kreid_plane.sprite_index = spr_kreid_angryshove;
        obj_kreid_plane.image_speed = 1;
    }
    
    if (shovetimer == 4)
    {
        obj_kreid_plane.image_speed = 0;
        talking = true;
        dialogue = 27;
        reset_dialogue_normal();
        obj_kris_plane.x -= 6;
        audio_play_sound(snd_impact, 1, false);
    }
    
    if (shovetimer == 5)
        obj_kris_plane.x -= 2;
    
    if (shovetimer == 6)
        obj_kris_plane.x -= 2;
}

if (firespawn)
{
    firetimer++;
    
    if (firetimer == 15)
    {
        instance_create_depth(obj_kris_plane.x, cy + 420, obj_kris_plane.depth - 10, obj_shadowfire);
        audio_play_sound(snd_noise, 1, false);
    }
    
    if (firetimer == 18)
        obj_shadowfire.image_alpha = 0;
    
    if (firetimer == 21)
    {
        obj_shadowfire.image_alpha = 1;
        audio_play_sound(snd_noise, 1, false);
    }
    
    if (firetimer == 24)
        obj_shadowfire.image_alpha = 0;
    
    if (firetimer == 27)
    {
        obj_shadowfire.image_alpha = 1;
        audio_play_sound(snd_noise, 1, false);
    }
    
    if (firetimer == 35)
        obj_shadowfire.flyup = true;
}
