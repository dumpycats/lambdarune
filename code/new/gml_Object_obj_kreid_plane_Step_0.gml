var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (instance_exists(obj_plane_text))
{
    if (obj_plane_text.dialogue < 24)
        depth = -y - 10;
    else if (obj_plane_text.dialogue == 26)
        depth = obj_kris_plane.depth - 2;
}

if (move1)
{
    percent1 += 0.0125;
    var position1 = animcurve_channel_evaluate(curvelinear, percent1);
    
    if (percent1 <= 1)
    {
        var delta_x = (cx + 480) - (cx + 680);
        x = cx + 680 + (delta_x * position1);
    }
    
    if (percent1 == 1)
    {
        image_index = 0;
        image_speed = 0;
    }
    
    if (percent1 == 1.375)
    {
        obj_plane_text.talking = true;
        obj_plane_text.dialogue = 11;
        
        with (obj_plane_text)
            reset_dialogue_normal();
    }
}

if (kreidnut)
{
    nuttimer++;
    
    if (nuttimer == 0)
        image_speed = 1;
    
    if (nuttimer == 8)
    {
        audio_play_sound(snd_ultraswing, 1, false);
        instance_create_depth(obj_kreid_plane.x + 25, obj_kreid_plane.y - 26, obj_kreid_plane.depth, obj_peanuts);
    }
    
    if (nuttimer == 40)
    {
        obj_plane_chair_alt.image_index = 4;
        audio_play_sound(snd_noise, 1, false);
        audio_play_sound(snd_mercyadd, 1, false);
        begone = true;
        obj_kris_plane.sprite_index = sKrisWalkUp;
        obj_kris_plane.image_index = 0;
        obj_kris_plane.x += 38;
        obj_kris_plane.y -= 6;
        obj_susie_plane.sprite_index = sSusieSpin;
        obj_susie_plane.image_speed = 1;
        obj_ralsei_plane.sprite_index = sRalseiShocked;
    }
    
    if (nuttimer == 55)
    {
        obj_plane_text.talking = true;
        obj_plane_text.dialogue = 19;
        
        with (obj_plane_text)
            reset_dialogue_normal();
    }
}

if (obj_plane_text.kreidtokris)
{
    percent2 += 0.025;
    var position1 = animcurve_channel_evaluate(curvelinear, percent2);
    
    if (percent2 <= 1)
    {
        var delta_x = (obj_kris_plane.x + 40) - (cx + 480);
        x = cx + 480 + (delta_x * position1);
    }
    
    if (percent2 == 0.025)
        image_speed = 0.75;
    
    if (percent2 == 1)
    {
        image_index = 0;
        image_speed = 0;
    }
    
    if (percent2 == 1.5)
    {
        obj_plane_text.talking = true;
        obj_plane_text.dialogue = 26;
        
        with (obj_plane_text)
            reset_dialogue_normal();
    }
}
