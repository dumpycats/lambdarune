function ds_map_find_value_safe(map, value, default_value)
{
    if (ds_map_exists(map, value))
        return ds_map_find_value(map, value);
    else
        return default_value;
}
