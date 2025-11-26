var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var green = 49152;
var white = make_color_rgb(whitecolor1, whitecolor2, whitecolor3);

if (instance_exists(obj_battle_sio))
{
    if (!global.alldown)
        timer++;
}

if (spawn)
{
    if (timer == 17)
    {
        alpha = 0;
        image_speed = 0;
    }
    
    if (ENGINE.jammed || instance_exists(obj_generator1_sio) || instance_exists(obj_generator2_sio))
    {
        global.topoffset = 40;
        global.bottomoffset = 40;
        global.leftoffset = 0;
        global.rightoffset = 0;
        
        if (instance_exists(obj_SOUL_battle_sio))
        {
            obj_SOUL_battle_sio.yellow = true;
            obj_SOUL_battle_sio.up = true;
        }
        
        if (timer == 18)
        {
            if (ENGINE.susiemagic && ENGINE.susieactoptions == 1)
            {
                obj_susie_sio.image_index = 0;
                obj_susie_sio.sprite_index = spr_susie_mercy;
                obj_susie_sio.rudebuster = true;
                
                if (ENGINE.generator1 && instance_exists(obj_generator1_sio) && !ENGINE.susiejaminterrupt)
                {
                }
                
                if (ENGINE.generator2 && instance_exists(obj_generator2_sio) && !ENGINE.susiejaminterrupt)
                {
                }
            }
            
            if (ENGINE.generator1 && !instance_exists(obj_generator1_sio))
            {
                var gen1 = instance_create_depth(cam_x + 250, cam_y + 44, -400, obj_generator1_sio);
                gen1.image_xscale = 2;
                gen1.image_yscale = 2;
            }
            
            if (ENGINE.generator2 && !instance_exists(obj_generator2_sio))
            {
                var gen2 = instance_create_depth(cam_x + 390, cam_y + 44, -400, obj_generator2_sio);
                gen2.image_xscale = 2;
                gen2.image_yscale = 2;
            }
            
            if (global.nohit)
            {
                var rev1 = instance_create_depth(cam_x + 500, cam_y + 210, -401, obj_revolver);
                rev1.timermultiplier = 0.4;
                var rev2 = instance_create_depth(cam_x + 140, cam_y + 210, -401, obj_revolver);
                rev2.image_xscale = -2;
                rev2.timermultiplier = 0.5;
            }
            else if (ENGINE.jamdifficulty <= 0)
            {
                var rev1 = instance_create_depth(cam_x + 120, cam_y + 210, -401, obj_revolver);
                rev1.image_xscale = -2;
            }
            else if (ENGINE.jamdifficulty == 1)
            {
                instance_create_depth(cam_x + 520, cam_y + 210, -401, obj_revolver);
            }
            else if (ENGINE.jamdifficulty >= 2)
            {
                var rev1 = instance_create_depth(cam_x + 500, cam_y + 210, -401, obj_revolver);
                rev1.timermultiplier = 0.4;
                var rev2 = instance_create_depth(cam_x + 140, cam_y + 210, -401, obj_revolver);
                rev2.image_xscale = -2;
                rev2.timermultiplier = 0.5;
            }
        }
        
        if (global.generator1hp <= 0 && global.generator2hp <= 0)
        {
            timer2++;
            
            if (timer2 == 50)
                instance_create_depth(340, 260, -405, obj_nogenerator_sio);
        }
        
        if (timer == 240)
        {
            ENGINE.jamwait++;
            alpha = 1;
            spawn = false;
            instance_destroy(obj_revolver);
            instance_destroy(obj_nogenerator_sio);
            instance_destroy(obj_minitv_wall_2);
            instance_destroy(obj_minitv_wall);
            obj_SOUL_battle_sio.ending = true;
        }
    }
    else
    {
        switch (turn)
        {
            case 1:
                global.topoffset = 0;
                global.bottomoffset = 0;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                    obj_SOUL_battle_sio.yellow = true;
                
                if (timer == 18)
                    instance_create_depth(cam_x + 500, cam_y + 210, -401, obj_tv_sio);
                
                if ((timer % 18) == 0 && !instance_exists(obj_spikebarrier) && timer < 230)
                    instance_create_depth(cam_x + 400, cam_y + 170, -402, obj_spikebarrier);
                
                if (timer == 240)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_tv_sio);
                    instance_destroy(obj_spikebarrier);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 2:
                sprite_index = spr_bulletboard_verticalthin;
                global.leftoffset = 63 + xoffset + xoffset2;
                global.rightoffset = -63 + xoffset + xoffset2;
                
                if (instance_exists(obj_SOUL_battle_sio))
                    obj_SOUL_battle_sio.yellow = true;
                
                if (((timer + 38) % 50) == 0 && timer < 280)
                    instance_create_depth(cam_x + 670, cam_y + 170, -401, obj_bombpillars);
                
                if (timer >= 18)
                {
                    percent1++;
                    var position = animcurve_channel_evaluate(curveslower, percent1 / 10);
                    xoffset = lerp(0, -50, position);
                    xoffset2 = round(sin(((timer - 18) / 100) * (2 * pi)) * 8);
                }
                
                if (timer == 320)
                {
                    x -= 50;
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_bombpillars);
                    instance_destroy(obj_bomb);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 3:
                global.topoffset = 40;
                global.bottomoffset = 40;
                global.leftoffset = 0;
                global.rightoffset = 0;
                var leftx = cam_x + 275;
                var rightx = cam_x + 365;
                var bottomy = cam_y + 240;
                var topy = cam_y + 100;
                var midx = cam_x + 320;
                var midy = cam_y + 170;
                randomize();
                var randomy = irandom_range(topy, bottomy) + global.topoffset;
                
                if (instance_exists(obj_SOUL_battle_sio))
                    obj_SOUL_battle_sio.yellow = true;
                
                if (timer == 18)
                {
                    var cloud = instance_create_depth(cam_x + 320, cam_y + 80, -402, obj_cloud_sio);
                    cloud.xx = cam_x + 320;
                }
                
                if ((timer % 20) == 0)
                {
                    var a1 = instance_create_depth(cam_x + 700, randomy, -400, obj_minitv);
                    ystorage = a1.y;
                }
                
                if (((timer - 2) % 20) == 0)
                {
                    var a2 = instance_create_depth(cam_x + 700, randomy, -400, obj_minitv);
                    a2.y = ystorage;
                }
                
                if (((timer - 4) % 20) == 0)
                {
                    var a3 = instance_create_depth(cam_x + 700, randomy, -400, obj_minitv);
                    a3.y = ystorage;
                }
                
                if (((timer - 6) % 20) == 0)
                {
                }
                
                if (timer == 240)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_cloud_sio);
                    instance_destroy(obj_rain_sio);
                    instance_destroy(obj_minitv);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 4:
                var boxoffset = sin(((timer - 17) / 90) * (2 * pi)) * 10;
                global.topoffset = (0 - (yoffset / 3)) + boxoffset;
                global.bottomoffset = (0 - yoffset) + boxoffset;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                {
                    obj_SOUL_battle_sio.yellow = true;
                    obj_SOUL_battle_sio.down = true;
                }
                
                if (timer >= 18 && timer < 30)
                {
                    percent1++;
                    var position = animcurve_channel_evaluate(curveslower, percent1 / 12);
                    yoffset = lerp(0, 40, position);
                }
                
                if (timer >= 275 && timer < 300)
                {
                    percent2++;
                    var position2 = animcurve_channel_evaluate(curveslower, percent2 / 12);
                    yoffset = lerp(40, 0, position2);
                }
                
                if (timer == 18)
                {
                    var b1 = instance_create_depth(cam_x + 320, cam_y + 170, -405, obj_bomb_rotate);
                    b1.angle2 = 0;
                    var b2 = instance_create_depth(cam_x + 320, cam_y + 170, -405, obj_bomb_rotate);
                    b2.angle2 = 180;
                }
                
                if (timer == 30)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = false;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    a2.change = false;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    a4.change = false;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = false;
                }
                
                if (timer == 60)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = false;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    a2.change = true;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    a3.change = false;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    a4.change = true;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = false;
                }
                
                if (timer == 90)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = true;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    a2.change = false;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    a3.change = false;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    a4.change = false;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = true;
                }
                
                if (timer == 120)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = false;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    a2.change = false;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    a3.change = false;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    a4.change = true;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = false;
                }
                
                if (timer == 150)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = false;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    a2.change = true;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    a3.change = false;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    a4.change = false;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = false;
                }
                
                if (timer == 170)
                {
                    var b1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    b1.change = false;
                    var b2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    b2.change = true;
                    var b3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    b3.change = false;
                }
                
                if (timer == 190)
                {
                    var b3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    b3.change = false;
                    var b4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    b4.change = true;
                    var b5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    b5.change = false;
                }
                
                if (timer == 210)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = true;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    a2.change = true;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    a3.change = true;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    a4.change = true;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = true;
                }
                
                if (timer == 230)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = true;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    a2.change = true;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    a3.change = true;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    a4.change = true;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = true;
                }
                
                if (timer == 250)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = false;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    a2.change = false;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    a3.change = false;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    a4.change = false;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = false;
                }
                
                if (timer == 287)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_minitv_wall);
                    instance_destroy(obj_bomb_rotate);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 5:
                global.topoffset = 0;
                global.bottomoffset = 0;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                    obj_SOUL_battle_sio.yellow = true;
                
                if (timer == 18)
                {
                    instance_create_depth(cam_x + 500, cam_y + 210, -401, obj_tv_sio_2);
                    var b1 = instance_create_depth(cam_x + 320, cam_y + 170, -405, obj_bomb_rotate);
                    b1.angle2 = 0;
                    var b2 = instance_create_depth(cam_x + 320, cam_y + 170, -405, obj_bomb_rotate);
                    b2.angle2 = 180;
                }
                
                if ((timer % 58) == 0 && !instance_exists(obj_spikebarrier_2))
                    instance_create_depth(cam_x + 400, cam_y + 170, -402, obj_spikebarrier_2);
                
                if (timer == 70)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 674, cam_y + 136, -404, obj_minitv_wall);
                    a2.change = false;
                    a2.direction = 180;
                    var a4 = instance_create_depth(cam_x + 674, cam_y + 204, -404, obj_minitv_wall);
                    a4.change = false;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == 100)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    var a3 = instance_create_depth(cam_x + 674, cam_y + 170, -404, obj_minitv_wall);
                    a3.change = false;
                    a3.direction = 180;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == 130)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 674, cam_y + 136, -404, obj_minitv_wall);
                    a2.change = false;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 674, cam_y + 170, -404, obj_minitv_wall);
                    a3.change = false;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 674, cam_y + 204, -404, obj_minitv_wall);
                    a4.change = false;
                    a4.direction = 180;
                }
                
                if (timer == 160)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 674, cam_y + 136, -404, obj_minitv_wall);
                    a2.change = false;
                    a2.direction = 180;
                    var a4 = instance_create_depth(cam_x + 674, cam_y + 204, -404, obj_minitv_wall);
                    a4.change = false;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == 190)
                {
                    var a2 = instance_create_depth(cam_x + 674, cam_y + 136, -404, obj_minitv_wall);
                    a2.change = false;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 674, cam_y + 170, -404, obj_minitv_wall);
                    a3.change = false;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 674, cam_y + 204, -404, obj_minitv_wall);
                    a4.change = false;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == 220)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    var a3 = instance_create_depth(cam_x + 674, cam_y + 170, -404, obj_minitv_wall);
                    a3.change = false;
                    a3.direction = 180;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == 250)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 674, cam_y + 136, -404, obj_minitv_wall);
                    a2.change = false;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 674, cam_y + 170, -404, obj_minitv_wall);
                    a3.change = false;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 674, cam_y + 204, -404, obj_minitv_wall);
                    a4.change = false;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == 310)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_minitv_wall);
                    instance_destroy(obj_tv_sio_2);
                    instance_destroy(obj_bomb_rotate);
                    instance_destroy(obj_spikebarrier_2);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 6:
                global.topoffset = 0;
                global.bottomoffset = 0;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                    obj_SOUL_battle_sio.yellow = true;
                
                if (timer == 2)
                {
                    var a = instance_create_depth(cam_x + 670, cam_y + 170, -401, obj_tvcable_stretch_a);
                    a.image_yscale = 2;
                    var b = instance_create_depth(cam_x + 670, cam_y + 170, -401, obj_tvcable_stretch_a);
                    b.image_yscale = -2;
                }
                
                if (timer == 20)
                {
                    var a = instance_create_depth(cam_x + 670, (cam_y + 170) - 71, -401, obj_tvcable_stretch_b);
                    a.image_yscale = 2;
                }
                
                if (timer == 40)
                {
                    var a = instance_create_depth(cam_x + 670, cam_y + 170 + 71, -401, obj_tvcable_stretch_b);
                    a.image_yscale = -2;
                }
                
                if (timer == 70)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 674, cam_y + 136, -404, obj_bomb);
                    a2.speed = 6;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 674, cam_y + 170, -404, obj_minitv_wall);
                    a3.change = false;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 674, cam_y + 204, -404, obj_bomb);
                    a4.speed = 6;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == 90)
                {
                    var a = instance_create_depth(cam_x + 670, cam_y + 170, -401, obj_tvcable_stretch_a);
                    a.image_yscale = 2;
                    var b = instance_create_depth(cam_x + 670, cam_y + 170, -401, obj_tvcable_stretch_a);
                    b.image_yscale = -2;
                }
                
                if (timer == 120)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 674, cam_y + 136, -404, obj_minitv_wall);
                    a2.change = false;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 674, cam_y + 170, -404, obj_bomb);
                    a3.speed = 6;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 674, cam_y + 204, -404, obj_minitv_wall);
                    a4.change = false;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == 140)
                {
                    var a = instance_create_depth(cam_x + 670, cam_y + 170, -401, obj_tvcable_stretch_a);
                    a.image_yscale = 2;
                    var b = instance_create_depth(cam_x + 670, cam_y + 170, -401, obj_tvcable_stretch_a);
                    b.image_yscale = -2;
                }
                
                if (timer == 160)
                {
                    var a = instance_create_depth(cam_x + 670, cam_y + 170 + 71, -401, obj_tvcable_stretch_b);
                    a.image_yscale = -2;
                }
                
                if (timer == 180)
                {
                    var a = instance_create_depth(cam_x + 670, (cam_y + 170) - 71, -401, obj_tvcable_stretch_b);
                    a.image_yscale = 2;
                }
                
                if (((timer + 10) % 15) == 0 && timer >= 200)
                {
                    randomize();
                    instance_create_depth(cam_x + 670, cam_y + 170, -401, obj_bombpillars_tv);
                }
                
                if (timer == 310)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_minitv_wall);
                    instance_destroy(obj_tv_sio_2);
                    instance_destroy(obj_bomb_rotate);
                    instance_destroy(obj_spikebarrier_2);
                    instance_destroy(obj_bombpillars_tv);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 7:
                global.topoffset = 0;
                global.bottomoffset = 0;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                    obj_SOUL_battle_sio.yellow = true;
                
                if (timer == 17 || timer == 19 || timer == 21 || timer == 23 || timer == 25 || timer == 27 || timer == 29 || timer == 31 || timer == 33 || timer == 35 || timer == 37 || timer == 39)
                {
                }
                
                if (((timer - 17) % 3) == 0 && timer <= 42)
                    instance_create_depth(obj_maximike_battle.x, obj_maximike_battle.y, obj_maximike_battle.depth + 1, obj_nanomike);
                
                if (timer == 210)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_minitv_wall);
                    instance_destroy(obj_tv_sio_2);
                    instance_destroy(obj_bomb_rotate);
                    instance_destroy(obj_spikebarrier_2);
                    instance_destroy(obj_bombpillars_tv);
                    instance_destroy(obj_elec_sio_hit);
                    instance_destroy(obj_nanomike);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 8:
                global.topoffset = 0;
                global.bottomoffset = 0;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                {
                    obj_SOUL_battle_sio.yellow = true;
                    obj_SOUL_battle_sio.special = true;
                }
                
                if (timer == 10)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 380, -400, obj_minitv_wall);
                    a1.change = false;
                    var a2 = instance_create_depth(cam_x + 286, (cam_y + 380) - 420, -400, obj_minitv_wall);
                    a2.change = false;
                    a2.direction += 180;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 380, -400, obj_minitv_wall);
                    a3.change = false;
                    var a4 = instance_create_depth(cam_x + 354, (cam_y + 380) - 420, -400, obj_minitv_wall);
                    a4.change = false;
                    a4.direction += 180;
                    var a5 = instance_create_depth(cam_x + 386, cam_y + 380, -400, obj_minitv_wall);
                    a5.change = false;
                }
                
                if (timer == 30)
                {
                    var b2 = instance_create_depth(cam_x + 286, cam_y + 380, -400, obj_minitv_wall);
                    b2.change = false;
                    var b3 = instance_create_depth(cam_x + 320, (cam_y + 380) - 420, -400, obj_minitv_wall);
                    b3.change = false;
                    b3.direction += 180;
                    var b4 = instance_create_depth(cam_x + 354, cam_y + 380, -400, obj_minitv_wall);
                    b4.change = false;
                }
                
                if (timer == 40)
                    instance_create_depth(340, 190, -405, obj_middleblock);
                
                if (timer >= 93 && timer < 105)
                {
                    if (timer == 93)
                        audio_play_sound(snd_pullback, 1, false, 0.8);
                    
                    percent1++;
                    var position = animcurve_channel_evaluate(curveslower, percent1 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(90, -90, position);
                }
                
                if (timer == 100)
                {
                    var a1 = instance_create_depth(cam_x + 674, cam_y + 102, -404, obj_minitv_wall);
                    a1.change = false;
                    a1.direction = 180;
                    a1.speed = 2;
                    var a2 = instance_create_depth(cam_x + 674, cam_y + 136, -404, obj_minitv_wall);
                    a2.change = false;
                    a2.direction = 180;
                    a2.speed = 2;
                    var a4 = instance_create_depth(cam_x + 674, cam_y + 204, -404, obj_minitv_wall);
                    a4.change = false;
                    a4.direction = 180;
                    a4.speed = 2;
                    var a5 = instance_create_depth(cam_x + 674, cam_y + 238, -404, obj_minitv_wall);
                    a5.change = false;
                    a5.direction = 180;
                    a5.speed = 2;
                }
                
                if (timer >= 80 && ((timer - 80) % 44) == 0)
                {
                    var c1 = instance_create_depth(-14, 122, -404, obj_minitv_wall);
                    c1.change = false;
                    c1.direction = 0;
                    c1.speed = 8;
                    var c2 = instance_create_depth(-14, 156, -404, obj_minitv_wall);
                    c2.change = true;
                    c2.direction = 0;
                    c2.speed = 8;
                    var c4 = instance_create_depth(-14, 224, -404, obj_minitv_wall);
                    c4.change = true;
                    c4.direction = 0;
                    c4.speed = 8;
                    var c5 = instance_create_depth(-14, 258, -404, obj_minitv_wall);
                    c5.change = false;
                    c5.direction = 0;
                    c5.speed = 8;
                }
                
                if (timer >= 99 && ((timer - 99) % 44) == 0)
                {
                    var c1 = instance_create_depth(-14, 122, -404, obj_minitv_wall);
                    c1.change = true;
                    c1.direction = 0;
                    c1.speed = 8;
                    var c2 = instance_create_depth(-14, 156, -404, obj_minitv_wall);
                    c2.change = false;
                    c2.direction = 0;
                    c2.speed = 8;
                    var c4 = instance_create_depth(-14, 224, -404, obj_minitv_wall);
                    c4.change = false;
                    c4.direction = 0;
                    c4.speed = 8;
                    var c5 = instance_create_depth(-14, 258, -404, obj_minitv_wall);
                    c5.change = true;
                    c5.direction = 0;
                    c5.speed = 8;
                }
                
                if (timer == 285)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_tv_sio);
                    instance_destroy(obj_minitv_wall);
                    instance_destroy(obj_spikebarrier);
                    instance_destroy(obj_middleblock);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 9:
                global.topoffset = 0;
                global.bottomoffset = 0;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                {
                    obj_SOUL_battle_sio.yellow = true;
                    obj_SOUL_battle_sio.special = true;
                }
                
                var switch0 = 400;
                var switch1 = 268;
                var switch2 = 218;
                var switch3 = 168;
                var switch4 = 118;
                var switch5 = 68;
                var switch6 = 18;
                
                if (timer == switch0)
                {
                    var a1 = instance_create_depth(cam_x + 460, cam_y + 98, -404, obj_minitv_wall_2);
                    a1.change = true;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 460, cam_y + 132, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 460, cam_y + 166, -404, obj_minitv_wall_2);
                    a3.change = false;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 460, cam_y + 200, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 460, cam_y + 234, -404, obj_minitv_wall_2);
                    a5.change = true;
                    a5.direction = 180;
                }
                
                if (timer == switch1)
                {
                    var a1 = instance_create_depth(cam_x + 240, cam_y + 98, -404, obj_minitv_wall_2);
                    a1.change = false;
                    a1.direction = 0;
                    var a2 = instance_create_depth(cam_x + 240, cam_y + 132, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = 0;
                    var a3 = instance_create_depth(cam_x + 240, cam_y + 166, -404, obj_minitv_wall_2);
                    a3.change = true;
                    a3.direction = 0;
                    var a4 = instance_create_depth(cam_x + 240, cam_y + 200, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = 0;
                    var a5 = instance_create_depth(cam_x + 240, cam_y + 234, -404, obj_minitv_wall_2);
                    a5.change = false;
                    a5.direction = 0;
                }
                
                if (timer == switch2)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 90, -404, obj_minitv_wall_2);
                    a1.change = true;
                    a1.direction = -90;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 90, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = -90;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 90, -404, obj_minitv_wall_2);
                    a3.change = false;
                    a3.direction = -90;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 90, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = -90;
                    var a5 = instance_create_depth(cam_x + 388, cam_y + 90, -404, obj_minitv_wall_2);
                    a5.change = true;
                    a5.direction = -90;
                }
                
                if (timer == switch3)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 250, -404, obj_minitv_wall_2);
                    a1.change = false;
                    a1.direction = 90;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 250, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = 90;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 250, -404, obj_minitv_wall_2);
                    a3.change = true;
                    a3.direction = 90;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 250, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = 90;
                    var a5 = instance_create_depth(cam_x + 388, cam_y + 250, -404, obj_minitv_wall_2);
                    a5.change = false;
                    a5.direction = 90;
                }
                
                if (timer == switch4)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 90, -404, obj_minitv_wall_2);
                    a1.change = true;
                    a1.direction = -90;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 90, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = -90;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 90, -404, obj_minitv_wall_2);
                    a3.change = false;
                    a3.direction = -90;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 90, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = -90;
                    var a5 = instance_create_depth(cam_x + 388, cam_y + 90, -404, obj_minitv_wall_2);
                    a5.change = true;
                    a5.direction = -90;
                }
                
                if (timer == switch5)
                {
                    var a1 = instance_create_depth(cam_x + 240, cam_y + 98, -404, obj_minitv_wall_2);
                    a1.change = false;
                    a1.direction = 0;
                    var a2 = instance_create_depth(cam_x + 240, cam_y + 132, -404, obj_minitv_wall_2);
                    a2.change = true;
                    a2.direction = 0;
                    var a3 = instance_create_depth(cam_x + 240, cam_y + 166, -404, obj_minitv_wall_2);
                    a3.change = false;
                    a3.direction = 0;
                    var a4 = instance_create_depth(cam_x + 240, cam_y + 200, -404, obj_minitv_wall_2);
                    a4.change = true;
                    a4.direction = 0;
                    var a5 = instance_create_depth(cam_x + 240, cam_y + 234, -404, obj_minitv_wall_2);
                    a5.change = false;
                    a5.direction = 0;
                }
                
                if (timer == switch6)
                {
                    var a1 = instance_create_depth(cam_x + 460, cam_y + 98, -404, obj_minitv_wall_2);
                    a1.change = true;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 460, cam_y + 132, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 460, cam_y + 166, -404, obj_minitv_wall_2);
                    a3.change = true;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 460, cam_y + 200, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 460, cam_y + 234, -404, obj_minitv_wall_2);
                    a5.change = true;
                    a5.direction = 180;
                }
                
                if (timer >= (switch1 - 6) && timer < (switch1 + 18))
                {
                    if (timer == (switch1 - 6))
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent1++;
                    var position = animcurve_channel_evaluate(curveslower, percent1 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(-180, -90, position);
                }
                
                if (timer >= (switch2 - 6) && timer < (switch2 + 18))
                {
                    if (timer == (switch2 - 6))
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent2++;
                    var position = animcurve_channel_evaluate(curveslower, percent2 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(0, -180, position);
                }
                
                if (timer >= (switch3 - 6) && timer < (switch3 + 18))
                {
                    if (timer == (switch3 - 6))
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent3++;
                    var position = animcurve_channel_evaluate(curveslower, percent3 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(-180, 0, position);
                }
                
                if (timer >= (switch4 - 6) && timer < (switch4 + 18))
                {
                    if (timer == (switch4 - 6))
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent4++;
                    var position = animcurve_channel_evaluate(curveslower, percent4 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(-90, -180, position);
                }
                
                if (timer >= (switch5 - 6) && timer < (switch5 + 18))
                {
                    if (timer == (switch5 - 6))
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent6++;
                    var position = animcurve_channel_evaluate(curveslower, percent6 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(90, -90, position);
                }
                
                if (timer == 320)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_minitv_wall_2);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 10:
                global.topoffset = 40;
                global.bottomoffset = 40;
                global.leftoffset = 0;
                global.rightoffset = 0;
                var leftx = cam_x + 275;
                var rightx = cam_x + 365;
                var bottomy = cam_y + 240;
                var topy = cam_y + 100;
                var midx = cam_x + 320;
                var midy = cam_y + 170;
                randomize();
                var randomy = irandom_range(topy, bottomy) + global.topoffset;
                
                if (instance_exists(obj_SOUL_battle_sio))
                {
                    obj_SOUL_battle_sio.yellow = true;
                    obj_SOUL_battle_sio.up = true;
                }
                
                if (timer == 18)
                {
                    var cloud = instance_create_depth(cam_x + 320, cam_y + 80, -402, obj_cloud_sio);
                    cloud.xx = cam_x + 320;
                    cloud.spawnblue = true;
                    cloud.image_xscale = 2.4;
                    cloud.image_blend = c_gray;
                }
                
                if ((timer % 20) == 0)
                    var x1 = instance_create_depth(340, 230, -400, obj_thunder_spots);
                
                if (timer == 280)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_cloud_sio);
                    instance_destroy(obj_rain_sio_hit);
                    instance_destroy(obj_minitv);
                    instance_destroy(obj_thunder_spots);
                    instance_destroy(obj_thunder);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 11:
                global.topoffset = 40;
                global.bottomoffset = 40;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                {
                    obj_SOUL_battle_sio.yellow = true;
                    obj_SOUL_battle_sio.up = true;
                }
                
                if (timer == 18)
                {
                    instance_create_depth(cam_x + 320, cam_y + 66, -400, obj_sun);
                    obj_sun.altered = true;
                }
                
                var randomchoice = irandom_range(0, 1);
                
                if ((timer % 40) == 0 && !((timer % 80) == 0))
                {
                    if (randomchoice == 0)
                        instance_create_depth(cam_x + 258, cam_y + 360, -400, obj_fire_sio);
                    else
                        instance_create_depth(cam_x + 382, cam_y + 360, -400, obj_fire_sio);
                }
                
                if ((timer % 80) == 0)
                {
                    if (randomchoice == 0)
                        instance_create_depth(cam_x + 284, cam_y + 360, -400, obj_fire_sio);
                    else
                        instance_create_depth(cam_x + 356, cam_y + 360, -400, obj_fire_sio);
                }
                
                if (timer == 300)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_sun);
                    instance_destroy(obj_sunray);
                    instance_destroy(obj_fire_sio);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 12:
                global.topoffset = 0;
                global.bottomoffset = 0;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                {
                    obj_SOUL_battle_sio.yellow = true;
                    obj_SOUL_battle_sio.special = true;
                }
                
                var switch0 = 18;
                var switch1 = 68;
                var switch2 = 113;
                var switch3 = 158;
                var switch4 = 203;
                var switch5 = 248;
                var switch6 = 293;
                var switch7 = 338;
                
                if (timer == 18)
                {
                    var a1 = instance_create_depth(cam_x + 460, cam_y + 98, -404, obj_minitv_wall_2);
                    a1.change = true;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 460, cam_y + 132, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 460, cam_y + 166, -404, obj_minitv_wall_2);
                    a3.change = false;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 460, cam_y + 200, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 460, cam_y + 234, -404, obj_minitv_wall_2);
                    a5.change = true;
                    a5.direction = 180;
                }
                
                if (timer == switch1)
                {
                    var a1 = instance_create_depth(cam_x + 240, cam_y + 98, -404, obj_minitv_wall_2);
                    a1.change = false;
                    a1.direction = 0;
                    var a2 = instance_create_depth(cam_x + 240, cam_y + 132, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = 0;
                    var a3 = instance_create_depth(cam_x + 240, cam_y + 166, -404, obj_minitv_wall_2);
                    a3.change = true;
                    a3.direction = 0;
                    var a4 = instance_create_depth(cam_x + 240, cam_y + 200, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = 0;
                    var a5 = instance_create_depth(cam_x + 240, cam_y + 234, -404, obj_minitv_wall_2);
                    a5.change = false;
                    a5.direction = 0;
                }
                
                if (timer == switch2)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 90, -404, obj_minitv_wall_2);
                    a1.change = true;
                    a1.direction = -90;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 90, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = -90;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 90, -404, obj_minitv_wall_2);
                    a3.change = false;
                    a3.direction = -90;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 90, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = -90;
                    var a5 = instance_create_depth(cam_x + 388, cam_y + 90, -404, obj_minitv_wall_2);
                    a5.change = true;
                    a5.direction = -90;
                }
                
                if (timer == switch3)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 250, -404, obj_minitv_wall_2);
                    a1.change = false;
                    a1.direction = 90;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 250, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = 90;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 250, -404, obj_minitv_wall_2);
                    a3.change = true;
                    a3.direction = 90;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 250, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = 90;
                    var a5 = instance_create_depth(cam_x + 388, cam_y + 250, -404, obj_minitv_wall_2);
                    a5.change = false;
                    a5.direction = 90;
                }
                
                if (timer == switch4)
                {
                    var a1 = instance_create_depth(cam_x + 252, cam_y + 90, -404, obj_minitv_wall_2);
                    a1.change = true;
                    a1.direction = -90;
                    var a2 = instance_create_depth(cam_x + 286, cam_y + 90, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = -90;
                    var a3 = instance_create_depth(cam_x + 320, cam_y + 90, -404, obj_minitv_wall_2);
                    a3.change = false;
                    a3.direction = -90;
                    var a4 = instance_create_depth(cam_x + 354, cam_y + 90, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = -90;
                    var a5 = instance_create_depth(cam_x + 388, cam_y + 90, -404, obj_minitv_wall_2);
                    a5.change = true;
                    a5.direction = -90;
                }
                
                if (timer == switch5)
                {
                    var a1 = instance_create_depth(cam_x + 400, cam_y + 98, -404, obj_minitv_wall_2);
                    a1.change = false;
                    a1.direction = 180;
                    var a2 = instance_create_depth(cam_x + 400, cam_y + 132, -404, obj_minitv_wall_2);
                    a2.change = true;
                    a2.direction = 180;
                    var a3 = instance_create_depth(cam_x + 400, cam_y + 166, -404, obj_minitv_wall_2);
                    a3.change = false;
                    a3.direction = 180;
                    var a4 = instance_create_depth(cam_x + 400, cam_y + 200, -404, obj_minitv_wall_2);
                    a4.change = true;
                    a4.direction = 180;
                    var a5 = instance_create_depth(cam_x + 400, cam_y + 234, -404, obj_minitv_wall_2);
                    a5.change = false;
                    a5.direction = 180;
                }
                
                if (timer == switch6)
                {
                    var a1 = instance_create_depth(cam_x + 240, cam_y + 98, -404, obj_minitv_wall_2);
                    a1.change = false;
                    a1.direction = 0;
                    var a2 = instance_create_depth(cam_x + 240, cam_y + 132, -404, obj_minitv_wall_2);
                    a2.change = false;
                    a2.direction = 0;
                    var a3 = instance_create_depth(cam_x + 240, cam_y + 166, -404, obj_minitv_wall_2);
                    a3.change = true;
                    a3.direction = 0;
                    var a4 = instance_create_depth(cam_x + 240, cam_y + 200, -404, obj_minitv_wall_2);
                    a4.change = false;
                    a4.direction = 0;
                    var a5 = instance_create_depth(cam_x + 240, cam_y + 234, -404, obj_minitv_wall_2);
                    a5.change = false;
                    a5.direction = 0;
                }
                
                if (timer >= switch1 && timer < (switch1 + 18))
                {
                    if (timer == switch1)
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent1++;
                    var position = animcurve_channel_evaluate(curveslower, percent1 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(90, -90, position);
                }
                
                if (timer >= switch2 && timer < (switch2 + 18))
                {
                    if (timer == switch2)
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent2++;
                    var position = animcurve_channel_evaluate(curveslower, percent2 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(-90, -180, position);
                }
                
                if (timer >= switch3 && timer < (switch3 + 18))
                {
                    if (timer == switch3)
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent3++;
                    var position = animcurve_channel_evaluate(curveslower, percent3 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(-180, 0, position);
                }
                
                if (timer >= switch4 && timer < (switch4 + 18))
                {
                    if (timer == switch4)
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent4++;
                    var position = animcurve_channel_evaluate(curveslower, percent4 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(0, 180, position);
                }
                
                if (timer >= switch5 && timer < (switch5 + 18))
                {
                    if (timer == switch5)
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent5++;
                    var position = animcurve_channel_evaluate(curveslower, percent5 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(180, 90, position);
                }
                
                if (timer >= switch6 && timer < (switch6 + 18))
                {
                    if (timer == switch6)
                        audio_play_sound(snd_pullback, 1, false, 0.7);
                    
                    percent6++;
                    var position = animcurve_channel_evaluate(curveslower, percent6 / 10);
                    obj_SOUL_battle_sio.specialangle = lerp(90, -90, position);
                }
                
                if (timer == 320)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_minitv_wall_2);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            case 13:
                global.topoffset = 40;
                global.bottomoffset = 40;
                global.leftoffset = 0;
                global.rightoffset = 0;
                
                if (instance_exists(obj_SOUL_battle_sio))
                {
                    obj_SOUL_battle_sio.yellow = true;
                    obj_SOUL_battle_sio.up = true;
                }
                
                if (timer == 18)
                    var s1 = instance_create_depth(cam_x + 320, cam_y + 66, -400, obj_sun);
                
                if ((timer % 50) == 0 && !((timer % 100) == 0))
                {
                    var a1 = instance_create_depth(cam_x + 258, cam_y + 360, -400, obj_fire_sio);
                    var a2 = instance_create_depth(cam_x + 382, cam_y + 360, -400, obj_fire_sio);
                }
                
                if ((timer % 100) == 0)
                {
                    var b1 = instance_create_depth(cam_x + 284, cam_y + 360, -400, obj_fire_sio);
                    var b2 = instance_create_depth(cam_x + 356, cam_y + 360, -400, obj_fire_sio);
                }
                
                if (timer == 300)
                {
                    alpha = 1;
                    spawn = false;
                    instance_destroy(obj_sun);
                    instance_destroy(obj_sunray);
                    instance_destroy(obj_fire_sio);
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
            default:
                randomize();
                var randomturn = irandom_range(2, 12);
                turn = randomturn;
                
                if (timer == 100)
                {
                    alpha = 1;
                    spawn = false;
                    obj_SOUL_battle_sio.ending = true;
                }
                
                break;
        }
    }
}

draw_sprite_ext(sprite_index, image_index, x, y + global.topoffset, 1, 1, 0, c_white, alpha);

if (timer >= 17 && spawn)
{
    draw_rectangle_color(cam_x + 249 + global.leftoffset, cam_y + 99 + global.topoffset, cam_x + 390 + global.rightoffset, cam_y + 240 + global.bottomoffset, c_black, c_black, c_black, c_black, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 98 + global.topoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 95 + global.topoffset, cam_x + 248 + global.leftoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 245 + global.leftoffset, cam_y + 241 + global.bottomoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
    draw_rectangle_color(cam_x + 391 + global.rightoffset, cam_y + 95 + global.topoffset, cam_x + 394 + global.rightoffset, cam_y + 244 + global.bottomoffset, green, green, green, green, 0);
}
else
{
    alpha = 1;
    image_speed = 1;
    
    if (timer >= 150)
    {
        if (!ENGINE.generator1)
        {
            if (instance_exists(obj_generator1_sio))
                obj_generator1_sio.fade = true;
        }
        
        if (instance_exists(obj_generator2_sio))
        {
            if (!ENGINE.generator2)
                obj_generator2_sio.fade = true;
        }
    }
}

if (instance_exists(obj_battle_sio))
{
    if (global.alldown)
    {
        image_speed = 0;
        exit;
    }
}
