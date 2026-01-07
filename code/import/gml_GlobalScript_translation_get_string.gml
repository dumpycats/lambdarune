function translation_get_string(arg0)
{
    arg0 = string(arg0);
    return ds_map_find_value_safe(global.lang_map, arg0, "NoKey:" + arg0);
}
