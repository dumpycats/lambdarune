function translation_sprite_add(sprite_name, path, sprite_properties, sprite_map)
{
    log("Adding new sprite: " + sprite_name);
    var frames = ds_map_find_value_safe(sprite_properties, "frames", 1);
    var ox = -real(ds_map_find_value_safe(sprite_properties, "xoffset", 0));
    var oy = real(ds_map_find_value_safe(sprite_properties, "yoffset", 0));
    var new_sprite = sprite_add(path, frames, false, false, ox, oy);
    ds_map_add(sprite_map, sprite_name, new_sprite);
}
