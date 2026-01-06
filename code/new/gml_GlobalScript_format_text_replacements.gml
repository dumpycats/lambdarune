function format_text_replacements(arg0)
{
    arg0 = string_replace_all(arg0, "@", ".");
    arg0 = string_replace_all(arg0, "}", "?");
    arg0 = string_replace_all(arg0, "{", "!");
    return arg0;
}
