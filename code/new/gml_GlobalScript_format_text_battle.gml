function format_text_battle(arg0, arg1)
{
    var words = string_split(arg0, translation_get_string("gml_GlobalScript_format_text_battle_0"));
    var formatted_text = translation_get_string("gml_GlobalScript_format_text_battle_1");
    var current_length = 0;
    
    for (var i = 0; i < array_length(words); i++)
    {
        var word = words[i];
        
        if ((current_length + string_length(word)) > arg1)
        {
            formatted_text += (translation_get_string("gml_GlobalScript_format_text_battle_2") + word);
            current_length = string_length(word);
        }
        else
        {
            if (current_length > 0)
            {
                formatted_text += translation_get_string("gml_GlobalScript_format_text_battle_3");
                current_length += 1;
            }
            
            formatted_text += word;
            current_length += string_length(word);
        }
    }
    
    return formatted_text;
}
