function log(str)
{
    if variable_global_exists("translation_logging_enabled") && !global.translation_logging_enabled
    {
        log = function(){};
        exit;
    }
    var file = file_text_open_append(working_directory + "log.txt");
    var date = date_current_datetime();
    var time = string(date_get_hour(date)) + ":" + string(date_get_minute(date)) + ":" + string(date_get_second(date));
    file_text_write_string(file, "[" + time + "] " + string(str) + "\n");
    file_text_close(file);
}