directory = working_directory + "lang/" + global.lang + "/spr/";

if (variable_global_exists("translation_sprite_map"))
{
    var sprites = ds_map_values_to_array(global.translation_sprite_map);
    
    for (var i = 0; i < array_length(sprites); i++)
        sprite_delete(sprites[i]);

    ds_map_delete(global.translation_sprite_map);
}

global.translation_sprite_map = ds_map_create();
sprite_map = global.translation_sprite_map;

sprites_to_load = ds_list_create();

sprites_properties = json_decode(file_text_read_all(directory + "sprites.json", "{}"));
heavy_sprites_to_load = ds_list_create();

if variable_global_exists("translation_sprites_loaded") or global.lang != "en"
{
    file = file_find_first(directory + "*.png", 0);

    while (file != "")
    {
        if (os_type == os_android)
        {
            //по какой-то причине на андроиде file_bin_size не работает
            ds_list_add(heavy_sprites_to_load, file);
        }
        else
        {
            var bin = file_bin_open(directory + file, );

            if (file_bin_size(bin) > 10240) // 10 KB
                ds_list_add(heavy_sprites_to_load, file);
            else
                ds_list_add(sprites_to_load, file);

            file_bin_close(bin);
        }
        file = file_find_next();
    }
    loading_frame = true;
}
else
{
    ds_list_add(sprites_to_load, "spr_translation_switch.png");
    loading_frame = false;
}

global.intro_done = false;

function get_sprite_real_name(input_string) {
    var result = "";
    var make_upper = false;
    
    for (var i = 1; i <= string_length(input_string); i++) {
        var char = string_char_at(input_string, i);
        
        if (char == "@") 
        {
            make_upper = true;
        } 
        else 
        {
            if (make_upper) 
            {
                result += string_upper(char);
                make_upper = false;
            }
            else
            {
                result += char;
            }
        }
    }
    
    return result;
}

function load_sprite_from_list(list)
{
    var file = ds_list_find_value(list, 0);

    var sprite_name = get_sprite_real_name(string_replace_all(string_replace_all(file, ".png", ""), directory, ""));
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
}