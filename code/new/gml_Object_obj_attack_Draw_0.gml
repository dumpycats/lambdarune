var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var advance;

if (inputtimer >= 0)
    advance = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
else
    advance = 0;

if (advance)
{
    image_index = 0;
    image_speed = 1;
}

inputtimer++;
timer++;
draw_sprite_ext(spr_attackseparators, 0, cx + 152, cy + 441, 1, 1, 0, c_white, image_alpha);

if (kris)
{
    draw_sprite_ext(spr_krismenu_attack, image_index, cx + 151, cy + 403, 1, 1, 0, c_white, image_alpha);
    
    if (timer == 0)
    {
        krisspawn = instance_create_depth(targetk, cy + 384, depth - 2, obj_target);
        krisspawn.kris = true;
    }
    
    if (timer > 0 && !krishit)
        targetk = (cx + onerandom) - (8 * timer);
    
    if (krishittimer == 40)
    {
        if (battle_kf)
        {
            if (global.turn <= 7)
            {
                obj_kreid_c3.sprite_index = spr_kreid_idle;
                obj_kreid_c3.image_speed = 1;
            }
            else
            {
                obj_kreid_c3.sprite_index = spr_kreid_rage;
                obj_kreid_c3.image_speed = 1;
            }
        }
    }
    
    if (krishittimer == 50)
    {
        obj_kris_c3.sprite_index = spr_kris_idle;
        obj_kris_c3.image_speed = 1;
        krischoicedamage.trigger = true;
        
        if (battle_kf)
        {
            obj_battle_kf.krisfight = false;
            obj_battle_kf.textmenu = false;
            
            if (global.enemyhp > 0)
                obj_battle_kf.textenemy = true;
            else if (!instance_exists(DEVICE_OUTLAW_WARNING))
                instance_create_depth(cx + 320, cy + 240, -6666, DEVICE_OUTLAW_WARNING);
        }
        
        reset_dialogue_normal();
        endingtransition = true;
    }
}
else if (kris && susie)
{
}
else if (kris && ralsei)
{
}
else if (susie)
{
}
else if (susie && kris)
{
}
else if (susie && ralsei)
{
}
else if (ralsei)
{
}
else if (ralsei && kris)
{
}
else if (ralsei && susie)
{
}
else if (kris && ralsei && susie)
{
}

if (timer > 0 && !krishit)
{
    if (kris)
        krisspawn.x = targetk;
    
    if ((timer % 2) == 0 && !krismiss)
        instance_create_depth(krisspawn.x, krisspawn.y, krisspawn.depth + 1, obj_target_echo);
}

if (krismiss)
    krisdamage = 0;
else if (targetk <= (cx + 199) && targetk > (cx + 87))
    krisdamage = round(150 + (((targetk - (cx + 87)) / ((cx + 199) - (cx + 87))) * -70));
else if (targetk < (cx + 87))
    krisdamage = round(60 + (((targetk - (cx + 50)) / ((cx + 87) - (cx + 50))) * 90));
else
    krisdamage = 165;

if (targetk <= (cx + 199) && targetk > (cx + 55) && advance && !krishit)
{
    if (!audio_is_playing(snd_laz))
    {
        audio_sound_pitch(snd_laz, 1);
        audio_play_sound(snd_laz, 1, false);
    }
    
    krishit = true;
    
    if (targetk == (cx + 87))
    {
        instance_create_depth(obj_kris_c3.x, obj_kris_c3.y, obj_kris_c3.depth - 2, obj_attackshine);
        krisspawn.image_blend = c_yellow;
        
        if (!audio_is_playing(snd_criticalswing))
            audio_play_sound(snd_criticalswing, 1, false, 0.8);
    }
    else
    {
        krisspawn.image_blend = kriscolor;
    }
    
    obj_kris_c3.image_speed = 1;
}
else if (targetk == (cx + 55))
{
    obj_kris_c3.image_speed = 1;
    krismiss = true;
    krishit = true;
}

if (krismiss)
{
    krisspawn.image_alpha -= 1/3;
    
    if (krisspawn.image_alpha == (2/3))
    {
        audio_sound_pitch(snd_laz, 1);
        audio_play_sound(snd_laz, 1, false);
    }
}

if (krishit)
{
    krishittimer++;
    
    if (krishittimer == 12 && !krismiss)
    {
        if (battle_kf)
        {
            obj_battle_kf.krisbattleicon = 0;
            obj_kreid_c3.sprite_index = spr_kreid_hurt;
            global.enemyhp -= krisdamage;
            var krishitchoice = instance_create_depth(krischoice.x, krischoice.y, krischoice.depth - 2, obj_hitanimation);
            krishitchoice.sprite_index = spr_krishit;
            krishitchoice.scale = 2;
        }
        
        if (krisspawn.image_blend == c_yellow)
            global.tp += 6;
        
        audio_play_sound(snd_damage, 1, false);
    }
    else if (battle_kf)
    {
        obj_battle_kf.krisbattleicon = 0;
    }
    
    if (!krismiss)
    {
        switch (krishittimer)
        {
            case 12:
                krischoice.xoffset += 9;
                break;
            case 13:
                krischoice.xoffset -= 17;
                break;
            case 15:
                krischoice.xoffset += 15;
                break;
            case 17:
                krischoice.xoffset -= 13;
                break;
            case 19:
                krischoice.xoffset += 11;
                break;
            case 21:
                krischoice.xoffset -= 9;
                break;
            case 23:
                krischoice.xoffset += 7;
                break;
            case 25:
                krischoice.xoffset -= 5;
                break;
            case 27:
                krischoice.xoffset += 3;
                break;
            case 29:
                krischoice.xoffset -= 1;
                break;
            default:
                break;
        }
    }
    
    if (krishittimer == 19)
    {
        krischoicedamage = instance_create_depth(krischoice.x, krischoice.y, krischoice.depth - 3, obj_damage);
        krischoicedamage.value = krisdamage;
        krischoicedamage.manual = true;
        krischoicedamage.image_blend = kriscolor;
        
        if (krismiss)
            krischoicedamage.miss = true;
    }
    
    krisspawn.image_xscale += 0.1;
    krisspawn.image_yscale += 0.1;
    krisspawn.image_alpha -= 0.1;
    
    if (obj_kris_c3.image_index >= 7 && !endingtransition)
        obj_kris_c3.image_speed = 0;
}

if (endingtransition)
{
    image_alpha -= 0.08333333333333333;
    
    if (image_alpha < 0)
        instance_destroy();
}
