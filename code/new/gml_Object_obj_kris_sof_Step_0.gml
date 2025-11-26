var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!(room == rm_ch3_sof_skip) && !(room == rm_ch3_sof))
    depth = -y;

if (room == rm_ch3_sof)
{
    if (falldown)
    {
        timerdown++;
        
        if (timertrigger2)
            timerdown2++;
        
        if (timertrigger3)
            timerdown3++;
        
        if (timerdown == 85)
        {
            with (obj_foane_ex_prebattle)
            {
                talking = true;
                dialogue = 2;
                reset_dialogue_normal();
            }
        }
        
        percentdown3++;
        
        if (percentdown <= 20)
        {
            sprite_index = spr_krisroll;
            image_speed = 1;
            var position = animcurve_channel_evaluate(curvefaster, percentdown / 20);
            y = lerp(-10, 144, position);
        }
        
        if (percentdown == 21)
        {
            y = 144;
            image_index = 0;
            image_speed = 0;
            sprite_index = spr_krisland;
            audio_play_sound(snd_impact, 1, false, 0.7);
        }
        
        if (percentdown == 31)
            image_index = 1;
        
        if (percentdown3 >= 6)
            percentdown2++;
        
        if (percentdown2 <= 25)
        {
            obj_susie_sof.sprite_index = spr_susieroll;
            obj_susie_sof.image_speed = 1;
            var position2 = animcurve_channel_evaluate(curvefaster, percentdown2 / 25);
            obj_susie_sof.y = lerp(-20, 194, position2);
        }
        
        if (percentdown2 == 26)
        {
            obj_susie_sof.y = 208;
            obj_susie_sof.sprite_index = spr_susieland;
            obj_susie_sof.image_index = 0;
            obj_susie_sof.image_speed = 0;
            audio_play_sound(snd_impact, 1, false, 0.7);
        }
        
        if (percentdown2 == 36)
            obj_susie_sof.image_index = 1;
        
        if (percentdown2 >= 10)
            percentdown++;
        
        if (percentdown3 <= 25)
        {
            obj_ralsei_sof.sprite_index = spr_ralseiroll;
            obj_ralsei_sof.image_speed = 1;
            var position3 = animcurve_channel_evaluate(curvefaster, percentdown3 / 25);
            obj_ralsei_sof.y = lerp(-20, 280, position3);
        }
        
        if (percentdown3 == 26)
        {
            obj_ralsei_sof.y = 290;
            obj_ralsei_sof.sprite_index = spr_ralseiland;
            obj_ralsei_sof.image_index = 0;
            obj_ralsei_sof.image_speed = 0;
            audio_play_sound(snd_impact, 1, false, 0.7);
        }
        
        if (percentdown3 == 31)
            obj_ralsei_sof.image_index = 1;
        
        if (timerdown == 70)
        {
            obj_kris_sof.sprite_index = sKrisWalkRight;
            obj_susie_sof.sprite_index = sSusieWalkRightUpset;
            obj_ralsei_sof.sprite_index = sRalseiWalkRightUpset;
            obj_kris_sof.image_index = 0;
            obj_susie_sof.image_index = 0;
            obj_ralsei_sof.image_index = 0;
            obj_susie_sof.x += 10;
            obj_kris_sof.x -= 8;
        }
        
        if (timerdown2 >= 0)
        {
            percentdown4++;
            
            if (percentdown4 == 2)
                audio_play_sound(snd_chain_extend, 1, true, 0.5, false, 0.9);
            
            if (percentdown4 <= 50)
            {
                var positionx = animcurve_channel_evaluate(curveslower, percentdown4 / 50);
                obj_foane_ex_battle.y = lerp(0, 256, positionx);
            }
            
            if (percentdown4 >= 40)
            {
                if (instance_exists(obj_string_c3_fall))
                    obj_string_c3_fall.image_alpha -= 0.1;
            }
            
            if (percentdown4 == 49)
            {
                audio_stop_sound(snd_chain_extend);
                obj_foane_ex_battle.sprite_index = spr_foane_ex_idle_off;
                obj_foane_ex_battle.image_index = 0;
                obj_foane_ex_battle.smallshake = true;
                obj_foane_ex_battle.smallshaketimer = -1;
                obj_foane_ex_battle.trigger = true;
                audio_play_sound(snd_noise, 1, false, 1, false, 0.9);
            }
            
            if (percentdown4 == 80)
            {
                with (obj_foane_ex_prebattle)
                {
                    talking = true;
                    dialogue = 7;
                    reset_dialogue_normal();
                }
            }
        }
    }
    
    if (timerdown3 >= 0)
    {
        obj_foane_background_final.moving = true;
        obj_foane_background_final.trigger = true;
    }
    
    if (timerdown3 == 0)
    {
        xx = x;
        yy = y;
        xxs = obj_susie_sof.x;
        yys = obj_susie_sof.y;
        xxr = obj_ralsei_sof.x;
        yyr = obj_ralsei_sof.y;
    }
    
    if (timerdown3 == 40)
    {
        obj_foane_ex_battle.sprite_index = obj_foane_ex_battle.MAINSPRITE;
        obj_kris_sof.battlestart = true;
    }
}

