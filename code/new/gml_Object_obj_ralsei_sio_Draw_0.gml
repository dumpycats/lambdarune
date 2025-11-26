draw_self();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (flashtrigger)
{
    flashpercent += 0.1;
    
    if (flashpercent == 0.1)
    {
        if (!audio_is_playing(snd_power))
            audio_play_sound(snd_power, 1, false);
        
        if (instance_exists(obj_battle_sio))
        {
            var greenhp = instance_create_depth(x - 6, y - 6, depth - 3, obj_krisdamage);
            
            if ((itemchoice + global.ralseihp) > 0 && global.ralseihp <= 0)
                greenhp.up = true;
            
            global.ralseihp += itemchoice;
            global.ralseihp = clamp(global.ralseihp, -999, 140);
            greenhp.image_blend = c_lime;
            greenhp.value = itemchoice;
            
            if (global.ralseihp >= global.ralseimaxhp)
                greenhp.maximum = true;
            
            var greenspark = instance_create_depth(x - 20, y, depth - 2, oSpareStar);
            greenspark.image_blend = c_lime;
            greenspark.image_angle = -90;
            var greenspark1 = instance_create_depth(x - 30, y - 10, depth - 2, oSpareStar);
            greenspark1.image_blend = c_lime;
            greenspark1.image_angle = -90;
            var greenspark2 = instance_create_depth(x + 10, y + 14, depth - 2, oSpareStar);
            greenspark2.image_blend = c_lime;
            greenspark2.image_angle = -90;
            var greenspark3 = instance_create_depth(x - 10, y + 20, depth - 2, oSpareStar);
            greenspark3.image_blend = c_lime;
            greenspark3.image_angle = -90;
            var greenspark4 = instance_create_depth(x + 10, y - 14, depth - 2, oSpareStar);
            greenspark4.image_blend = c_lime;
            greenspark4.image_angle = -90;
        }
    }
    
    if (flashpercent <= 0.5)
        flashalpha += 0.2;
    else
        flashalpha -= 0.2;
    
    if (flashpercent == 1)
    {
        flashtrigger = false;
        flashalpha = 0;
    }
}
else
{
    flashpercent = 0;
}
