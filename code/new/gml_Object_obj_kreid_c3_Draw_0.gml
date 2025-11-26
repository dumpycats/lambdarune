var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (slamtimer >= 18)
{
    draw_sprite_ext(sWhiteScreen, 0, cx + 320, cy + 240, 3, 3, 0, c_white, impactalpha);
    impactalpha -= 0.05;
}

draw_self();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (kreidslam)
{
    slamtimer++;
    
    if (slamtimer == 0)
    {
        image_index = 0;
        sprite_index = spr_kreid_slam;
    }
    
    if (slamtimer == 18)
    {
        audio_play_sound(snd_impact, 1, false, 1.2);
        audio_play_sound(snd_car_doorslam_reverb, 1, false, 1.5);
        audio_play_sound(snd_closet_impact, 1, false, 1.3, false, 0.8);
        obj_plane_kf.image_index = 1;
        obj_plane_kf.explosion = true;
        var n = 10;
        yoffset += (n + 12);
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 21)
    {
        audio_play_sound(snd_break1, 1, false);
        var n = -20;
        yoffset += n;
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 24)
    {
        var n = 15;
        yoffset += n;
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 27)
    {
        var n = -10;
        yoffset += n;
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 30)
    {
        var n = 8;
        yoffset += n;
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 33)
    {
        var n = -6;
        yoffset += n;
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 36)
    {
        var n = 5;
        yoffset += n;
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 39)
    {
        var n = -3;
        yoffset += n;
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 42)
    {
        var n = 1;
        yoffset += n;
        obj_kris_c3.yoffset += n;
        obj_plane_kf.y += n;
    }
    
    if (slamtimer == 33)
        image_speed = 0;
    
    if (slamtimer == 63)
    {
        image_speed = 1;
        image_index = 0;
        sprite_index = spr_kreid_slam_flash;
        audio_play_sound(mus_sfx_eyeflash, 1, false, 0.5);
    }
    
    if (slamtimer >= 90 && slamtimer <= 110)
    {
        obj_bulletboard_kf.boxalpha += 0.05;
        obj_SOUL_battle.image_alpha += 0.05;
        obj_bulletboard_kf.boxalpha = clamp(obj_bulletboard_kf.boxalpha, 0, 1);
        obj_SOUL_battle.image_alpha = clamp(obj_SOUL_battle.image_alpha, 0, 1);
    }
    
    if (slamtimer == 112)
        audio_play_sound(mus_cymbalshort, 1, false);
    
    if (slamtimer == 143)
        instance_create_depth(obj_SOUL_battle.x, obj_SOUL_battle.y, obj_SOUL_battle.depth - 15, obj_soulcover_1);
    
    if (slamtimer == 178)
    {
        audio_sound_gain(mus_kreidfight, 1, 3000);
        audio_sound_pitch(mus_kreidfight, 0.985);
    }
    
    if (slamtimer == 188)
    {
        instance_destroy(obj_soulcover_1);
        obj_bulletboard_kf.manualend = true;
        obj_kreid_c3.sprite_index = spr_kreid_rage;
        obj_kreid_c3.xoffset = 8;
        obj_kreid_c3.yoffset = 0;
    }
    
    if (slamtimer == 189)
        obj_kreid_c3.xoffset = -8;
    
    if (slamtimer == 190)
        obj_kreid_c3.xoffset = 5;
    
    if (slamtimer == 191)
        obj_kreid_c3.xoffset = -5;
    
    if (slamtimer == 192)
        obj_kreid_c3.xoffset = 2;
    
    if (slamtimer == 193)
        obj_kreid_c3.xoffset = -2;
    
    if (slamtimer == 194)
        obj_kreid_c3.xoffset = 1;
    
    if (slamtimer == 195)
        obj_kreid_c3.xoffset = -1;
    
    if (slamtimer == 196)
        obj_kreid_c3.xoffset = 0;
}

if (sprite_index == spr_kreid_jump && image_index >= 3)
{
    if (!audio_is_playing(snd_spearrise))
        audio_play_sound(snd_spearrise, 1, false);
}

if (instance_exists(obj_battle_kf))
{
    if (obj_battle_kf.krismercy)
    {
        flashcolor = 65535;
        flashpercent += (1/30);
        
        if (flashpercent <= 0.5)
        {
            flashalpha += 0.016666666666666666;
        }
        else
        {
            flashalpha -= 0.016666666666666666;
            flashalpha = clamp(flashalpha, 0, 1);
        }
    }
    else
    {
        flashpercent = 0;
        flashcolor = 16777215;
    }
}
