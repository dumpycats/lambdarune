if (!global.intro_done)
{
    if (ds_list_size(sprites_to_load) == 0)
        exit;
    
    log("Started loading sprite. " + string(ds_list_size(sprites_to_load)) + " remaining.");
    var file = ds_list_find_value(sprites_to_load, 0);

    var sprite_name = string_replace_all(string_replace_all(file, ".png", ""), directory, "");
    var orig_sprite = asset_get_index(sprite_name);
    var sprite_properties = ds_map_find_value_safe(sprites_properties, sprite_name, json_decode("{}"));

    if (sprite_exists(orig_sprite))
    {        
        translation_sprite_replace(orig_sprite, directory + file, sprite_properties);
    }
    else
    {
        translation_sprite_add(sprite_name, directory + file, sprite_properties, sprite_map);
    }

    ds_list_delete(sprites_to_load, 0);
}
else
{
    if (ds_list_size(sprites_to_load) > 0)
    {
        for (var i = 0; i < ds_list_size(sprites_to_load); i++)
        {
            ds_list_add(heavy_sprites_to_load, ds_list_find_value(sprites_to_load, i));
        }
    }
    ds_list_destroy(sprites_to_load);

    log("Started loading large sprites. Remaining: " + string(heavy_sprites_to_load))

    while true
    {
        if (ds_list_size(heavy_sprites_to_load) == 0)
        {
            global.translation_sprites_loaded = true;
            ds_list_destroy(heavy_sprites_to_load);
            instance_destroy();
            log("All sprites loaded.");
            break;
        }

        log("Started loading large sprite. " + string(ds_list_size(heavy_sprites_to_load)) + " remaining.");

        var file = ds_list_find_value(heavy_sprites_to_load, 0);

        var sprite_name = string_replace_all(string_replace_all(file, ".png", ""), directory, "");
        var orig_sprite = asset_get_index(sprite_name);
        var sprite_properties = ds_map_find_value_safe(sprites_properties, sprite_name, json_decode("{}"));

        if (sprite_exists(orig_sprite))
        {        
            translation_sprite_replace(orig_sprite, directory + file, sprite_properties);
        }
        else
        {
            translation_sprite_add(sprite_name, directory + file, sprite_properties, sprite_map);
        }

        ds_list_delete(heavy_sprites_to_load, 0);
    }
}
