function translation_get_sprite(arg0)
{
    return ds_map_find_value_safe(global.translation_sprite_map, arg0, 0);
}
