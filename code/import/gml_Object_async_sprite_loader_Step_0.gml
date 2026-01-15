for (var i = 0; i < 2; i++)
{
    log("Started loading sprite. " + string(ds_list_size(sprites_to_load)) + " remaining.");
    var file = ds_list_find_value(sprites_to_load, 0);

    var sprite_name = string_replace_all(string_replace_all(file, ".png", ""), directory, "");
    var orig_sprite = asset_get_index(sprite_name);
    var sprite_properties = ds_map_find_value_safe(sprites_properties, sprite_name, json_decode("{}"));
    var ox = 0;
    var oy = 0;
    
    if (sprite_exists(orig_sprite))
    {
        log("Replacing sprite: " + sprite_name);
        var frames = ds_map_find_value_safe(sprite_properties, "frames", sprite_get_number(orig_sprite));
        ox = sprite_get_xoffset(orig_sprite);
        oy = sprite_get_yoffset(orig_sprite);
        
        if (!variable_global_exists("translation_sprites_loaded"))
        {
            ox += -real(ds_map_find_value_safe(sprite_properties, "xoffset", 0));
            oy += real(ds_map_find_value_safe(sprite_properties, "yoffset", 0));
        }
        
        sprite_replace(orig_sprite, directory + file, frames, false, false, ox, oy);
    }
    else
    {
        log("Adding new sprite: " + sprite_name);
        var frames = ds_map_find_value_safe(sprite_properties, "frames", 1);
        ox += -real(ds_map_find_value_safe(sprite_properties, "xoffset", 0));
        oy += real(ds_map_find_value_safe(sprite_properties, "yoffset", 0));
        var new_sprite = sprite_add(directory + file, frames, false, false, ox, oy);
        ds_map_add(sprite_map, sprite_name, new_sprite);
    }

    ds_list_delete(sprites_to_load, 0);

    if (ds_list_size(sprites_to_load) == 0)
    {
        global.translation_sprites_loaded = true;
        ds_list_destroy(sprites_to_load);
        instance_destroy();
        log("All sprites loaded.");
        break;
    }
}
