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

if (hitnoise)
{
    hitnoisetimer++;
    
    if (hitnoisetimer == 0)
    {
        if (krishittimer == 0)
        {
            audio_sound_pitch(snd_laz, 1);
            audio_play_sound(snd_laz, 1, false);
        }
        else if (susiehittimer == 0)
        {
            audio_sound_pitch(snd_laz, 1);
            audio_play_sound(snd_laz, 1, false, 1, false, 0.9);
        }
        else if (ralseihittimer == 0)
        {
            audio_sound_pitch(snd_laz, 1);
            audio_play_sound(snd_laz, 1, false, 1, false, 1.1);
        }
    }
    
    if (hitnoisetimer == 4)
    {
        hitnoise = false;
        hitnoisetimer = -1;
    }
}

if (criticalnoise)
{
    criticalnoisetimer++;
    
    if (criticalnoisetimer == 0)
    {
        if (krishittimer == 0)
            audio_play_sound(snd_criticalswing, 1, false, 0.8);
        else if (susiehittimer == 0)
            audio_play_sound(snd_criticalswing, 1, false, 0.8);
        else if (ralseihittimer == 0)
            audio_play_sound(snd_criticalswing, 1, false, 0.8);
    }
    
    if (criticalnoisetimer == 4)
    {
        criticalnoise = false;
        criticalnoisetimer = -1;
    }
}

inputtimer++;
timer++;
draw_sprite_ext(spr_attackseparators, 0, cx + 152, cy + 441, 1, 1, 0, c_white, image_alpha);

if (kris)
    draw_sprite_ext(spr_krismenu_attack, image_index, cx + 151, cy + 403, 1, 1, 0, c_white, image_alpha);

if (susie)
    draw_sprite_ext(spr_susiemenu_attack, image_index, cx + 151, cy + 403, 1, 1, 0, c_white, image_alpha);

if (ralsei)
    draw_sprite_ext(spr_ralseimenu_attack, image_index, cx + 151, cy + 403, 1, 1, 0, c_white, image_alpha);

if (allhittimer == 52 || timer == 240)
{
    endingtransition = true;
    obj_damage_battle.trigger = true;
    
    if (kris)
    {
        ENGINE.krisfight = false;
        ENGINE.krisbattleicon = 0;
        krisobject.sprite_index = spr_kris_idle;
        krisobject.image_speed = 1;
    }
    
    if (susie)
    {
        ENGINE.susiefight = false;
        ENGINE.susiebattleicon = 0;
        susieobject.sprite_index = spr_susie_idle;
        susieobject.image_speed = 1;
    }
    
    if (ralsei)
    {
        ENGINE.ralseifight = false;
        ENGINE.ralseibattleicon = 0;
        ralseiobject.sprite_index = spr_ralsei_idle;
        ralseiobject.image_speed = 1;
    }
    
    ENGINE.progressfinal = true;
}

if (endingtransition)
{
    image_alpha -= 0.08333333333333333;
    
    if (image_alpha < 0)
        instance_destroy();
}

if (timer == 0)
{
    if (kris && susie && ralsei)
    {
        order = [3, 2, 1, 1, 2];
        targetpos = [559, 415, 319, 319, 415];
    }
    else if ((kris && susie) || (kris && ralsei) || (susie && ralsei))
    {
        order = [1, 2, 1, 2];
        targetpos = [319, 415, 319, 415];
    }
    else
    {
        order = [1, 1, 1];
        targetpos = [319, 319, 319];
    }
}

