function translation_load_all()
{
    ini_open("lang.ini");
    global.lang = ini_read_string("Lang", "lang", "ru");
    ini_close();
    translation_load_strings();
    var loader = instance_create_layer(0, 0, "Instances", async_sprite_loader);
    loader.persistent = true;
}
