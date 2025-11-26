draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + (triggertimer / 60), image_yscale + (triggertimer / 60), 0, blend, image_alpha - (triggertimer / 42));

if (triggered)
    triggertimer++;

draw_set_alpha(1);
shader_set(sh_wavewarp);
var tex1 = sprite_get_texture(sprite_index, 0);
var uvs1 = sprite_get_uvs(sprite_index, 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_time"), current_time / 1000);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_amplitude"), 0.002);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_frequency"), 100);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_speed"), 0.6);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_rainbow_speed"), 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_saturation"), 1);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_uv_top_left"), uvs1[0], uvs1[1]);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_uv_bottom_right"), uvs1[2], uvs1[3]);
texture_set_stage(0, tex1);
shader_set_uniform_i(shader_get_uniform(sh_wavewarp, "u_texture"), 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
shader_reset();
draw_self();
