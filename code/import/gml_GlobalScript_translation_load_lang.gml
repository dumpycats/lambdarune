function translation_load_lang()
{
    var file = working_directory + "ru/lang_ru.json";

    global.lang_map = json_decode(file_text_read_all(file, "{}"));
}
