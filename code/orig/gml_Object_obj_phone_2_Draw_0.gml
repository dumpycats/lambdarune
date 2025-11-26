var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        timer++;
        subimg += 0.2;
        image_alpha = timer / 10;
        
        if (!paused)
        {
            randomize();
            var randomchange = random_range(1, 1.4);
            image_angle = sin((timer / 1.4) * pi) * (2.3 * randomchange);
        }
    }
}

if (switchcharacter)
{
    randomize();
    characterid = irandom_range(0, 100);
    
    if (characterid == 66)
        characterpick = 66;
    else if (characterid >= 75)
        characterpick = 6;
    else if (characterid >= 50)
        characterpick = 1;
    else if (characterid >= 25)
        characterpick = 0;
    
    switchcharacter = false;
}

y = yy + (sin((timer / 100) * (2 * pi)) * 4);
draw_sprite_ext(spr_phone_2, 0, x, y, 2, 2, image_angle, c_white, image_alpha);

if (trigger)
{
    draw_sprite_ext(spr_phonebubble, subimg, x - 120, y, 2.6, 2.6, 0, c_white, image_alpha);
    
    if (characterpick == 0)
        draw_sprite_ext(spr_phoneheads, 0, x - 120, y + 4, 2, 2, 0, c_white, image_alpha);
    else if (characterpick == 1)
        draw_sprite_ext(spr_phoneheads, 1, x - 120, y + 4, 2, 2, 0, c_white, image_alpha);
    else if (characterpick == 6)
        draw_sprite_ext(spr_phoneheads, 2, x - 120, y + 4, 2, 2, 0, c_white, image_alpha);
    else if (characterpick == 66)
        draw_sprite_ext(spr_phoneheads, 3, x - 120, y + 4, 2, 2, 0, c_white, image_alpha);
}
