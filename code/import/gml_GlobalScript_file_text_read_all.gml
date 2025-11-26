function file_text_read_all(path)
{
    var text = "";
    
    if (file_exists(path))
    {
        var file = file_text_open_read(path);
        
        while (!file_text_eof(file))
        {
            text += file_text_read_string(file);
            file_text_readln(file);
            
            if (!file_text_eof(file))
                text += "\n";
        }
        
        file_text_close(file);
    }
    else if argument_count > 1
    {
        return argument[1];
    }

    return text;
}