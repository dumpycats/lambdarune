draw_self();
shader_set(sh_wavewarp);
var freqboost = 1;
var tex2 = sprite_get_texture(spr_ch3_theatre_glow, 0);
var uvs2 = sprite_get_uvs(spr_ch3_theatre_glow, 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_time"), current_time / 1000);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_amplitude"), 0.0005);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_frequency"), 100 * freqboost);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_speed"), 0.5);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_rainbow_speed"), 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_saturation"), 0);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_uv_top_left"), uvs2[0], uvs2[1]);
shader_set_uniform_f(shader_get_uniform(sh_wavewarp, "u_uv_bottom_right"), uvs2[2], uvs2[3]);
texture_set_stage(0, tex2);
shader_set_uniform_i(shader_get_uniform(sh_wavewarp, "u_texture"), 0);

if (on)
    draw_sprite_ext(spr_ch3_theatre_glow, 0, 320, 240, 2, 2, 0, c_white, 1/3);

shader_reset();
