if (place_meeting(x, y, obj_kris_c3) && global.vaultopen && trigger)
    image_alpha += 0.16666666666666666;
else if (place_meeting(x, y, obj_susie_c3) && global.vaultopen && trigger)
    image_alpha += 0.16666666666666666;
else if (place_meeting(x, y, obj_ralsei_c3) && global.vaultopen && trigger)
    image_alpha += 0.16666666666666666;
else if (!instance_exists(obj_blackscreen_fadein))
    image_alpha -= 0.16666666666666666;

image_alpha = clamp(image_alpha, 0, 1);
