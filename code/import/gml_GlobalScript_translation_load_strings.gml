function translation_load_strings()
{
    var file = global.translation_folder + "lang.json";
    global.lang_map = json_decode(file_text_read_all(file, "{}"));
}
