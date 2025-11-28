function translation_get_sptite(name)
{
    return ds_map_find_value_safe(global.translation_sprite_map, name, 0);
}
