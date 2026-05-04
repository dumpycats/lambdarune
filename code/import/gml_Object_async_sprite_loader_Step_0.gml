if (!global.intro_done)
{
    if (ds_list_size(sprites_to_load) == 0)
        exit;
    
    log("Started loading sprite. " + string(ds_list_size(sprites_to_load)) + " remaining.");
    
    load_sprite_from_list(sprites_to_load);

    ds_list_delete(sprites_to_load, 0);
}
else if (loading_frame)
{
    loading_frame = false;
}
else
{
    if (ds_list_size(sprites_to_load) > 0)
    {
        for (var i = 0; i < ds_list_size(sprites_to_load); i++)
        {
            ds_list_add(heavy_sprites_to_load, ds_list_find_value(sprites_to_load, i));
        }
    }
    ds_list_destroy(sprites_to_load);

    log("Started loading large sprites. Remaining: " + string(ds_list_size(heavy_sprites_to_load)))

    while true
    {
        if (ds_list_size(heavy_sprites_to_load) == 0)
        {
            global.translation_sprites_loaded = true;
            ds_list_destroy(heavy_sprites_to_load);
            instance_destroy();
            log("All sprites loaded.");
            break;
        }

        log("Started loading large sprite. " + string(ds_list_size(heavy_sprites_to_load)) + " remaining.");

        load_sprite_from_list(heavy_sprites_to_load);

        ds_list_delete(heavy_sprites_to_load, 0);
    }
}