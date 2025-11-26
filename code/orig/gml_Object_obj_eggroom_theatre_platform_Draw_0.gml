if (place_meeting(x, y, obj_kris_c3))
    depth = -y + 80;
else if (obj_kris_c3.x >= 310)
    depth = -y + 15;
else
    depth = -y - 80;

draw_self();
draw_sprite_ext(spr_ch3_theatre_camera, obj_eggroom_theatre_camera.image_index, x, y - 36, 2, 2, 0, c_white, 1);
