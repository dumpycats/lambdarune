var advance = keyboard_check(vk_enter) || keyboard_check(ord("Z"));
timer++;

if (timer <= 10)
    image_alpha += 0.1;
else if (advancetimer >= 0)
    image_alpha -= 0.1;

if (advance && timer > 10)
{
    advancetimer++;
    
    if (instance_exists(obj_cablecutscene_1))
        obj_cablecutscene_1.speed = -12;
    
    if (instance_exists(obj_cablecutscene_2))
        obj_cablecutscene_2.speed = 12;
    
    create = true;
}

image_alpha = clamp(image_alpha, 0, 1);

if (create)
{
    createtimer++;
    
    if (createtimer == 0)
    {
        instance_create_depth(660, 239, 79, obj_cablecutscenepull_1);
        instance_create_depth(-20, 239, 79, obj_cablecutscenepull_2);
    }
    
    if (createtimer == 30)
    {
        instance_create_depth(320, 240, 110, obj_redpurple_flare);
        obj_redpurple_flare.image_index = 1;
        audio_play_sound(snd_noise, 1, false, 1, false, 1.1);
        audio_play_sound(snd_deep_noise, 1, true, 1, false, 1.1);
    }
    
    if (createtimer == 50)
        instance_create_depth(320, 264, 50, obj_ignorewarning_c3);
}
