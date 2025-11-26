if (room == rm_ch3_epilogue)
{
    e0timer++;
    
    if (e0timer == 2)
    {
        audio_sound_pitch(mus_castletown, 1);
        audio_sound_gain(mus_castletown, 1, 0);
        audio_play_sound(mus_castletown, 1, true, 0.6);
    }
    
    if (e0timer == 0)
    {
        obj_ralsei_e3.image_index = 0;
        obj_susie_e3.image_index = 2;
        obj_kris_e3.image_index = 0;
        obj_ralsei_e3.speed = -3;
        obj_susie_e3.speed = -3;
        obj_kris_e3.speed = -3;
    }
    
    if (e0timer == 76)
    {
        obj_ralsei_e3.speed = 0;
        obj_susie_e3.speed = 0;
        obj_kris_e3.speed = 0;
        obj_ralsei_e3.image_speed = 0;
        obj_susie_e3.image_speed = 0;
        obj_kris_e3.image_speed = 0;
    }
    
    if (e0timer == 100)
        obj_ralsei_e3.sprite_index = sRalseiWalkDown;
    
    if (e0timer == 115)
    {
        talking = true;
        dialogue = 1;
        reset_dialogue_normal();
    }
    
    if (e1trigger)
    {
        e1timer++;
        
        if (e1timer == 0)
        {
            obj_ralsei_e3.speed = -6;
            obj_ralsei_e3.image_speed = 1.5;
            obj_ralsei_e3.sprite_index = sRalseiWalkLeft;
        }
        
        if (obj_ralsei_e3.x <= 320 && !(obj_ralsei_e3.speed == 0) && obj_ralseiroom.cake == 5)
        {
            with (obj_ralsei_e3)
            {
                speed = 0;
                image_speed = 0;
                sprite_index = sRalseiWalkUp;
                image_index = 0;
            }
        }
        
        if (e1timer == 25)
        {
            with (obj_ralsei_e3)
            {
                sprite_index = spr_ralsei_reveal;
                image_speed = 1;
            }
        }
        
        if (e1timer == 63)
        {
            audio_play_sound(snd_wing, 1, false);
            obj_ralseiroom.cake = 6;
        }
    }
    
    if (e2trigger)
    {
        e1trigger = false;
        e2timer++;
        
        if (e2timer == 0)
        {
            obj_susie_e3.speed = -8;
            obj_susie_e3.image_speed = 2;
            obj_susie_e3.sprite_index = sSusieWalkLeft;
        }
        
        with (obj_ralsei_e3)
        {
            if (obj_susie_e3.x <= (x + 60) && obj_ch3_epilogue_text.dialogue <= 40)
            {
                x -= 8;
                sprite_index = sRalseiWalkRight;
            }
        }
        
        with (obj_susie_e3)
        {
            if (x <= 320 && speed == -8)
            {
                x = 320;
                speed = 0;
                image_speed = 0;
                sprite_index = sSusieWalkUp;
                image_index = 0;
            }
        }
        
        if (e2timer == 70)
        {
            with (obj_susie_e3)
                sprite_index = sSusieWalkDown;
        }
        
        if (e2timer == 85)
        {
            talking = true;
            dialogue = 10;
            reset_dialogue_normal();
        }
    }
    
    if (e3trigger)
    {
        e3timer++;
        
        if (e3timer == 0)
        {
            obj_susie_e3.sprite_index = sSusieLaughLeft;
            audio_play_sound(snd_laugh, 1, false);
            obj_susie_e3.image_speed = 1;
        }
        
        if (e3timer == 60)
        {
            obj_susie_e3.sprite_index = sSusieWalkDown;
            obj_susie_e3.image_speed = 0;
            obj_susie_e3.image_index = 0;
            talking = true;
            dialogue = 11;
            reset_dialogue_normal();
        }
    }
    
    if (e4trigger)
    {
        e4timer++;
        
        if (e4timer == 0)
        {
            obj_kreid_e3.speed = -3;
            obj_susie_e3.sprite_index = sSusieWalkRight;
            obj_rudinn.speed = -4;
            obj_v_e3.speed = -4;
            obj_virovirokun_e3.speed = -4;
            obj_starwalker_e3.speed = -4;
            
            with (obj_kris_e3)
            {
                speed = -4;
                image_speed = 1;
                sprite_index = sKrisWalkRight;
            }
        }
        
        with (obj_kris_e3)
        {
            if (x <= 380 && speed == -4 && sprite_index == sKrisWalkRight)
            {
                speed = 0;
                x = 380;
                image_speed = 0;
                image_index = 0;
            }
        }
        
        if (e4timer == 200)
        {
            talking = true;
            dialogue = 13;
            reset_dialogue_normal();
        }
    }
    
    if (e5trigger)
    {
        e5timer++;
        
        if (e5timer == 0)
        {
            obj_ralsei_e3.sprite_index = sRalseiWalkLeft;
            obj_susie_e3.sprite_index = sSusieWalkLeft;
            obj_kris_e3.sprite_index = sKrisWalkLeft;
            audio_play_sound(snd_shovel_1, 1, false);
        }
        
        if (e5timer == 30)
        {
            audio_play_sound(snd_shovel_1, 1, false);
            obj_lhole_1.image_index = 1;
        }
        
        if (e5timer == 45)
        {
            audio_play_sound(snd_shovel_1, 1, false, 1, false, 0.9);
            obj_lhole_1.image_index = 2;
        }
        
        if (e5timer == 75)
        {
            audio_play_sound(snd_jump_bc, 1, false, 0.6);
            obj_lancer_e3.triggerup = true;
        }
    }
    
    if (e6trigger)
    {
        e6timer++;
        
        if (e6timer == 20)
            obj_lancer_e3.image_index = 2;
        
        if (e6timer == 50)
        {
            talking = true;
            dialogue = 25;
            reset_dialogue_normal();
        }
    }
    
    if (e7trigger)
    {
        e7timer++;
        
        if (e7timer == 0)
        {
            audio_play_sound(snd_jump_bc, 1, false, 0.6);
            obj_queen_e3.triggerup = true;
        }
    }
    
    if (e8trigger)
    {
        e8timer++;
        
        if (e8timer == 0)
            obj_queen_e3.image_index = 0;
        
        if (e8timer == 30)
        {
            talking = true;
            dialogue = 32;
            reset_dialogue_normal();
        }
    }
    
    if (e9trigger)
    {
        e9timer++;
        
        if (e9timer == 0)
        {
            obj_queen_box.fall = true;
            obj_queen_box.image_alpha = 1;
        }
        
        if (e9timer == 35)
        {
            talking = true;
            dialogue = 37;
            reset_dialogue_normal();
        }
    }
    
    if (e10trigger)
    {
        e10timer++;
        
        if (e10timer == 0)
        {
            var explosion = instance_create_depth(357, 30, -1200, obj_explosion);
            explosion.image_xscale = 11;
            explosion.image_yscale = 3;
            audio_play_sound(snd_badexplosion, 1, false);
            obj_kris_e3.sprite_index = sKrisWalkDown;
            obj_susie_e3.sprite_index = sSusieWalkDownUpset;
            obj_ralsei_e3.sprite_index = sRalseiWalkDown;
            obj_queen_e3.image_index = 0;
            obj_lancer_e3.image_index = 0;
            obj_kreid_e3.image_index = 0;
        }
        
        if (e10timer == 10)
        {
            obj_tv_room_chains.down = true;
            obj_tv_room.down = true;
            audio_play_sound(snd_chain_extend, 1, true, 0.5);
        }
    }
    
    if (e11trigger)
    {
        e11timer++;
        
        if (e11timer == 0)
        {
            obj_mike_e3.direction = 180;
            obj_mike_e3.speed = 8;
        }
        
        if (e11timer == 17)
        {
            obj_mike_e3.turnoff = true;
            obj_mike_e3.direction = -90;
            obj_mike_e3.image_index = 6;
        }
        
        if (e11timer == 27)
        {
            obj_mike_e3.speed = 0;
            obj_mike_e3.image_index = 10;
        }
        
        if (e11timer == 30)
        {
            talking = true;
            dialogue = 49;
            reset_dialogue_normal();
        }
    }
    
    if (e12trigger)
    {
        e12timer++;
        
        if (e12timer == 45)
        {
            talking = true;
            dialogue = 56;
            reset_dialogue_normal();
        }
    }
    
    if (dialogue == 57 || dialogue == 58)
    {
        if (obj_mike_e3.x >= obj_lancer_e3.x)
            obj_lancer_e3.image_index = 3;
        
        if (obj_mike_e3.x >= obj_ralsei_e3.x)
            obj_ralsei_e3.sprite_index = sRalseiWalkRight;
        
        if (obj_mike_e3.x >= obj_kris_e3.x)
            obj_kris_e3.sprite_index = sKrisWalkRight;
        
        if (obj_mike_e3.x >= obj_susie_e3.x)
            obj_susie_e3.sprite_index = sSusieWalkRight;
        
        if (obj_mike_e3.x >= obj_kreid_e3.x)
            obj_kreid_e3.image_index = 3;
    }
    
    if (e13trigger)
    {
        e13timer++;
        
        if (e13timer == 100)
        {
            talking = true;
            dialogue = 58;
            reset_dialogue_normal();
        }
    }
    
    if (e14trigger)
    {
        e14timer++;
        
        if (e14timer == 0)
            obj_queen_e3.jump = true;
        
        if (obj_susie_e3.x <= obj_ralsei_e3.x && obj_ralsei_e3.sprite_index == sRalseiWalkLeft)
        {
        }
        
        if (obj_susie_e3.x <= obj_lancer_e3.x && obj_lancer_e3.image_index == 1)
            obj_lancer_e3.image_index = 2;
    }
    
    if (e15trigger)
    {
        e15timer++;
        
        if (e15timer == 15)
        {
            obj_susie_e3.sprite_index = spr_susie_pulling;
            obj_susie_e3.image_index = 0;
            obj_queen_box.image_index = 1;
        }
        
        if (obj_susie_e3.image_index >= 1 && obj_susie_e3.sprite_index == spr_susie_pulling)
            obj_susie_e3.image_speed = 0;
        
        if (e15timer == 50)
        {
            e15trigger = false;
            talking = true;
            dialogue = 64;
            reset_dialogue_normal();
        }
    }
    
    if (e16trigger)
    {
        e16timer++;
        
        if (e16timer == 0)
        {
            obj_susie_e3.speed = 6;
            obj_susie_e3.direction = 0;
            obj_susie_e3.image_speed = 1;
            obj_susie_e3.sprite_index = sSusieWalkRight;
        }
        
        if (obj_susie_e3.x >= 320 && dialogue == 66 && obj_susie_e3.direction == 0 && obj_susie_e3.sprite_index == sSusieWalkRight)
        {
            obj_susie_e3.x = 320;
            obj_susie_e3.sprite_index = sSusieWalkDown_dvd;
            obj_susie_e3.direction = -90;
        }
        
        if (obj_susie_e3.y >= 260 && e16timer4 < 0)
        {
            obj_lancer_e3.image_index = 0;
            obj_kreid_e3.image_index = 0;
            obj_ralsei_e3.sprite_index = sRalseiWalkDown;
            obj_kris_e3.sprite_index = sKrisWalkDown;
        }
        
        if (obj_susie_e3.y >= 460)
        {
            obj_susie_e3.y = 460;
            obj_susie_e3.speed = 0;
            obj_susie_e3.image_speed = 0;
            obj_susie_e3.image_index = 0;
            e16timer2++;
            
            if (e16timer2 == 15)
            {
                audio_play_sound(snd_noise, 1, false);
                obj_susie_e3.sprite_index = sSusieWalkDown;
            }
            
            if (e16timer2 == 55)
            {
                audio_play_sound(snd_bell, 1, false, 0.6);
                instance_create_depth(320, 240, -1000, obj_tv_overlay);
            }
            
            if (e16timer2 == 80)
            {
                obj_susie_e3.speed = 4;
                obj_susie_e3.direction = 90;
                obj_susie_e3.image_speed = 1;
                obj_susie_e3.sprite_index = sSusieWalkDown;
            }
        }
        
        if (obj_susie_e3.y <= 366 && e16timer2 >= 80)
        {
            if (obj_susie_e3.speed == 4)
            {
                obj_susie_e3.y = 366;
                obj_susie_e3.speed = 0;
                obj_susie_e3.image_speed = 0;
                obj_susie_e3.image_index = 0;
            }
            
            e16timer3++;
        }
        
        if (e16timer3 == 10)
        {
            obj_susie_e3.sprite_index = spr_susie_tv_sit;
            obj_kris_e3.sprite_index = sKrisWalkDown;
            obj_kris_e3.image_speed = 0.6;
            obj_kris_e3.speed = 4;
            obj_kris_e3.direction = -90;
            obj_lancer_e3.speed = 4;
            obj_lancer_e3.direction = -90;
            obj_ralsei_e3.speed = 4;
            obj_ralsei_e3.direction = -90;
            obj_kreid_e3.speed = 4;
            obj_kreid_e3.direction = -90;
            obj_kreid_e3.image_speed = 1;
            obj_ralsei_e3.image_speed = 1;
        }
        
        if (e16timer3 >= 10)
        {
            if (obj_kris_e3.y >= obj_susie_e3.y)
            {
                e16timer4++;
                
                if (e16timer4 <= 0)
                {
                    obj_kris_e3.speed = 0;
                    obj_kris_e3.image_index = 0;
                    obj_kris_e3.image_speed = 0;
                    obj_kris_e3.y = obj_susie_e3.y;
                    obj_lancer_e3.speed = 0;
                    obj_ralsei_e3.speed = 0;
                    obj_kreid_e3.speed = 0;
                    obj_kreid_e3.image_speed = 0;
                    obj_ralsei_e3.image_speed = 0;
                    obj_kreid_e3.image_index = 0;
                    obj_ralsei_e3.image_index = 0;
                    obj_lancer_e3.y = obj_susie_e3.y;
                    obj_ralsei_e3.y = obj_susie_e3.y;
                    obj_kreid_e3.y = obj_susie_e3.y - 18;
                }
            }
        }
        
        if (e16timer4 == 10)
            obj_kris_e3.sprite_index = sKrisWalkLeft;
        
        if (e16timer4 == 40)
            obj_kris_e3.sprite_index = sKrisWalkDown;
        
        if (e16timer4 == 60)
            obj_kris_e3.sprite_index = spr_kris_sit;
        
        if (e16timer4 == 100)
        {
            dialoguetop = true;
            dialoguebottom = false;
            obj_susie_e3.image_index = 1;
        }
        
        if (e16timer4 == 140)
        {
            talking = true;
            dialogue = 67;
            reset_dialogue_normal();
            e16trigger = false;
        }
    }
    
    if (e17trigger)
    {
        e17timer++;
        
        if (e17timer == 0)
        {
            obj_ralseiroom.trigger = true;
            obj_ralsei_e3.sprite_index = sRalseiWalkDown;
            obj_susie_e3.image_index = 0;
        }
        
        if (e17timer == 70)
        {
            talking = true;
            dialogue = 72;
            reset_dialogue_normal();
        }
    }
    
    if (e18trigger)
    {
        e18timer++;
        
        if (e18timer == 0)
            instance_create_depth(320, 240, -1600, obj_blackscreen_fadein);
        
        if (e18timer >= 0)
            obj_blackscreen_fadein.image_alpha += 1/30;
        
        if (e18timer == 35)
            room_goto(rm_ch3_resolution);
    }
    
    if (e19trigger)
        e19timer++;
    
    if (e20trigger)
        e20timer++;
    
    if (mikewalkout)
    {
        mikewtimer++;
        
        if (mikewtimer == 0)
        {
            obj_mike_e3.image_index = 9;
            obj_mike_e3.direction = 0;
            obj_mike_e3.speed = 4;
        }
        
        if (mikewtimer == 7)
        {
        }
    }
}

