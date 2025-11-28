function get_lang_string(key)
{
    return ds_map_find_value_safe(global.lang_map, key, "--missing-string--");
}