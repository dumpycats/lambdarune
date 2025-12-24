function translation_load_strings()
{
    var file = working_directory + "lang/" + global.lang + "/lang.json";

    global.lang_map = json_decode(file_text_read_all(file, "{}"));
}