if (timer == 1)
{
    var active_members = [];
    target_instances = [];
    
    if (kris)
        array_push(active_members, "kris");
    
    if (susie)
        array_push(active_members, "susie");
    
    if (ralsei)
        array_push(active_members, "ralsei");
    
    var used_indices = [];
    
    for (var i = 0; i < array_length(active_members); i++)
    {
        var idx;
        
        repeat (10)
        {
            idx = irandom(array_length(order) - 1);
            
            if (!array_contains(used_indices, idx))
            {
                array_push(used_indices, idx);
                break;
            }
        }
        
        var x_offset = targetpos[idx];
        var order_value = order[idx];
        
        switch (active_members[i])
        {
            case "kris":
                var y_offset = 384;
                var target = instance_create_depth(cx + x_offset, cy + y_offset, depth - 10, obj_target_1);
                target.speed = -8;
                krisorder = order_value;
                array_push(target_instances, target);
                break;
            case "susie":
                var y_offset = 422;
                var target2 = instance_create_depth(cx + x_offset, cy + y_offset, depth - 10, obj_target_2);
                target2.speed = -8;
                susieorder = order_value;
                array_push(target_instances, target2);
                break;
            case "ralsei":
                var y_offset = 460;
                var target3 = instance_create_depth(cx + x_offset, cy + y_offset, depth - 10, obj_target_3);
                target3.speed = -8;
                ralseiorder = order_value;
                array_push(target_instances, target3);
                break;
        }
    }
    
    var sortable_targets = [];
    
    for (var i = 0; i < array_length(target_instances); i++)
    {
        var inst = target_instances[i];
        var priority;
        
        switch (inst.object_index)
        {
            case obj_target_1:
                priority = 0;
                break;
            case obj_target_2:
                priority = 1;
                break;
            case obj_target_3:
                priority = 2;
                break;
        }
        
        array_push(sortable_targets, [inst, inst.x, priority]);
    }
    
    array_sort(sortable_targets, function(arg0, arg1)
    {
        return (arg0[1] != arg1[1]) ? (arg0[1] - arg1[1]) : (arg0[2] - arg1[2]);
    });
    
    for (var i = 0; i < array_length(sortable_targets); i++)
    {
        var inst = sortable_targets[i][0];
        var order_number = i + 1;
        
        switch (inst.object_index)
        {
            case obj_target_1:
                krisorder = order_number;
                break;
            case obj_target_2:
                susieorder = order_number;
                break;
            case obj_target_3:
                ralseiorder = order_number;
                break;
        }
    }
}

if ((timer % 2) == 0 && !krismiss && !krishit && kris && !(timer == 0))
    instance_create_depth(obj_target_1.x, obj_target_1.y, obj_target_1.depth + 1, obj_target_echo);

if ((timer % 2) == 0 && !susiemiss && !susiehit && susie && !(timer == 0))
    instance_create_depth(obj_target_2.x, obj_target_2.y, obj_target_2.depth + 1, obj_target_echo);

if ((timer % 2) == 0 && !ralseimiss && !ralseihit && ralsei && !(timer == 0))
    instance_create_depth(obj_target_3.x, obj_target_3.y, obj_target_3.depth + 1, obj_target_echo);

if (advance && allhittimer < 2)
{
    var min_x = 999999;
    var eligible_targets = [];
    
    for (var i = 0; i < array_length(target_instances); i++)
    {
        var inst = target_instances[i];
        var tx = inst.x;
        
        if (tx <= (cx + 199) && tx > (cx + 55))
        {
            var already_hit = false;
            
            switch (inst.object_index)
            {
                case obj_target_1:
                    already_hit = krishit;
                    break;
                case obj_target_2:
                    already_hit = susiehit;
                    break;
                case obj_target_3:
                    already_hit = ralseihit;
                    break;
            }
            
            if (!already_hit)
            {
                if (tx < min_x)
                    min_x = tx;
            }
        }
    }
    
    for (var i = 0; i < array_length(target_instances); i++)
    {
        var inst = target_instances[i];
        var tx = inst.x;
        
        if (tx == min_x && tx <= (cx + 199) && tx > (cx + 55))
        {
            switch (inst.object_index)
            {
                case obj_target_1:
                    krishit = true;
                    break;
                case obj_target_2:
                    susiehit = true;
                    break;
                case obj_target_3:
                    ralseihit = true;
                    break;
            }
        }
    }
}

