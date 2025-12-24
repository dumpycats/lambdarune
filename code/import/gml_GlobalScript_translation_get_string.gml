function translation_get_string(key)
{
    key = string(key)
    return ds_map_find_value_safe(global.lang_map, key, "NoKey:" + key);
}