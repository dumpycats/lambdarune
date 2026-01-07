function ds_map_find_value_safe(arg0, arg1, arg2)
{
    if (ds_map_exists(map, value))
        return ds_map_find_value(map, value);
    else
        return default_value;
}