if (room == rm_ch3_resolution)
{
    if (e1trigger)
        e1timer++;
    
    if (e1timer == 0)
        obj_foane_e3.speed = 3;
    
    if (e1timer >= 0)
    {
        obj_robots_r1.image_speed = 1;
        obj_robots_r2.image_speed = 1;
        obj_robots_r3.image_speed = 1;
        obj_robots_platform.speed = e1timer / 10;
        obj_robots_r1.speed = e1timer / 10;
        obj_robots_r2.speed = e1timer / 10;
        obj_robots_r3.speed = e1timer / 10;
        obj_robots_platform.direction = 90;
        obj_robots_r1.direction = 90;
        obj_robots_r2.direction = 90;
        obj_robots_r3.direction = 90;
    }
    
    if (obj_foane_e3.x >= obj_foane_e3.targetx)
    {
        obj_foane_e3.image_speed = 1/3;
        obj_foane_e3.speed = 0;
        obj_foane_e3.x = obj_foane_e3.targetx;
        e1timer2++;
    }
    
    if (e1timer2 == 0)
        obj_mike_castle_e3.jiggle = true;
    
    if (e18trigger)
        e18timer++;
    
    if (e18timer == 0)
        instance_create_depth(320, 240, -1600, obj_blackscreen_fadein);
    
    if (e18timer >= 0)
        obj_blackscreen_fadein.image_alpha += 1/30;
    
    if (e18timer == 35)
        room_goto(rm_ch3_epilogue_end);
}

