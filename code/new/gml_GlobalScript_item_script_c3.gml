function get_item_name(arg0)
{
    return ds_map_find_value(ds_map_find_value(global.item_data, arg0), "name");
}

function get_item_hover(arg0)
{
    return ds_map_find_value(ds_map_find_value(global.item_data, arg0), "hover");
}

function get_item_heal(arg0)
{
    return ds_map_find_value(ds_map_find_value(global.item_data, arg0), "heal");
}

function get_item_short(arg0)
{
    return ds_map_find_value(ds_map_find_value(global.item_data, arg0), "short");
}

function assign_item_use(arg0, arg1, arg2)
{
    itemfullname = get_item_name(arg1);
    
    with (arg2)
        itemchoice = arg1;
}
