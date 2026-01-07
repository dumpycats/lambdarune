function translation_load_sprites()
{
    var directory = working_directory + "lang/" + global.lang + "/spr/";
    var sprites_properties = json_decode(file_text_read_all(directory + "sprites.json", "{}"));
    var file = file_find_first(directory + "*.png", 0);
    
    if (variable_global_exists("translation_sprite_map"))
    {
        var sprites = ds_map_values_to_array(global.translation_sprite_map);
        
        for (var i = 0; i < array_length(sprites); i++)
            sprite_delete(sprites[i]);
    }
    
    global.translation_sprite_map = ds_map_create();
    var sm = global.translation_sprite_map;
    
    while (file != "")
    {
        var sprite_name = string_replace_all(string_replace_all(file, ".png", ""), directory, "");
        var orig_sprite = asset_get_index(sprite_name);
        var sprite_properties = ds_map_find_value_safe(sprites_properties, sprite_name, json_decode("{}"));
        var ox = 0;
        var oy = 0;
        
        if (sprite_exists(orig_sprite))
        {
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
            var frames = ds_map_find_value_safe(sprite_properties, "frames", 1);
            ox += -real(ds_map_find_value_safe(sprite_properties, "xoffset", 0));
            oy += real(ds_map_find_value_safe(sprite_properties, "yoffset", 0));
            var new_sprite = sprite_add(directory + file, frames, false, false, ox, oy);
            ds_map_add(sm, sprite_name, new_sprite);
        }
        
        file = file_find_next();
    }
    
    global.translation_sprites_loaded = true;
}
