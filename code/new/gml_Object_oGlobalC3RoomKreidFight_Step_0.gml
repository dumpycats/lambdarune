var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
initialtimer++;

if (initialtimer == 10)
{
    if (!(room == rm_ch3_debug))
        obj_kris_c3.fall = true;
}

if (room == rm_ch3_debug)
{
    timer++;
    
    if (timer == 60)
    {
    }
    
    if (keyboard_check_pressed(ord("Z")))
        room_goto(rm_ch3_kreidfight);
    
    if (keyboard_check_pressed(ord("X")))
        room_goto(rm_ch3_kreidfight_skip);
    
    if (keyboard_check_pressed(ord("E")))
        room_goto(rm_ch3_fountain);
    
    if (keyboard_check_pressed(ord("W")))
        room_goto(rm_ch3_plane);
    
    if (keyboard_check_pressed(ord("1")))
        room_goto(rChapterSelect);
    
    if (keyboard_check_pressed(ord("2")))
        room_goto(rm_ch3_promo);
    
    if (keyboard_check_pressed(ord("3")))
        room_goto(rm_ch3credits_installment2);
    
    if (keyboard_check_pressed(ord("4")))
        room_goto(rm_ch3_planegate);
    
    if (keyboard_check_pressed(ord("5")))
        room_goto(rm_ch3_theatre);
    
    if (keyboard_check_pressed(ord("Q")))
        room_goto(rm_ch3_primflower);
    
    if (keyboard_check_pressed(ord("R")))
        room_goto(rm_ch3_maximike);
    
    if (keyboard_check_pressed(ord("T")))
        room_goto(rm_ch3_maximike_skip);
    
    if (keyboard_check_pressed(ord("6")))
        room_goto(rm_ch3_pathout);
    
    if (keyboard_check_pressed(ord("7")))
        room_goto(rm_ch3_epilogue);
    
    if (keyboard_check_pressed(ord("8")))
        room_goto(rm_ch3_resolution);
    
    if (keyboard_check_pressed(ord("V")))
        room_goto(rChapter3Room1);
    
    if (keyboard_check_pressed(ord("B")))
        room_goto(rChapter3Room2);
    
    if (keyboard_check_pressed(ord("9")))
        room_goto(rm_ch3_epilogue_end);
    
    if (keyboard_check_pressed(ord("Y")))
        room_goto(rm_ch3_knight);
    
    if (keyboard_check_pressed(ord("H")))
        room_goto(rm_ch3_screenroom);
    
    if (keyboard_check_pressed(ord("G")))
        room_goto(rm_ch3_spacechannel_1);
    
    if (keyboard_check_pressed(ord("J")))
        room_goto(rm_ch3_foane);
    
    if (keyboard_check_pressed(ord("K")))
        room_goto(rm_ch3_sof_skip);
    
    if (keyboard_check_pressed(ord("D")))
        room_goto(rm_ch3_sof);
    
    if (keyboard_check_pressed(ord("L")))
        room_goto(rm_ch3_foaneend);
    
    if (keyboard_check_pressed(ord("M")))
        room_goto(rm_ch3_foanepath);
    
    if (keyboard_check_pressed(ord("U")))
        room_goto(rm_ch3_cathodetower_aftermath);
    
    if (keyboard_check_pressed(ord("I")))
        room_goto(rm_ch3_cathodetower_final);
    
    if (keyboard_check_pressed(ord("P")))
        room_goto(rm_ch3_eggroom_old);
    
    if (keyboard_check_pressed(ord("0")))
        room_goto(rm_ch3_eggroom);
    
    if (keyboard_check_pressed(ord("O")))
        room_goto(rm_ch3_eggroom_tree);
}

if (cloudfinal)
{
    timer++;
    
    if (timer == 0)
    {
        obj_c3_sky.finalpanning = true;
        var cloud1 = instance_create_depth(cam_x + 320, cam_y + 800, obj_c3_sky.depth - 8, obj_clouddepth);
        cloud1.image_index = 0;
        cloud1.up = true;
        cloud1.duration = 360;
        cloud1.image_alpha = 1;
        var cloud2 = instance_create_depth(cam_x + 320, cam_y + 800, obj_c3_sky.depth - 7, obj_clouddepth);
        cloud2.image_index = 1;
        cloud2.up = true;
        cloud2.duration = 390;
        cloud2.image_alpha = 0.9;
        cloud2.offset = -60;
        var cloud3 = instance_create_depth(cam_x + 320, cam_y + 800, obj_c3_sky.depth - 6, obj_clouddepth);
        cloud3.image_index = 2;
        cloud3.up = true;
        cloud3.duration = 420;
        cloud3.image_alpha = 0.8;
        cloud3.offset = -120;
        var cloud4 = instance_create_depth(cam_x + 320, cam_y + 800, obj_c3_sky.depth - 5, obj_clouddepth);
        cloud4.image_index = 3;
        cloud4.up = true;
        cloud4.duration = 450;
        cloud4.image_alpha = 0.7;
        cloud4.offset = -180;
        var cloud5 = instance_create_depth(cam_x + 320, cam_y + 800, obj_c3_sky.depth - 4, obj_clouddepth);
        cloud5.image_index = 4;
        cloud5.up = true;
        cloud5.duration = 480;
        cloud5.image_alpha = 0.6;
        cloud5.offset = -240;
        var cloud6 = instance_create_depth(cam_x + 320, cam_y + 800, obj_c3_sky.depth - 3, obj_clouddepth);
        cloud6.image_index = 5;
        cloud6.up = true;
        cloud6.duration = 510;
        cloud6.image_alpha = 0.5;
        cloud6.offset = -300;
        var cloud7 = instance_create_depth(cam_x + 320, cam_y + 800, obj_c3_sky.depth - 2, obj_clouddepth);
        cloud7.image_index = 6;
        cloud7.up = true;
        cloud7.duration = 525;
        cloud7.image_alpha = 0.4;
        cloud7.offset = -330;
    }
}

if (global.alldown)
{
    if (instance_exists(obj_SOUL_battle))
    {
        obj_SOUL_battle.image_speed = 0;
        obj_SOUL_battle.moving = false;
    }
    
    gameovertimer++;
    
    if (gameovertimer == 30)
        room_goto(rm_gameover_c3);
    
    if (!instance_exists(obj_battlecheck))
        instance_create_depth(x, y, depth, obj_battlecheck);
    
    if (instance_exists(obj_SOUL_battle))
    {
        obj_battlecheck.x = obj_SOUL_battle.x;
        obj_battlecheck.y = obj_SOUL_battle.y;
    }
    else
    {
        obj_battlecheck.x = cam_x + 320;
        obj_battlecheck.y = cam_y + 170;
    }
    
    obj_battlecheck.target = room;
    exit;
}
