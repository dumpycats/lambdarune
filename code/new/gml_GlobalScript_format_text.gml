function format_text(arg0, arg1)
{
    var words = string_split(arg0, lang("format_text_0"));
    var formatted_text = lang("format_text_1");
    var current_length = 2;
    
    for (var i = 0; i < array_length(words); i++)
    {
        var word = words[i];
        
        if ((current_length + string_length(word)) > arg1)
        {
            formatted_text += (lang("format_text_2") + word);
            current_length = 2 + string_length(word);
        }
        else
        {
            if (current_length > 2)
            {
                formatted_text += lang("format_text_3");
                current_length += 1;
            }
            
            formatted_text += word;
            current_length += string_length(word);
        }
    }
    
    return formatted_text;
}
