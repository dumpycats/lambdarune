function translation_load_all()
{
    ini_open("lang.ini");
    global.lang = ini_read_string("Lang", "lang", "ru");
    ini_close();

    translation_load_strings();
    translation_load_sprites();
}
 
