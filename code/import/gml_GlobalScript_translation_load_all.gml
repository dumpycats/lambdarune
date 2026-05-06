function translation_load_all()
{
    global.translation_logging_enabled = false;

    var system_lang = os_get_language();

    var default_lang = "en";
    if (system_lang == "ru" or system_lang == "uk" or system_lang == "be" or system_lang == "kk")
        default_lang = "ru";

    ini_open("lang.ini");
    global.lang = ini_read_string("Lang", "lang", default_lang);
    ini_close();
    global.translation_folder = working_directory + "lang/" + global.lang + "/";

    translation_load_strings();
    var loader = instance_create_layer(0, 0, "Instances", async_sprite_loader);
    loader.persistent = true;

    global.sLambdaruneLogo = (global.lang == "ru") ? sLambdaruneLogo_ru : sLambdaruneLogo;
    global.sLambdaruneBlackLogoOut = (global.lang == "ru") ? sLambdaruneBlackLogoOut_ru : sLambdaruneBlackLogoOut;
    global.sLambdaruneBlackLogoMid2 = (global.lang == "ru") ? sLambdaruneBlackLogoMid2_ru : sLambdaruneBlackLogoMid2;
    global.sLambdaruneBlackLogoMid = (global.lang == "ru") ? sLambdaruneBlackLogoMid_ru : sLambdaruneBlackLogoMid;

    sprite_set_offset(sLambdaruneLogo_ru, 300, 120);
    sprite_set_offset(sLambdaruneBlackLogoMid_ru, 320, 70);
    sprite_set_offset(sLambdaruneBlackLogoMid2_ru, 320, 70);
    sprite_set_offset(sLambdaruneBlackLogoOut_ru, 320, 70);

    var layer_id;
    if (!layer_exists("translation_layer"))
        layer_id = layer_create(0, "translation_layer");
    else
        layer_id = layer_get_id("translation_layer");

    if (!instance_exists(obj_room_sprite_spawner))
        instance_create_layer(0, 0, layer_id, obj_room_sprite_spawner);    
}