if (room == rm_ch3_screenroom)
{
    percent1++;
    var position = animcurve_channel_evaluate(curvelinear, percent1 / 60);
    
    if (percent1 <= 60)
    {
        y = lerp(1940, 1680, position);
        MEMBER2.y = lerp(2006, 1746, position);
        MEMBER3.y = lerp(2060, 1800, position);
    }
    
    if (percent1 == 60)
    {
        image_speed = 0;
        image_index = 0;
        MEMBER2.image_speed = 0;
        MEMBER2.image_index = 0;
        MEMBER3.image_speed = 0;
        MEMBER3.image_index = 0;
        obj_foane_ex.talking = true;
    }
}

if (instance_exists(ENGINE))
{
    if (global.alldown)
    {
        image_speed = 0;
        exit;
    }
}

if (room == rm_ch3_sof_skip && battlepercent == 0)
{
    xx = x;
    yy = y;
    xxs = MEMBER2.x;
    yys = MEMBER2.y;
    xxr = MEMBER3.x;
    yyr = MEMBER3.y;
}

if (battlestart)
{
    battlepercent += 0.1;
    var battleposition = animcurve_channel_evaluate(curvelinear, battlepercent);
    
    if (battlepercent == 0.1)
        sprite_index = spr_kris_flyup;
    
    if (battlepercent <= 1)
    {
        x = lerp(xx, cx + 132, battleposition);
        y = lerp(yy, cy + 120, battleposition);
        var a = instance_create_depth(x, y, depth + 3, obj_kris_sof_echo);
        a.TARGET = self;
        MEMBER2.x = lerp(xxs, cx + 118, battleposition);
        MEMBER2.y = lerp(yys, cy + 178, battleposition);
        var b = instance_create_depth(MEMBER2.x, MEMBER2.y, MEMBER2.depth + 3, obj_susie_sof_echo);
        b.TARGET = obj_susie_sof;
        MEMBER3.x = lerp(xxr, cx + 140, battleposition);
        MEMBER3.y = lerp(yyr, cy + 270, battleposition);
        var c = instance_create_depth(MEMBER3.x, MEMBER3.y, MEMBER3.depth + 3, obj_ralsei_sof_echo);
        c.TARGET = obj_ralsei_sof;
    }
    
    if (battlepercent == 1)
    {
        image_index = 1;
        sprite_index = spr_kris_fight;
        image_speed = 1;
        MEMBER3.image_speed = 1;
        MEMBER3.image_index = 0;
        MEMBER3.sprite_index = spr_ralsei_begin;
        MEMBER2.image_speed = 1;
        MEMBER2.image_index = 0;
        MEMBER2.sprite_index = spr_susie_attack;
        audio_play_sound(snd_weaponpull_fast, 1, false);
    }
    
    if (battlepercent == 2.3)
    {
        obj_susie_sof.image_index = 2;
        image_speed = 0;
    }
    
    if (battlepercent == 2.5)
    {
        sprite_index = spr_kris_idle;
        image_speed = 1;
        global.battle = true;
        battlestart = false;
        instance_create_depth(cx + 320, cy + 240, -480, obj_battle_sof);
        obj_foane_background_final.flicker = 1;
    }
}
