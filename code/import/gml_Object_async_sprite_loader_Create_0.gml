directory = working_directory + "lang/" + global.lang + "/spr/";

if (variable_global_exists("translation_sprite_map"))
{
    var sprites = ds_map_values_to_array(global.translation_sprite_map);
    
    for (var i = 0; i < array_length(sprites); i++)
        sprite_delete(sprites[i]);
}

global.translation_sprite_map = ds_map_create();
sprite_map = global.translation_sprite_map;

sprites_to_load = ds_list_create();
sprites_properties = json_decode(file_text_read_all(directory + "sprites.json", "{}"));

file = file_find_first(directory + "*.png", 0);

while (file != "")
{
    ds_list_add(sprites_to_load, file);
    file = file_find_next();
}

global.translation_sprites_loaded = false;