var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var green = 49152;
var white = make_color_rgb(whitecolor1, whitecolor2, whitecolor3);
timer++;

if (spawn)
{
    if (timer == 17)
    {
        alpha = 0;
        image_speed = 0;
    }
    
    switch (global.turn)
    {
        case 1:
            if (timer == 20)
            {
                obj_kreid_c3.sprite_index = spr_kreid_cape;
                obj_kreid_c3.image_index = 0;
                obj_kreid_c3.image_speed = 1;
            }
            
            if (timer >= 20 && (timer % 12) == 0 && timer <= 220)
                instance_create_depth(cam_x + 350, cam_y + 200, obj_SOUL_battle.depth - 3, obj_fedorabat);
            
            if (timer < 50 && obj_kreid_c3.sprite_index == spr_kreid_cape && obj_kreid_c3.image_index >= 4)
                obj_kreid_c3.image_speed = 0;
            
            if (timer == 250)
            {
                alpha = 1;
                instance_destroy(obj_fedorabat);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 2:
            if (timer >= 20 && ((timer - 4) % 30) == 0 && timer <= 220)
            {
                var bottom = instance_create_depth(cam_x + 690, cam_y + 200, obj_SOUL_battle.depth - 3, obj_shadowwave);
                var top = instance_create_depth(cam_x + 690, cam_y + 200, obj_SOUL_battle.depth - 3, obj_shadowwave);
                top.leftright = 0;
                top.speedmultiplier = 2/3;
                bottom.speedmultiplier = 2/3;
                bottom.exception = true;
            }
            
            if (timer >= 20 && (timer % 37) == 0 && timer <= 220)
            {
                var fire = instance_create_depth(cam_x + 690, cam_y + 152, obj_SOUL_battle.depth - 3, obj_shadowspike);
                var fire2 = instance_create_depth(cam_x + 690, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                var fire3 = instance_create_depth(cam_x + 690, cam_y + 188, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire.image_angle = -90;
                fire2.image_angle = -90;
                fire3.image_angle = -90;
                fire.speedmultiplier = 2/3;
                fire2.speedmultiplier = 2/3;
                fire3.speedmultiplier = 2/3;
            }
            
            if (timer == 250)
            {
                alpha = 1;
                instance_destroy(obj_shadowspike);
                instance_destroy(obj_shadowwave);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 3:
            if (timer >= 16 && (timer % 4) == 0 && timer <= 72)
                instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
            
            if (instance_exists(obj_shadowspike))
                obj_shadowspike.radius = (90 + (sin(degtorad(timer * 6)) * 20)) - ((timer - 17) / 11);
            
            if (timer >= 20 && (timer % 20) == 0 && timer <= 300)
            {
                var randomshoot = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                randomshoot.randomshoot = true;
            }
            
            if (timer == 330)
            {
                alpha = 1;
                instance_destroy(obj_shadowspike);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 4:
            if (timer == 20)
                instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidbullet);
            
            if (timer >= 21 && (timer % 25) == 0 && timer <= 280 && !instance_exists(obj_kreidbullet))
                instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidbullet);
            
            if (timer >= 10 && ((timer - 15) % 25) == 0 && timer <= 280)
            {
                var fire = instance_create_depth(cam_x + 340, cam_y + 60, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire.down = true;
                var fire2 = instance_create_depth(cam_x + 360, cam_y + 60, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire2.down = true;
                var fire3 = instance_create_depth(cam_x + 380, cam_y + 60, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire3.down = true;
                var fire4 = instance_create_depth(cam_x + 400, cam_y + 60, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire4.down = true;
                var fire5 = instance_create_depth(cam_x + 300, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire5.down = true;
                fire5.up = true;
                fire5.image_angle = 180;
                var fire6 = instance_create_depth(cam_x + 280, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire6.down = true;
                fire6.up = true;
                fire6.image_angle = 180;
                var fire7 = instance_create_depth(cam_x + 260, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire7.down = true;
                fire7.up = true;
                fire7.image_angle = 180;
                var fire8 = instance_create_depth(cam_x + 240, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire8.down = true;
                fire8.up = true;
                fire8.image_angle = 180;
            }
            
            if (timer == 300)
            {
                alpha = 1;
                instance_destroy(obj_kreidbullet);
                instance_destroy(obj_shadowspike);
                instance_destroy(obj_shadowwave);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 5:
            if (timer >= 21 && (timer % 15) == 0 && timer <= 270 && !instance_exists(obj_whitebox))
                instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_whitebox);
            
            if (timer == 300)
            {
                alpha = 1;
                instance_destroy(obj_kreidbullet);
                instance_destroy(obj_shadowspike);
                instance_destroy(obj_shadowwave);
                instance_destroy(obj_whitebox);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 6:
            if (timer >= 20 && (timer % 28) == 0 && timer <= 240)
            {
                var linear1 = instance_create_depth(obj_SOUL_battle.x + 150, obj_SOUL_battle.y, obj_SOUL_battle.depth - 3, obj_shadowspike);
                linear1.golinear = true;
                linear1.endx = obj_SOUL_battle.x - 150;
                linear1.endy = obj_SOUL_battle.y;
                var linear2 = instance_create_depth(obj_SOUL_battle.x - 150, obj_SOUL_battle.y, obj_SOUL_battle.depth - 3, obj_shadowspike);
                linear2.golinear = true;
                linear2.endx = obj_SOUL_battle.x + 150;
                linear2.endy = obj_SOUL_battle.y;
                var linear3 = instance_create_depth(obj_SOUL_battle.x, obj_SOUL_battle.y + 150, obj_SOUL_battle.depth - 3, obj_shadowspike);
                linear3.golinear = true;
                linear3.endx = obj_SOUL_battle.x;
                linear3.endy = obj_SOUL_battle.y - 150;
                var linear4 = instance_create_depth(obj_SOUL_battle.x, obj_SOUL_battle.y - 150, obj_SOUL_battle.depth - 3, obj_shadowspike);
                linear4.golinear = true;
                linear4.endx = obj_SOUL_battle.x;
                linear4.endy = obj_SOUL_battle.y + 150;
                var diagonal1 = instance_create_depth(obj_SOUL_battle.x + 200, obj_SOUL_battle.y + 200, obj_SOUL_battle.depth - 3, obj_shadowspike);
                diagonal1.godiagonal = true;
                diagonal1.endx = obj_SOUL_battle.x - 200;
                diagonal1.endy = obj_SOUL_battle.y - 200;
                var diagonal2 = instance_create_depth(obj_SOUL_battle.x - 200, obj_SOUL_battle.y + 200, obj_SOUL_battle.depth - 3, obj_shadowspike);
                diagonal2.godiagonal = true;
                diagonal2.endx = obj_SOUL_battle.x + 200;
                diagonal2.endy = obj_SOUL_battle.y - 200;
                var diagonal3 = instance_create_depth(obj_SOUL_battle.x - 200, obj_SOUL_battle.y - 200, obj_SOUL_battle.depth - 3, obj_shadowspike);
                diagonal3.godiagonal = true;
                diagonal3.endx = obj_SOUL_battle.x - 200;
                diagonal3.endy = obj_SOUL_battle.y + 200;
                var diagonal4 = instance_create_depth(obj_SOUL_battle.x + 200, obj_SOUL_battle.y - 200, obj_SOUL_battle.depth - 3, obj_shadowspike);
                diagonal4.godiagonal = true;
                diagonal4.endx = obj_SOUL_battle.x + 200;
                diagonal4.endy = obj_SOUL_battle.y + 200;
            }
            
            if (timer == 250)
            {
                alpha = 1;
                instance_destroy(obj_kreidbullet);
                instance_destroy(obj_shadowspike);
                instance_destroy(obj_shadowwave);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 7:
            if (timer == 270)
                obj_kreid_c3.sprite_index = spr_kreid_ominous;
            
            if (timer >= 16 && (timer % 4) == 0 && timer <= 72)
                instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
            
            if (instance_exists(obj_shadowspike))
                obj_shadowspike.radius = (90 + (sin(degtorad(timer * 6)) * 16)) - ((timer - 17) / 15);
            
            if (timer >= 20 && (timer % 20) == 0 && timer <= 270)
            {
                var randomshoot = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                randomshoot.randomshoot = true;
                randomshoot.image_xscale = 2;
                randomshoot.image_yscale = 2;
            }
            
            if (timer == 270)
                audio_sound_gain(mus_kreidfight, 0, 5000);
            
            if (timer >= 330 && timer < 380)
            {
                if (instance_exists(obj_shadowspike))
                    obj_shadowspike.image_alpha -= 0.05;
                
                boxalpha -= 0.05;
                obj_SOUL_battle.image_alpha -= 0.05;
                boxalpha = clamp(boxalpha, 0, 1);
                obj_SOUL_battle.image_alpha = clamp(obj_SOUL_battle.image_alpha, 0, 1);
            }
            
            if (timer == 420)
            {
                obj_SOUL_battle.moving = false;
                obj_SOUL_battle.x = cam_x + 320;
                obj_SOUL_battle.y = cam_y + 170;
                
                with (obj_kreid_c3)
                {
                    reset_dialogue_normal();
                    textenemy = true;
                }
            }
            
            if (manualend)
            {
                alpha = 1;
                instance_destroy(obj_shadowspike);
                obj_kris_c3.manualoff = false;
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 8:
            obj_SOUL_battle.purple = true;
            obj_SOUL_battle.xstrings = true;
            
            if (timer == 20)
            {
                obj_kreid_c3.sprite_index = spr_kreid_cape_rage;
                obj_kreid_c3.image_index = 0;
                obj_kreid_c3.image_speed = 1;
            }
            
            randomize();
            var random12 = choose(1, 2);
            
            if (timer >= 20 && ((timer + 5) % 16) == 0 && timer <= 230)
            {
                var fedorabat = instance_create_depth(cam_x + 350, cam_y + 200, obj_SOUL_battle.depth - 3, obj_fedorabat);
                fedorabat.strings = true;
                var fedorabat2 = instance_create_depth(cam_x + 350, cam_y + 200, obj_SOUL_battle.depth - 3, obj_fedorabat);
                fedorabat2.strings = true;
                fedorabat2.stringposition = fedorabat.stringposition + random12;
            }
            
            if (timer < 50 && obj_kreid_c3.sprite_index == spr_kreid_cape_rage && obj_kreid_c3.image_index >= 4)
                obj_kreid_c3.image_speed = 0;
            
            if (timer == 280)
            {
                alpha = 1;
                instance_destroy(obj_fedorabat);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 9:
            obj_SOUL_battle.purple = true;
            obj_SOUL_battle.xstrings = true;
            
            if (timer >= 20 && ((timer - 10) % 30) == 0 && timer <= 300)
            {
                var randomshoot = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 5, obj_shadowspike);
                randomshoot.randomshoot = true;
                randomshoot.sprite_index = spr_kreidknife_2;
            }
            
            var between = lerp(obj_SOUL_battle.x, cam_x + 320, 0.5);
            
            if (timer >= 20 && (timer % 20) == 0 && timer <= 300 && !instance_exists(obj_kreidhorns))
                instance_create_depth(between, cam_y + 248, obj_SOUL_battle.depth - 3, obj_kreidhorns);
            
            if (timer == 330)
            {
                alpha = 1;
                instance_destroy(obj_kreidhorns);
                instance_destroy(obj_shadowspike);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 10:
            obj_SOUL_battle.purple = true;
            obj_SOUL_battle.xstrings = true;
            
            if (timer >= 20 && (timer % 26) == 0 && timer <= 300)
            {
                var bottom = instance_create_depth(cam_x + 690, cam_y + 200, obj_SOUL_battle.depth - 3, obj_shadowwave);
                var top = instance_create_depth(cam_x + 690, cam_y + 200, obj_SOUL_battle.depth - 3, obj_shadowwave);
                top.leftright = 0;
                bottom.exception = true;
            }
            
            if (timer >= 20 && (timer % 26) == 0 && timer <= 300)
            {
                var fire = instance_create_depth(cam_x + 690, cam_y + 154, obj_SOUL_battle.depth - 3, obj_shadowspike);
                var fire2 = instance_create_depth(cam_x + 690, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                var fire3 = instance_create_depth(cam_x + 690, cam_y + 186, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire.image_angle = -90;
                fire2.image_angle = -90;
                fire3.image_angle = -90;
            }
            
            if (timer >= 20 && (timer % 13) == 0 && !((timer % 26) == 0) && timer <= 150)
            {
                var top = instance_create_depth(cam_x + 690, cam_y + 200, obj_SOUL_battle.depth - 3, obj_shadowwave);
                top.leftright = 0;
            }
            
            if (timer >= 180 && (timer % 13) == 0 && !((timer % 26) == 0) && timer <= 300)
            {
                var bottom = instance_create_depth(cam_x + 690, cam_y + 200, obj_SOUL_battle.depth - 3, obj_shadowwave);
                bottom.exception = true;
            }
            
            if (timer == 340)
            {
                alpha = 1;
                instance_destroy(obj_shadowspike);
                instance_destroy(obj_shadowwave);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 11:
            obj_SOUL_battle.purple = true;
            obj_SOUL_battle.xstrings = true;
            randomize();
            var randomleftx = lerp(cam_x + 250, obj_SOUL_battle.x, 0.5);
            var randomrightx = lerp(cam_x + 390, obj_SOUL_battle.x, 0.5);
            var randombottomy = lerp(cam_y + 240, obj_SOUL_battle.y, 0.5);
            var randomtopy = lerp(cam_y + 100, obj_SOUL_battle.y, 0.5);
            var randomx = irandom_range(randomleftx, randomrightx);
            var randomy = irandom_range(randombottomy, randomtopy);
            var leftx = cam_x + 275;
            var rightx = cam_x + 365;
            var bottomy = cam_y + 215;
            var topy = cam_y + 125;
            var midx = cam_x + 320;
            var midy = cam_y + 170;
            
            if (timer >= 21 && (timer % 15) == 0 && timer <= 120 && !instance_exists(obj_whitebox))
            {
                instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_whitebox);
                obj_whitebox.sprite_index = spr_whitebox_2;
            }
            
            if (timer == 156)
            {
                if (instance_exists(obj_whitebox))
                    instance_destroy(obj_whitebox);
                
                audio_play_sound(snd_bell, 1, false);
            }
            
            if (timer >= 156 && (timer % 8) == 0 && timer <= 186)
                var a = instance_create_depth(obj_SOUL_battle.x, obj_SOUL_battle.y, obj_SOUL_battle.depth - 1, obj_kreidcircle);
            
            if (timer == 195)
            {
                var b = instance_create_depth(midx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var c = instance_create_depth(leftx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var d = instance_create_depth(rightx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var e = instance_create_depth(midx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var f = instance_create_depth(midx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                c.audible = false;
                d.audible = false;
                e.audible = false;
                f.audible = false;
            }
            
            if (timer == 220)
            {
                var h = instance_create_depth(leftx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var i = instance_create_depth(rightx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var j = instance_create_depth(leftx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var k = instance_create_depth(rightx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                i.audible = false;
                j.audible = false;
                k.audible = false;
            }
            
            if (timer == 230)
                var l = instance_create_depth(midx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
            
            if (timer == 260)
            {
                var b = instance_create_depth(midx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var e = instance_create_depth(midx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var f = instance_create_depth(midx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                e.audible = false;
                f.audible = false;
            }
            
            if (timer == 285)
            {
                var a1 = instance_create_depth(leftx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a2 = instance_create_depth(leftx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a3 = instance_create_depth(leftx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a4 = instance_create_depth(rightx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a5 = instance_create_depth(rightx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a6 = instance_create_depth(rightx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                a2.audible = false;
                a3.audible = false;
                a4.audible = false;
                a5.audible = false;
                a6.audible = false;
            }
            
            if (timer == 325)
            {
                alpha = 1;
                instance_destroy(obj_kreidbullet);
                instance_destroy(obj_shadowspike);
                instance_destroy(obj_shadowwave);
                instance_destroy(obj_whitebox);
                instance_destroy(obj_kreidcircle);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 12:
            obj_SOUL_battle.purple = true;
            obj_SOUL_battle.xstrings = true;
            timer2++;
            randomize();
            var randomleftx = lerp(cam_x + 250, obj_SOUL_battle.x, 0.5);
            var randomrightx = lerp(cam_x + 390, obj_SOUL_battle.x, 0.5);
            var randombottomy = lerp(cam_y + 240, obj_SOUL_battle.y, 0.5);
            var randomtopy = lerp(cam_y + 100, obj_SOUL_battle.y, 0.5);
            var randomx = irandom_range(randomleftx, randomrightx);
            var randomy = irandom_range(randombottomy, randomtopy);
            var leftx = cam_x + 275;
            var rightx = cam_x + 365;
            var bottomy = cam_y + 215;
            var topy = cam_y + 125;
            var midx = cam_x + 320;
            var midy = cam_y + 170;
            
            if (timer == 20)
            {
                obj_kreid_c3.sprite_index = spr_kreid_cape_rage;
                obj_kreid_c3.image_index = 0;
                obj_kreid_c3.image_speed = 1;
            }
            
            if (timer >= 20 && ((timer - 5) % 15) == 0 && timer <= 230)
            {
                var fedorabat = instance_create_depth(cam_x + 350, cam_y + 200, obj_SOUL_battle.depth - 3, obj_fedorabat);
                fedorabat.strings = true;
            }
            
            if (timer < 50 && obj_kreid_c3.sprite_index == spr_kreid_cape_rage && obj_kreid_c3.image_index >= 4)
                obj_kreid_c3.image_speed = 0;
            
            if (timer == 17)
            {
                var c = instance_create_depth(leftx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var d = instance_create_depth(rightx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var e = instance_create_depth(midx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var f = instance_create_depth(midx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                d.audible = false;
                e.audible = false;
                f.audible = false;
            }
            
            if (timer >= 45 && (timer % 24) == 0 && timer <= 260)
                var c = instance_create_depth(obj_SOUL_battle.x, obj_SOUL_battle.y, obj_SOUL_battle.depth - 1, obj_kreidcircle);
            
            if (timer >= 45 && ((timer - 3) % 24) == 0 && timer <= 260)
                var d = instance_create_depth(obj_SOUL_battle.x, obj_SOUL_battle.y, obj_SOUL_battle.depth - 1, obj_kreidcircle);
            
            if (timer == 265)
            {
                var a1 = instance_create_depth(leftx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a2 = instance_create_depth(leftx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a3 = instance_create_depth(leftx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a4 = instance_create_depth(rightx, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a5 = instance_create_depth(rightx, topy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                var a6 = instance_create_depth(rightx, bottomy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                a2.audible = false;
                a3.audible = false;
                a4.audible = false;
                a5.audible = false;
                a6.audible = false;
            }
            
            if (timer == 290)
            {
                var ax = instance_create_depth(cam_x + 320, midy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                ax.wide = true;
            }
            
            if (timer == 330)
            {
                alpha = 1;
                instance_destroy(obj_shadowspike);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 13:
            obj_SOUL_battle.purple = true;
            obj_SOUL_battle.xstrings = true;
            var randomchoice = irandom_range(1, 5);
            
            if (timer >= 20 && (timer % 15) == 0 && timer <= 280)
            {
                var bottom = instance_create_depth(cam_x + 690, cam_y + 200, obj_SOUL_battle.depth - 2, obj_shadowwave);
                bottom.exception = true;
            }
            
            if (timer >= 20 && (timer % 30) == 0 && timer <= 300)
            {
                if (!(randomchoice == 4))
                {
                    var fire = instance_create_depth(cam_x + 340, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    fire.down = true;
                    fire.up = true;
                }
                
                if (!(randomchoice == 5))
                {
                    var fire2 = instance_create_depth(cam_x + 360, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    fire2.down = true;
                    fire2.up = true;
                }
                
                var fire3 = instance_create_depth(cam_x + 380, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire3.down = true;
                fire3.up = true;
                
                if (!(randomchoice == 3))
                {
                    var firemid = instance_create_depth(cam_x + 320, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    firemid.down = true;
                    firemid.up = true;
                }
                
                if (!(randomchoice == 2))
                {
                    var fire6 = instance_create_depth(cam_x + 300, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    fire6.down = true;
                    fire6.up = true;
                }
                
                if (!(randomchoice == 1))
                {
                    var fire7 = instance_create_depth(cam_x + 280, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    fire7.down = true;
                    fire7.up = true;
                }
                
                var fire8 = instance_create_depth(cam_x + 260, cam_y + 280, obj_SOUL_battle.depth - 3, obj_shadowspike);
                fire8.down = true;
                fire8.up = true;
            }
            
            if (instance_exists(obj_shadowspike))
                obj_shadowspike.image_angle = 180;
            
            if (timer == 330)
            {
                alpha = 1;
                instance_destroy(obj_kreidbullet);
                instance_destroy(obj_kreidhorns);
                instance_destroy(obj_shadowspike);
                instance_destroy(obj_shadowwave);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 14:
            obj_SOUL_battle.purple = true;
            obj_SOUL_battle.xstrings = true;
            
            if (timer == 20)
            {
                obj_kreid_c3.sprite_index = spr_kreid_cape_rage;
                obj_kreid_c3.image_index = 0;
                obj_kreid_c3.image_speed = 1;
            }
            
            randomize();
            var random12 = choose(1, 2);
            
            if (timer > 20 && timer < 280 && !global.alldown)
            {
                global.bottomoffset = sin((timer - 20) / 9.549) * 15;
                global.topoffset = sin((timer - 20) / 9.549) * 20;
            }
            
            if (timer >= 20 && (timer % 14) == 0 && timer <= 230)
            {
                var fedorabat = instance_create_depth(cam_x + 350, cam_y + 200, obj_SOUL_battle.depth - 3, obj_fedorabat);
                fedorabat.strings = true;
            }
            
            if (timer < 50 && obj_kreid_c3.sprite_index == spr_kreid_cape_rage && obj_kreid_c3.image_index >= 4)
                obj_kreid_c3.image_speed = 0;
            
            if (timer == 20)
            {
                var a = instance_create_depth(cam_x + 100, cam_y + 170, obj_SOUL_battle.depth - 4, obj_kreidbullet);
                a.horizontal = true;
                a.image_angle = 0;
                a.verticaloffset = 170;
                a.timer2 = -30;
            }
            
            if (timer == 40)
            {
                var b = instance_create_depth(cam_x + 100, cam_y + 132, obj_SOUL_battle.depth - 4, obj_kreidbullet_b);
                b.horizontal = true;
                b.image_angle = 0;
                b.verticaloffset = 132;
                b.timer2 = -30;
            }
            
            if (timer == 50)
            {
                var c = instance_create_depth(cam_x + 100, cam_y + 208, obj_SOUL_battle.depth - 4, obj_kreidbullet_c);
                c.horizontal = true;
                c.image_angle = 0;
                c.verticaloffset = 208;
                c.timer2 = -30;
            }
            
            if (timer > 50 && (timer % 40) == 0 && timer <= 280 && !instance_exists(obj_kreidbullet))
            {
                var a = instance_create_depth(cam_x + 0, cam_y + 170, obj_SOUL_battle.depth - 4, obj_kreidbullet);
                a.horizontal = true;
                a.image_angle = 0;
                a.verticaloffset = 170;
                a.timer2 = -30;
            }
            
            if (timer > 50 && (timer % 50) == 0 && timer <= 280 && !instance_exists(obj_kreidbullet_b))
            {
                var b = instance_create_depth(cam_x + 100, cam_y + 132, obj_SOUL_battle.depth - 4, obj_kreidbullet_b);
                b.horizontal = true;
                b.image_angle = 0;
                b.verticaloffset = 132;
                b.timer2 = -30;
            }
            
            if (timer > 50 && (timer % 45) == 0 && timer <= 280 && !instance_exists(obj_kreidbullet_c))
            {
                var c = instance_create_depth(cam_x + 100, cam_y + 208, obj_SOUL_battle.depth - 4, obj_kreidbullet_c);
                c.horizontal = true;
                c.image_angle = 0;
                c.verticaloffset = 208;
                c.timer2 = -30;
            }
            
            if (timer == 280)
            {
                global.topoffset = 0;
                global.bottomoffset = 0;
                alpha = 1;
                instance_destroy(obj_fedorabat);
                instance_destroy(obj_kreidbullet);
                instance_destroy(obj_kreidbullet_b);
                instance_destroy(obj_kreidbullet_c);
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
        case 15:
            obj_SOUL_battle.purple = true;
            obj_SOUL_battle.xstrings = true;
            var leftx = cam_x + 275;
            var rightx = cam_x + 365;
            var bottomy = cam_y + 215;
            var topy = cam_y + 125;
            var midx = cam_x + 320;
            var midy = cam_y + 170;
            
            if (global.krishp > 0)
                timer2 += 0.00016666666666666666;
            
            if (timer == 1)
                oGlobalC3RoomKreidFight.cloudfinal = true;
            
            if (global.krishp > 0)
            {
                if (timer == 20)
                {
                    var a = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    var b = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    b.percent1 = 0.05;
                    b.timer = 6;
                    var c = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    c.percent1 = 0.1;
                    c.timer = 3;
                }
                
                var between = lerp(obj_SOUL_battle.x, cam_x + 320, 0.5);
                
                if (timer >= 103 && (timer % 20) == 0 && timer <= 239 && !instance_exists(obj_kreidhorns))
                    instance_create_depth(between, cam_y + 248, obj_SOUL_battle.depth - 3, obj_kreidhorns);
                
                if (timer >= 103 && (timer % 18) == 0 && timer <= 230)
                    var a = instance_create_depth(obj_SOUL_battle.x, obj_SOUL_battle.y, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                
                if (timer >= 120 && timer < 200)
                {
                    if (instance_exists(obj_kreidgun))
                        obj_kreidgun.image_alpha -= 0.1;
                }
                
                if (timer == 240)
                {
                    if (instance_exists(obj_kreidhorns))
                        obj_kreidhorns.exiting = true;
                }
                
                if (timer == 240)
                    instance_create_depth(cam_x + 320, cam_y + 50, obj_SOUL_battle.depth - 1, obj_kreid_warning);
                
                if (timer == 250)
                {
                    var directionoffset = 0;
                    var xoffset = 320;
                    var yoffset = 50;
                    audio_play_sound(snd_swing, 1, false, 1.5);
                    var e1 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e1.direction = 0 + directionoffset;
                    var e2 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e2.direction = 20 + directionoffset;
                    var e3 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e3.direction = 40 + directionoffset;
                    var e4 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e4.direction = 60 + directionoffset;
                    var e5 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e5.direction = 80 + directionoffset;
                    var e6 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e6.direction = 100 + directionoffset;
                    var e7 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e7.direction = 120 + directionoffset;
                    var e8 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e8.direction = 140 + directionoffset;
                    var e9 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e9.direction = 160 + directionoffset;
                    var e10 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e10.direction = 180 + directionoffset;
                    var e11 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e11.direction = 200 + directionoffset;
                    var e12 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e12.direction = 220 + directionoffset;
                    var e13 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e13.direction = 240 + directionoffset;
                    var e14 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e14.direction = 260 + directionoffset;
                    var e15 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e15.direction = 280 + directionoffset;
                    var e16 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e16.direction = 300 + directionoffset;
                    var e17 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e17.direction = 320 + directionoffset;
                    var e18 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    e18.direction = 340 + directionoffset;
                }
                
                if (timer == 250)
                    instance_create_depth(cam_x + 500, cam_y + 170, obj_SOUL_battle.depth - 1, obj_kreid_warning);
                
                if (timer == 250)
                    instance_create_depth(cam_x + 140, cam_y + 170, obj_SOUL_battle.depth - 1, obj_kreid_warning);
                
                if (timer == 260)
                {
                    var directionoffset = 0;
                    var xoffset = 500;
                    var yoffset = 170;
                    var xoffset2 = 140;
                    var yoffset2 = 170;
                    audio_play_sound(snd_ultraswing, 1, false, 1.5);
                    var g1 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g1.direction = 0 + directionoffset;
                    var g2 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g2.direction = 20 + directionoffset;
                    var g3 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g3.direction = 40 + directionoffset;
                    var g4 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g4.direction = 60 + directionoffset;
                    var g5 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g5.direction = 80 + directionoffset;
                    var g6 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g6.direction = 100 + directionoffset;
                    var g7 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g7.direction = 120 + directionoffset;
                    var g8 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g8.direction = 140 + directionoffset;
                    var g9 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g9.direction = 160 + directionoffset;
                    var g10 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g10.direction = 180 + directionoffset;
                    var g11 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g11.direction = 200 + directionoffset;
                    var g12 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g12.direction = 220 + directionoffset;
                    var g13 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g13.direction = 240 + directionoffset;
                    var g14 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g14.direction = 260 + directionoffset;
                    var g15 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g15.direction = 280 + directionoffset;
                    var g16 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g16.direction = 300 + directionoffset;
                    var g17 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g17.direction = 320 + directionoffset;
                    var g18 = instance_create_depth(cam_x + xoffset, cam_y + yoffset, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    g18.direction = 340 + directionoffset;
                    var h1 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h1.direction = 0 + directionoffset;
                    var h2 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h2.direction = 20 + directionoffset;
                    var h3 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h3.direction = 40 + directionoffset;
                    var h4 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h4.direction = 60 + directionoffset;
                    var h5 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h5.direction = 80 + directionoffset;
                    var h6 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h6.direction = 100 + directionoffset;
                    var h7 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h7.direction = 120 + directionoffset;
                    var h8 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h8.direction = 140 + directionoffset;
                    var h9 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h9.direction = 160 + directionoffset;
                    var h10 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h10.direction = 180 + directionoffset;
                    var h11 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h11.direction = 200 + directionoffset;
                    var h12 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h12.direction = 220 + directionoffset;
                    var h13 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h13.direction = 240 + directionoffset;
                    var h14 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h14.direction = 260 + directionoffset;
                    var h15 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h15.direction = 280 + directionoffset;
                    var h16 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h16.direction = 300 + directionoffset;
                    var h17 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h17.direction = 320 + directionoffset;
                    var h18 = instance_create_depth(cam_x + xoffset2, cam_y + yoffset2, obj_SOUL_battle.depth - 1, obj_kreidelec);
                    h18.direction = 340 + directionoffset;
                }
                
                if (timer >= 296 && ((timer - 4) % 20) == 0 && timer <= 396)
                {
                    randomize();
                    var randomstringy = choose(cam_y + 132, cam_y + 170, cam_y + 208);
                    var a = instance_create_depth(cam_x + 320, randomstringy, obj_SOUL_battle.depth - 1, obj_kreidcircle);
                    a.wide = true;
                }
                
                if (timer == 286)
                {
                    obj_kreid_c3.sprite_index = spr_kreid_cape_rage;
                    obj_kreid_c3.image_index = 0;
                    obj_kreid_c3.image_speed = 1;
                }
                
                if (timer > 286 && obj_kreid_c3.sprite_index == spr_kreid_cape_rage && obj_kreid_c3.image_index >= 4)
                    obj_kreid_c3.image_speed = 0;
                
                if (timer >= 286 && (timer % 15) == 0 && timer <= 375)
                {
                    randomize();
                    var randomstringx = irandom_range(leftx, rightx);
                    var fedorabat = instance_create_depth(cam_x + 350, cam_y + 200, obj_SOUL_battle.depth - 3, obj_fedorabat);
                    fedorabat.targetx = randomstringx;
                    fedorabat.xtoup = true;
                }
                
                if (timer == 417)
                {
                    obj_kreid_c3.sprite_index = spr_kreid_ominous;
                    obj_kreid_c3.image_speed = 1;
                    obj_kreid_c3.xoffset += 4;
                }
                
                if (timer == 419)
                    obj_kreid_c3.xoffset -= 8;
                
                if (timer == 421)
                    obj_kreid_c3.xoffset += 6;
                
                if (timer == 423)
                    obj_kreid_c3.xoffset -= 4;
                
                if (timer == 425)
                    obj_kreid_c3.xoffset += 3;
                
                if (timer == 427)
                    obj_kreid_c3.xoffset -= 2;
                
                if (timer == 429)
                    obj_kreid_c3.xoffset += 1;
                
                if (timer == 430)
                {
                    var a = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    a.spin = false;
                    a.radius = 160;
                    a.onebullet = true;
                    a.timer = 6;
                    a.percent1 = 0.3;
                }
                
                if (timer == 434)
                {
                    var b = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    b.spin = false;
                    b.radius = 160;
                    b.onebullet = true;
                    b.timer = 10;
                    b.audible = false;
                    b.percent1 = 0.4;
                }
                
                if (timer == 438)
                {
                    var c = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    c.spin = false;
                    c.radius = 160;
                    c.onebullet = true;
                    c.timer = 14;
                    c.audible = false;
                    c.percent1 = 0.5;
                }
                
                if (timer == 451)
                {
                    var d = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    d.spin = false;
                    d.radius = 160;
                    d.onebullet = true;
                    d.timer = 6;
                    d.percent1 = -0.1;
                }
                
                if (timer == 455)
                {
                    var e = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    e.spin = false;
                    e.radius = 160;
                    e.onebullet = true;
                    e.timer = 10;
                    e.audible = false;
                    e.percent1 = -0.2;
                }
                
                if (timer == 459)
                {
                    var f = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    f.spin = false;
                    f.radius = 160;
                    f.onebullet = true;
                    f.timer = 14;
                    f.audible = false;
                    f.percent1 = -0.3;
                }
                
                if (timer == 472)
                {
                    var a = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    a.spin = false;
                    a.radius = 165;
                    a.onebullet = true;
                    a.timer = 6;
                    randomize();
                    a.percent1 = random_range(0.7, 1);
                }
                
                if (timer == 476)
                {
                    var b = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    b.spin = false;
                    b.radius = 165;
                    b.onebullet = true;
                    b.timer = 10;
                    b.audible = false;
                    randomize();
                    b.percent1 = random_range(0.7, 1);
                }
                
                if (timer == 493)
                {
                    var c = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    c.spin = false;
                    c.radius = 170;
                    c.onebullet = true;
                    c.timer = 6;
                    randomize();
                    c.percent1 = random_range(0.3, 0.6);
                }
                
                if (timer == 497)
                {
                    var f = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    f.spin = false;
                    f.radius = 170;
                    f.onebullet = true;
                    f.timer = 10;
                    f.audible = false;
                    randomize();
                    f.percent1 = random_range(0.3, 0.6);
                }
                
                if (timer == 518)
                {
                    var d = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    d.spin = true;
                    d.radius = 170;
                    d.onebullet = true;
                    d.timer = 8;
                    randomize();
                    d.percent1 = random_range(0.1, 0.3);
                }
                
                if (timer == 528)
                {
                    var f = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    f.spin = true;
                    f.radius = 170;
                    f.onebullet = true;
                    f.timer = 6;
                    randomize();
                    f.percent1 = random_range(0.4, 0.6);
                }
                
                if (timer == 543)
                {
                    var h = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    h.spin = true;
                    h.radius = 170;
                    h.onebullet = true;
                    h.timer = 4;
                    randomize();
                    h.percent1 = random_range(0.7, 1);
                }
                
                if (timer == 563)
                {
                    var d = instance_create_depth(cam_x + 320, cam_y + 170, obj_SOUL_battle.depth - 3, obj_kreidgun);
                    d.spin = true;
                    d.radius = 170;
                    d.onebullet = true;
                    d.timer = 0;
                    randomize();
                    d.percent1 = random_range(0.4, 0.6);
                }
                
                if (timer >= 595)
                    timer3++;
                
                randomize();
                var randomoffset = random_range(0, 360);
                var initialradius = 150;
                var finalradius = 270;
                
                if (timer3 == 2 && timer < 600)
                {
                    var b1 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b2 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b3 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b4 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b5 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b6 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b7 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b8 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b9 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b10 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b11 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b12 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b13 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b14 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b15 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b16 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b17 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    var b18 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike_2);
                    obj_shadowspike_2.spinstatic = true;
                    b1.radius = initialradius;
                    b1.angle2 += randomoffset;
                    b2.radius = initialradius;
                    b2.angle2 += 20 + randomoffset;
                    b3.radius = initialradius;
                    b3.angle2 += 40 + randomoffset;
                    b4.radius = initialradius;
                    b4.angle2 += 60 + randomoffset;
                    b5.radius = initialradius;
                    b5.angle2 += 80 + randomoffset;
                    b6.radius = initialradius;
                    b6.angle2 += 100 + randomoffset;
                    b7.radius = initialradius;
                    b7.angle2 += 120 + randomoffset;
                    b8.radius = initialradius;
                    b8.angle2 += 140 + randomoffset;
                    b9.radius = initialradius;
                    b9.angle2 += 160 + randomoffset;
                    b10.radius = initialradius;
                    b10.angle2 += 180 + randomoffset;
                    b11.radius = initialradius;
                    b11.angle2 += 200 + randomoffset;
                    b12.radius = initialradius;
                    b12.angle2 += 220 + randomoffset;
                    b13.radius = initialradius;
                    b13.angle2 += 240 + randomoffset;
                    b14.radius = initialradius;
                    b14.angle2 += 260 + randomoffset;
                    b15.radius = initialradius;
                    b15.angle2 += 280 + randomoffset;
                    b16.radius = initialradius;
                    b16.angle2 += 300 + randomoffset;
                    b17.radius = initialradius;
                    b17.angle2 += 320 + randomoffset;
                    b18.radius = initialradius;
                    b18.angle2 += 340 + randomoffset;
                }
                
                if (timer3 == 2 && timer < 750)
                {
                    var a1 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a2 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a3 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a4 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a5 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a6 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a7 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a8 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a9 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a10 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a11 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a12 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a13 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    var a14 = instance_create_depth(cam_x + 800, cam_y + 170, obj_SOUL_battle.depth - 3, obj_shadowspike);
                    obj_shadowspike.spinstatic = true;
                    a1.radius = initialradius;
                    a1.angle2 += randomoffset;
                    a2.radius = initialradius;
                    a2.angle2 += 20 + randomoffset;
                    a3.radius = initialradius;
                    a3.angle2 += 40 + randomoffset;
                    a4.radius = initialradius;
                    a4.angle2 += 60 + randomoffset;
                    a5.radius = initialradius;
                    a5.angle2 += 80 + randomoffset;
                    a6.radius = initialradius;
                    a6.angle2 += 100 + randomoffset;
                    a7.radius = initialradius;
                    a7.angle2 += 120 + randomoffset;
                    a8.radius = initialradius;
                    a8.angle2 += 140 + randomoffset;
                    a9.radius = initialradius;
                    a9.angle2 += 160 + randomoffset;
                    a10.radius = initialradius;
                    a10.angle2 += 180 + randomoffset;
                    a11.radius = initialradius;
                    a11.angle2 += 200 + randomoffset;
                    a12.radius = initialradius;
                    a12.angle2 += 220 + randomoffset;
                    a13.radius = initialradius;
                    a13.angle2 += 240 + randomoffset;
                    a14.radius = initialradius;
                    a14.angle2 += 260 + randomoffset;
                }
                
                if (instance_exists(obj_shadowspike))
                {
                    if (timer3 >= 2)
                        obj_shadowspike.image_alpha += 0.25;
                    
                    obj_shadowspike.radius = initialradius - ((timer3 - 16) * 6);
                }
                
                if (instance_exists(obj_shadowspike_2))
                {
                }
                
                if (timer3 == 43)
                    timer3 = 1;
                
                if (timer == 480)
                    audio_sound_gain(mus_wind, 1, 10000);
                
                if (timer == 780)
                {
                    global.endofbattle = true;
                    obj_kreid_c3.depth = -101;
                    obj_kris_c3.depth = -100;
                }
            }
            
            break;
        default:
            if (timer == 100)
            {
                alpha = 1;
                spawn = false;
                obj_SOUL_battle.ending = true;
            }
            
            break;
    }
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);

if (timer >= 17 && spawn)
{
    draw_set_alpha(boxalpha);
    draw_rectangle_color(cam_x + 249 + global.leftoffset, cam_y + 99 + global.topoffset, cam_x + 390 + global.rightoffset, cam_y + 240 + global.bottomoffset, c_black, c_black, c_black, c_black, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 98 + global.topoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 248 + global.leftoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 241 + global.bottomoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 391 + global.rightoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_set_alpha(1);
}
else
{
    alpha = 1;
    image_speed = 1;
}

if (instance_exists(obj_battle_kf))
{
    if (global.krishp <= 0)
    {
        image_speed = 0;
        exit;
    }
}
