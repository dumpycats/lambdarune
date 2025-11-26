draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, image_blend, 0.5);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, 0, image_blend, 1);
draw_sprite_ext(spr_lantern, subimg, x, y, 2, 2, 0, c_white, 1);
draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 4, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, cake, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 7, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, alpha);
subimg += (1/30);
hue += 0.125;
hue %= 255;

if (hue >= 255)
    hue = 0;

image_blend = make_color_hsv(hue, 255, 255);

if (trigger)
{
    percent1++;
    
    if (percent1 <= 60)
    {
        obj_susie_e3.image_index = 0;
        var position = animcurve_channel_evaluate(curveease, percent1 / 60);
        alpha = lerp(0, 1/3, position);
        
        if (instance_exists(obj_queen_e3) && room == rm_ch3_epilogue)
            instance_destroy(obj_queen_e3);
    }
}
