if (CRT.ShaderOn)
{
    shader_set(SHD_CRT);
    shader_set_uniform_f_array(UCRTParams, CRT.Params);
}

var display_w = display_get_width();
var display_h = display_get_height();
var surf_w = surface_get_width(application_surface);
var surf_h = surface_get_height(application_surface);
var windowpositionx = (display_w - surf_w) / 2;
gpu_set_blendenable(false);

if (window_get_fullscreen())
    draw_surface_ext(application_surface, windowpositionx, 0, 1, 1, 0, c_white, 1);
else
    draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);

gpu_set_blendenable(true);
shader_reset();
