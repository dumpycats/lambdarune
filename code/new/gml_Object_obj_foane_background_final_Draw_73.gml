if (!surface_exists(surf_game))
    surf_game = surface_create(640, 480);

surface_set_target(surf_game);
var _app_w = surface_get_width(application_surface);
var _app_h = surface_get_height(application_surface);
var _scale_factor = 640 / _app_w;
draw_surface_ext(application_surface, 0, 0, _scale_factor, _scale_factor, 0, c_white, 1);

if (instance_exists(obj_SOUL_battle_sof))
{
    with (obj_SOUL_battle_sof)
        draw_sprite_ext(sprite_index, image_index, x - 20, y - 20, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    SOULy = obj_SOUL_battle_sof.y;
    
    if (obj_SOUL_battle_sof.moving)
        SOULx = obj_SOUL_battle_sof.x;
}

surface_reset_target();
