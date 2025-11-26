var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!triggered)
    image_alpha += 0.1;
else
    image_alpha -= 0.1;

percent1++;

if (percent1 <= 15)
{
    var position = animcurve_channel_evaluate(curveslower, percent1 / 15);
    image_yscale = lerp(0, 1, position);
}

image_alpha = clamp(image_alpha, 0, 1);
draw_set_alpha(1);
draw_self();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (!(interacttimer >= 30 && right))
{
    shader_set(sh_wavewarp);
    var tex1 = sprite_get_texture(spr_harmonize_1, 6);
    var uvs1 = sprite_get_uvs(spr_harmonize_1, 6);
    shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_time"), current_time / 1000);
    shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_amplitude"), 0.0015 + ampboost);
    shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_frequency"), 100);
    shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_speed"), 0.7 * speedboost);
    shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_rainbow_speed"), 0);
    shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_saturation"), 1);
    shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_uv_top_left"), uvs1[0], uvs1[1]);
    shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_uv_bottom_right"), uvs1[2], uvs1[3]);
    texture_set_stage(0, tex1);
    shader_set_uniform_i(shader_get_uniform(sh_wavewarp, "u_texture"), 0);
}

if (global.harmonyphase == 2 && !(interacttimer >= 30 && right))
{
    draw_sprite_ext(spr_harmonize_1, 6, cx + 190, cy + 116, 1, 1, 0, c_white, image_alpha);
    draw_sprite_ext(spr_harmonize_1, 6, cx + 190, cy + 116, 1, 1, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(spr_harmonize_split_3, harmonysplit, cx + 190, cy + 116, 1, 1, 0, c_white, image_alpha);
    draw_sprite_ext(spr_harmonize_split_3, harmonysplit, cx + 190, cy + 116, 1, 1, 0, c_white, image_alpha);
    harmonysplit += (2/3);
    harmonysplit = clamp(harmonysplit, 0, 5);
}

shader_reset();

if (interacting)
{
    interacttimer++;
    ampboost -= 0.0001;
    ampboost = clamp(ampboost, -0.0015, 0);
    
    if (interacttimer == 0)
    {
        global.harmonyfrequency = 22050;
        obj_battle_sof.effect.cutoff = global.harmonyfrequency;
        
        if (right)
        {
            flashcolor = 255;
            obj_harmonize_goal.blend = 65280;
            obj_harmonize_goal.image_blend = c_white;
            obj_harmonize_goal.triggered = true;
            global.harmonized = true;
        }
        else
        {
            flashcolor = 16777215;
            obj_harmonize_goal.blend = 255;
            obj_harmonize_goal.triggered = true;
        }
        
        flashalpha = 1;
    }
    
    if (interacttimer == 1)
    {
        if (right)
            audio_play_sound(snd_bell, 1, false, 1, false, 1);
        else
            audio_play_sound(snd_bell, 1, false, 1, false, 0.8);
    }
    
    if (interacttimer > 2)
    {
        flashalpha -= (1/15);
        percent2++;
        
        if (percent2 <= 15)
        {
            var position2 = animcurve_channel_evaluate(curveease, percent2 / 15);
            image_yscale = lerp(1, 0, position2);
        }
    }
    
    if (interacttimer == 3)
        obj_SOUL_battle_sof.moving = false;
    
    if (interacttimer == 30 && right)
        audio_play_sound(mus_sfx_swipe, 1, false, 0.5);
    
    if (interacttimer == 45)
    {
        if (right)
            global.harmonyphase++;
        
        with (obj_bulletboard_sof)
        {
            obj_bulletboard_sof.sprite_index = spr_bulletboard_harmonize;
            alpha = 1;
            spawn = false;
            SOUL.ending = true;
            
            if (instance_exists(obj_harmonize_goal))
                instance_destroy(obj_harmonize_goal);
            
            if (instance_exists(obj_harmonize_string_1))
                instance_destroy(obj_harmonize_string_1);
            
            if (instance_exists(obj_harmonize_string_2))
                instance_destroy(obj_harmonize_string_2);
            
            if (instance_exists(obj_harmonize_string_3))
                instance_destroy(obj_harmonize_string_3);
            
            if (instance_exists(obj_harmonize_string_4))
                instance_destroy(obj_harmonize_string_4);
            
            if (instance_exists(obj_harmonize_string_5))
                instance_destroy(obj_harmonize_string_5);
            
            if (instance_exists(obj_harmonize_string_6))
                instance_destroy(obj_harmonize_string_6);
            
            if (instance_exists(obj_harmonize_string_7))
                instance_destroy(obj_harmonize_string_7);
            
            if (instance_exists(obj_harmonize_string_8))
                instance_destroy(obj_harmonize_string_8);
            
            if (instance_exists(obj_harmonize_string_9))
                instance_destroy(obj_harmonize_string_9);
            
            if (instance_exists(obj_harmonize_string_10))
                instance_destroy(obj_harmonize_string_10);
            
            if (instance_exists(obj_harmonize_string_11))
                instance_destroy(obj_harmonize_string_11);
            
            if (instance_exists(obj_harmonize_string_12))
                instance_destroy(obj_harmonize_string_12);
            
            if (instance_exists(obj_harmonize_string_13))
                instance_destroy(obj_harmonize_string_13);
            
            if (instance_exists(obj_harmonize_string_14))
                instance_destroy(obj_harmonize_string_14);
            
            if (instance_exists(obj_harmonize_string_15))
                instance_destroy(obj_harmonize_string_15);
            
            global.harmonizing = false;
        }
    }
}
