shader_set(shader_Distort);
var tmultiplier = 0.2;
var xmultiplier = 1.5;
var ymultiplier = 2.5;

if (instance_exists(obj_battle_sof))
{
    if (global.alldown)
    {
        image_speed = 0;
        speed = 0;
    }
    else
    {
        time = current_time;
    }
}

shader_set_uniform_f(uniTime, time * tmultiplier);
var tex_sprite = sprite_get_texture(sprite_index, image_index);
shader_set_uniform_f(uniTexel, texture_get_texel_width(tex_sprite) * xmultiplier, texture_get_texel_height(tex_sprite) * ymultiplier);
draw_self();
shader_reset();
