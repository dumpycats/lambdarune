var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_self();
draw_sprite_ext(spr_eggtree_l3_g, 0, x + l3x, y + l3y, scale, scale, 0, c_white, 1);
draw_sprite_ext(spr_eggtree_l4_g, 0, x + l4x, y + l4y, scale, scale, 0, c_white, 1);
timer++;
l4x = sin((timer * pi) / 44) * 1;
l4y = sin((timer * pi) / 75) * 1;
l3x = sin((timer * pi) / 38) * 2;
l3y = sin((timer * pi) / 63) * 2;

if (interacttimer >= 0)
    advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
else
    advance_pressed = 0;

if (advance_pressed)
    interacttimer = -2;

interacttimer++;

if (place_meeting(x, y, obj_kris_c3) && global.playermove)
{
    if (advance_pressed)
    {
        if (dialogue == 1)
            reset_dialogue_normal();
        
        talking = true;
        global.playermove = false;
        obj_kris_c3.image_speed = 0;
        obj_kris_c3.image_index = 0;
    }
}
