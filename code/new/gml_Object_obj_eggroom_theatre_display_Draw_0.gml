var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (!surface_exists(surf))
    surf = surface_create(360, 184);

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
gpu_set_colorwriteenable(1, 1, 1, 0);
draw_set_color(c_white);
draw_rectangle(0, 0, 360, 184, false);
gpu_set_colorwriteenable(1, 1, 1, 1);
var x1 = cx + 140;
var y1 = cy + 36;
var surf_x = x - x1;
var surf_y = y - y1;
shader_set(sh_wavewarp);
var tex1 = sprite_get_texture(sprite_index, 0);
var uvs1 = sprite_get_uvs(sprite_index, 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_time"), current_time / 1000);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_amplitude"), 0.001);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_frequency"), 100 * freqboost);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_speed"), 0.5);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_rainbow_speed"), 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_saturation"), 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_uv_top_left"), uvs1[0], uvs1[1]);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_uv_bottom_right"), uvs1[2], uvs1[3]);
texture_set_stage(0, tex1);
shader_set_uniform_i(shader_get_uniform(sh_wavewarp, "u_texture"), 0);
draw_sprite_ext(sprite_index, image_index, surf_x, surf_y, image_xscale, image_yscale, 0, c_white, image_alpha);
shader_reset();
surface_reset_target();
draw_surface(surf, x1, y1);
