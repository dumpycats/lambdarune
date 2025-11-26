shader_set(shader_Distort);
var tmultiplier = 0.2;
var xmultiplier = 1.5;
var ymultiplier = 2;
shader_set_uniform_f(uniTime, current_time * tmultiplier);
var tex_sprite = sprite_get_texture(sprite_index, image_index);
shader_set_uniform_f(uniTexel, texture_get_texel_width(tex_sprite) * xmultiplier, texture_get_texel_height(tex_sprite) * ymultiplier);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
shader_reset();
