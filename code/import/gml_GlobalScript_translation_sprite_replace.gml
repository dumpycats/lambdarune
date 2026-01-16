function translation_sprite_replace(orig_sprite, path, sprite_properties)
{
    log("Replacing sprite: " + sprite_get_name(orig_sprite));
    var frames = ds_map_find_value_safe(sprite_properties, "frames", sprite_get_number(orig_sprite));
    var ox = sprite_get_xoffset(orig_sprite);
    var oy = sprite_get_yoffset(orig_sprite);

    if (!variable_global_exists("translation_sprites_loaded"))
    {
        ox += -real(ds_map_find_value_safe(sprite_properties, "xoffset", 0));
        oy += real(ds_map_find_value_safe(sprite_properties, "yoffset", 0));
    }
    sprite_replace(orig_sprite, path, frames, false, false, ox, oy);
}