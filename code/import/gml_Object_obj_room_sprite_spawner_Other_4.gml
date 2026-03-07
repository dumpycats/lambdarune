var room_name = room_get_name(room);
var spr_list = ds_map_find_value_safe(global.sprite_spawner_data, room_name, undefined);

if (spr_list == undefined)
    return;

var layer_id;

if (!layer_exists("translation_layer"))
    layer_id = layer_create(0, "translation_layer");
else
    layer_id = layer_get_id("translation_layer");

for (var i = 0; i < ds_list_size(spr_list); i += 1)
{
    var spr_data = ds_list_find_value(spr_list, i);
    var spr_name = ds_map_find_value(spr_data, "sprite", 0);
    var xx = ds_map_find_value_safe(spr_data, "x", 0);
    var yy = ds_map_find_value_safe(spr_data, "y", 0);
    var instance = instance_create_layer(xx, yy, layer_id, obj_empty_sprite);
    log("Created instance, name: " + spr_name + " xx: " + string(xx) + " yy: " + string(yy));
    instance.sprite_index = ds_map_find_value_safe(global.translation_sprite_map, spr_name, asset_get_index(spr_name));
    instance.depth = ds_map_find_value_safe(spr_data, "depth", 0);
    instance.image_xscale = ds_map_find_value_safe(spr_data, "xscale", 1);
    instance.image_yscale = ds_map_find_value_safe(spr_data, "yscale", 1);
}