if (room == rm_ch3_epilogue_end)
{
    if (e1trigger)
        e1timer++;
    
    if (e1timer == 0)
    {
        obj_kreid_e3_end.sprite_index = spr_kreid_walkup;
        obj_kreid_e3_end.speed = 4;
        obj_kreid_e3_end.image_speed = 1;
        obj_kreid_e3_end.direction = 90;
    }
    
    if (obj_kreid_e3_end.y <= 242)
    {
        e1timer2++;
        
        if (e1timer2 == 0)
        {
            obj_kreid_e3_end.sprite_index = spr_kreid_walkright;
            obj_kreid_e3_end.direction = 0;
            y = 242;
        }
        
        if (e1timer2 == 15)
        {
            obj_kreid_e3_end.image_speed = 0;
            obj_kreid_e3_end.image_index = 0;
            obj_kreid_e3_end.speed = 0;
            talking = true;
            dialogue = 117;
            reset_dialogue_normal();
        }
    }
    
    if (e2trigger)
        e2timer++;
    
    if (e2timer == 0)
    {
        obj_kreid_e3_end.speed = 4;
        obj_kreid_e3_end.image_speed = 1;
    }
    
    if (e2timer == 60)
    {
        talking = true;
        dialogue = 119;
        reset_dialogue_normal();
    }
    
    if (e3trigger)
        e3timer++;
    
    if (e3timer == 0)
        obj_starwalker_e3_end.move = true;
    
    if (e3timer == 30)
        obj_v_e3_end.move = true;
    
    if (e3timer == 60)
        obj_virovirokun_e3_end.move = true;
    
    if (e3timer == 90)
        obj_rudinn_e3_end.move = true;
    
    if (e3timer == 200)
    {
        obj_lancer_e3_end.image_index = 3;
        talking = true;
        dialogue = 120;
        reset_dialogue_normal();
    }
    
    if (e4trigger)
        e4timer++;
    
    if (e4timer == 0)
    {
        obj_lancer_e3_end.image_index = 1;
        obj_lancer_e3_end.speed = 4;
        obj_lancer_e3_end.direction = 180;
    }
    
    if (instance_exists(obj_lancer_e3_end) && obj_lancer_e3_end.x <= obj_lhole_e3_end.x)
    {
        e4timer2++;
        
        if (e4timer2 == 0)
        {
            obj_lancer_e3_end.image_index = 2;
            obj_lancer_e3_end.direction = 90;
            obj_lancer_e3_end.x = obj_lhole_e3_end.x;
        }
        
        if (obj_lancer_e3_end.y <= (obj_lhole_e3_end.y - 30))
            obj_lancer_e3_end.holeshow = true;
    }
    
    if (instance_exists(obj_lancer_e3_end) && obj_lancer_e3_end.holeshow)
    {
        e4timer3++;
        
        if (e4timer3 == 0)
        {
            obj_lancer_e3_end.y = obj_lhole_e3_end.y - 30;
            obj_lancer_e3_end.speed = 0;
            obj_lancer_e3_end.direction = -90;
        }
        
        if (e4timer3 == 0)
            audio_play_sound(snd_fall_cool_deep, 1, false, 0.4);
        
        if (e4timer3 > 0)
        {
            obj_lancer_e3_end.speed += 0.25;
            
            if (obj_lancer_e3_end.y >= 380)
                instance_destroy(obj_lancer_e3_end);
        }
    }
    
    if (!instance_exists(obj_lancer_e3_end))
    {
        e4timer4++;
        
        if (e4timer4 == 60)
        {
            talking = true;
            dialogue = 121;
            reset_dialogue_normal();
        }
    }
    
    if (e5trigger)
        e5timer++;
    
    if (e5timer == 0)
    {
    }
    
    if (e5timer == 30)
    {
        talking = true;
        dialogue = 126;
        reset_dialogue_normal();
    }
    
    if (e6trigger)
        e6timer++;
    
    if (e6timer == 0)
    {
        obj_susie_e3_end.speed = 4;
        obj_susie_e3_end.image_speed = 0.6;
        obj_susie_e3_end.direction = 45;
    }
    
    if (obj_susie_e3_end.y <= 260)
    {
        obj_susie_e3_end.direction = 0;
        obj_susie_e3_end.sprite_index = sSusieWalkRight;
    }
    
    if (obj_susie_e3_end.x >= obj_kris_e3_end.x && e6trigger && obj_kris_e3_end.sprite_index == sKrisWalkLeft)
        obj_kris_e3_end.sprite_index = sKrisWalkUp;
    
    if (e6timer == 100)
    {
        obj_ralsei_e3_end.sprite_index = sRalseiWalkUp;
        obj_kris_e3_end.direction = 45;
        obj_kris_e3_end.image_speed = 0.6;
        obj_kris_e3_end.sprite_index = sKrisWalkRight;
        obj_kris_e3_end.speed = 4;
    }
    
    if (obj_kris_e3_end.y <= 260 && e6trigger)
    {
        obj_kris_e3_end.direction = 0;
        obj_kris_e3_end.speed = 0;
        obj_kris_e3_end.sprite_index = sKrisWalkRight;
        obj_kris_e3_end.image_speed = 0;
        obj_kris_e3_end.image_index = 0;
        talking = true;
        dialogue = 131;
        reset_dialogue_normal();
        e6trigger = false;
    }
    
    if (e7trigger)
    {
        e7timer++;
        obj_kris_e3_end.image_alpha -= 0.016666666666666666;
        obj_ralsei_e3_end.image_alpha -= 0.016666666666666666;
        obj_kris_e3_talk.image_alpha += 0.016666666666666666;
        obj_ralsei_e3_talk.image_alpha += 0.016666666666666666;
        
        if (e7timer == 100)
        {
            talking = true;
            dialogue = 133;
            reset_dialogue_normal();
        }
    }
    
    if (e20trigger)
    {
        e20timer++;
        
        if (e20timer == 0)
            instance_create_depth(320, 240, -1600, obj_blackscreen_fadein);
        
        if (e20timer >= 0)
            obj_blackscreen_fadein.image_alpha += 0.016666666666666666;
        
        if (e20timer == 90)
            room_goto(rm_ch3_knight);
    }
}