if (!endingtransition)
{
    if (instance_exists(obj_target_1))
    {
        var ktx = obj_target_1.x - cx;
        
        if (ktx <= 199 && ktx > 87)
            krisdamage = round(150 + (((ktx - 87) / 112) * -90));
        else if (ktx < 87)
            krisdamage = round(60 + (((ktx - 50) / 37) * 90));
        else
            krisdamage = 165;
    }
    
    if (instance_exists(obj_target_2))
    {
        var stx = obj_target_2.x - cx;
        
        if (stx <= 199 && stx > 87)
            susiedamage = round(246 + (((stx - 87) / 112) * -148));
        else if (stx < 87)
            susiedamage = round(98 + (((stx - 50) / 37) * 148));
        else
            susiedamage = 270;
    }
    
    if (instance_exists(obj_target_3))
    {
        var rtx = obj_target_3.x - cx;
        
        if (rtx <= 199 && rtx > 87)
            ralseidamage = round(110 + (((rtx - 87) / 112) * -66));
        else if (rtx < 87)
            ralseidamage = round(44 + (((rtx - 50) / 37) * 66));
        else
            ralseidamage = 120;
    }
    
    if (instance_exists(obj_target_1) && obj_target_1.x <= (cx + 55))
    {
        krismiss = true;
        krishit = true;
    }
    
    if (instance_exists(obj_target_2) && obj_target_2.x <= (cx + 55))
    {
        susiemiss = true;
        susiehit = true;
    }
    
    if (instance_exists(obj_target_3) && obj_target_3.x <= (cx + 55))
    {
        ralseimiss = true;
        ralseihit = true;
    }
    
    if (krishit)
    {
        krishittimer++;
        
        if (krishittimer == 0)
        {
            krisobject.sprite_index = spr_kris_fight;
            krisobject.image_index = 0;
            krisobject.image_speed = 1;
            hitnoise = true;
            
            if (obj_target_1.x == (cx + 87))
            {
                obj_target_1.image_blend = c_yellow;
                instance_create_depth(krisobject.x, krisobject.y, krisobject.depth - 2, obj_attackshine);
                criticalnoise = true;
            }
        }
        
        if (krishittimer == 12)
        {
            ENGINE.krisbattleicon = 0;
            
            if (!krismiss)
            {
                global.enemyhp -= round(krisdamage * nerfmultiplier);
                var krishitchoice = instance_create_depth(ENEMY1targetx, ENEMY1targety, ENEMY1.depth - 2, obj_hitanimation);
                krishitchoice.sprite_index = spr_krishit;
                krishitchoice.scale = 2;
                audio_play_sound(snd_damage, 1, false);
                ENEMY1.sprite_index = spr_foane_ex_hit;
                
                if (obj_target_1.image_blend == c_yellow)
                    global.tp += 6;
                else
                    global.tp += 3;
                
                ENEMY1.hit = true;
                ENEMY1.hittimer = -1;
            }
        }
        
        if (krishittimer == 20)
        {
            var damagek = instance_create_depth(ENEMY1targetx, ENEMY1targety - (20 * (krisorder - 1)), ENEMY1.depth - 50, obj_damage_battle);
            damagek.manual = true;
            damagek.image_blend = kriscolor;
            
            if (!krismiss)
                damagek.value = round(krisdamage * nerfmultiplier);
            else
                damagek.miss = true;
        }
        
        if (!krismiss)
        {
            obj_target_1.speed = 0;
            obj_target_1.image_xscale += 0.1;
            obj_target_1.image_yscale += 0.1;
            obj_target_1.image_alpha -= 0.1;
        }
    }
    
    if (krismiss)
        obj_target_1.image_alpha -= 1/3;
    
    if (krisobject.image_index >= 7 && !endingtransition && ENGINE.krisfight)
        krisobject.image_speed = 0;
    
    if (susiehit)
    {
        susiehittimer++;
        
        if (susiehittimer == 0)
        {
            susieobject.sprite_index = spr_susie_attack;
            susieobject.image_index = 0;
            susieobject.image_speed = 1;
            hitnoise = true;
            
            if (obj_target_2.x == (cx + 87))
            {
                obj_target_2.image_blend = c_yellow;
                instance_create_depth(susieobject.x, susieobject.y, susieobject.depth - 2, obj_attackshine);
                criticalnoise = true;
            }
        }
        
        if (susiehittimer == 12)
        {
            ENGINE.susiebattleicon = 0;
            
            if (!susiemiss)
            {
                global.enemyhp -= round(susiedamage * nerfmultiplier);
                var susiehitchoice = instance_create_depth(ENEMY1targetx, ENEMY1targety, ENEMY1.depth - 2, obj_hitanimation);
                susiehitchoice.sprite_index = spr_susiehit;
                susiehitchoice.scale = 2;
                audio_play_sound(snd_damage, 1, false);
                audio_play_sound(snd_impact, 1, false);
                ENEMY1.sprite_index = spr_foane_ex_hit;
                
                if (obj_target_2.image_blend == c_yellow)
                    global.tp += 6;
                else
                    global.tp += 3;
                
                ENEMY1.hit = true;
                ENEMY1.hittimer = -1;
            }
        }
        
        if (susiehittimer == 20)
        {
            var damages = instance_create_depth(ENEMY1targetx, ENEMY1targety - (20 * (susieorder - 1)), ENEMY1.depth - 50, obj_damage_battle);
            damages.manual = true;
            damages.image_blend = susiecolor;
            
            if (!susiemiss)
                damages.value = round(susiedamage * nerfmultiplier);
            else
                damages.miss = true;
        }
        
        if (!susiemiss)
        {
            switch (susiehittimer)
            {
                case 12:
                    camera_set_view_pos(view_camera[0], cxstart - 4, cystart - 4);
                    break;
                case 13:
                    camera_set_view_pos(view_camera[0], cxstart + 4, cystart + 4);
                    break;
                case 14:
                    camera_set_view_pos(view_camera[0], cxstart - 3, cystart - 3);
                    break;
                case 15:
                    camera_set_view_pos(view_camera[0], cxstart + 2, cystart + 2);
                    break;
                case 16:
                    camera_set_view_pos(view_camera[0], cxstart, cystart);
                    break;
            }
        }
        
        if (!susiemiss)
        {
            obj_target_2.speed = 0;
            obj_target_2.image_xscale += 0.1;
            obj_target_2.image_yscale += 0.1;
            obj_target_2.image_alpha -= 0.1;
        }
    }
    
    if (susiemiss)
        obj_target_2.image_alpha -= 1/3;
    
    if (susieobject.image_index >= 3 && !endingtransition && ENGINE.susiefight)
        susieobject.image_speed = 0;
    
    if (ralseihit)
    {
        ralseihittimer++;
        
        if (ralseihittimer == 0)
        {
            ralseiobject.sprite_index = spr_ralsei_attack;
            ralseiobject.image_index = 0;
            ralseiobject.image_speed = 1;
            hitnoise = true;
            
            if (obj_target_3.x == (cx + 87))
            {
                obj_target_3.image_blend = c_yellow;
                instance_create_depth(ralseiobject.x, ralseiobject.y, ralseiobject.depth - 2, obj_attackshine);
                criticalnoise = true;
            }
        }
        
        if (ralseihittimer == 12)
        {
            ENGINE.ralseibattleicon = 0;
            
            if (!ralseimiss)
            {
                global.enemyhp -= round(ralseidamage * nerfmultiplier);
                var ralseihitchoice = instance_create_depth(ENEMY1targetx, ENEMY1targety, ENEMY1.depth - 2, obj_hitanimation);
                ralseihitchoice.sprite_index = spr_ralseihit;
                ralseihitchoice.scale = 2;
                audio_play_sound(snd_damage, 1, false);
                ENEMY1.sprite_index = spr_foane_ex_hit;
                
                if (obj_target_3.image_blend == c_yellow)
                    global.tp += 6;
                else
                    global.tp += 3;
                
                ENEMY1.hit = true;
                ENEMY1.hittimer = -1;
            }
        }
        
        if (ralseihittimer == 20)
        {
            var damager = instance_create_depth(ENEMY1targetx, ENEMY1targety - (20 * (ralseiorder - 1)), ENEMY1.depth - 50, obj_damage_battle);
            damager.manual = true;
            damager.image_blend = ralseicolor;
            
            if (!ralseimiss)
                damager.value = round(ralseidamage * nerfmultiplier);
            else
                damager.miss = true;
        }
        
        if (!ralseimiss)
        {
            obj_target_3.speed = 0;
            obj_target_3.image_xscale += 0.1;
            obj_target_3.image_yscale += 0.1;
            obj_target_3.image_alpha -= 0.1;
        }
    }
    
    if (ralseimiss)
        obj_target_3.image_alpha -= 1/3;
    
    if (ralseiobject.image_index >= 7 && !endingtransition && ENGINE.ralseifight)
        ralseiobject.image_speed = 0;
}

if (kris && susie && ralsei)
{
    if ((krishit || krismiss) && (susiehit || susiemiss) && (ralseihit || ralseimiss))
        allhittimer++;
}
else if (kris && susie)
{
    if ((krishit || krismiss) && (susiehit || susiemiss))
        allhittimer++;
}
else if (kris && ralsei)
{
    if ((krishit || krismiss) && (ralseihit || ralseimiss))
        allhittimer++;
}
else if (susie && ralsei)
{
    if ((susiehit || susiemiss) && (ralseihit || ralseimiss))
        allhittimer++;
}
else if (kris)
{
    if (krishit || krismiss)
        allhittimer++;
}
else if (susie)
{
    if (susiehit || susiemiss)
        allhittimer++;
}
else if (ralsei)
{
    if (ralseihit || ralseimiss)
        allhittimer++;
}
