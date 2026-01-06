import os
import re
import json

TARGET_DIR = "/home/yartom/Downloads/lambdarune/code/orig"
OUTPUT_JSON = "/home/yartom/Downloads/lambdarune/code/lambda_lang_en.json"
VALID_EXTENSIONS = {".gml", ".c", ".cpp", ".js", ".txt"}

string_regex = re.compile(r'"((?:[^"\\]|\\.)*)"')

# какие функции мы НЕ трогаем
EXCLUDE_FUNC_REGEX = re.compile(
    r'\b(?:ds_map_find_value(?:_safe)?|animcurve_get_channel|ord|ini_read_real|shader_get_uniform|ini_write_real|ini_open|ds_map_add)\s*\(',
    re.IGNORECASE
)


localization = {}

def is_excluded(line, string_start):
    for match in EXCLUDE_FUNC_REGEX.finditer(line):
        start = match.start()
        # если кавычка идёт после вызова функции и до закрывающей скобки
        if start < string_start:
            # ищем первую закрывающую скобку после вызова
            paren_level = 0
            for i in range(start, len(line)):
                if line[i] == '(':
                    paren_level += 1
                elif line[i] == ')':
                    paren_level -= 1
                    if paren_level == 0:
                        # если кавычки попали в эту область — исключаем
                        return i > string_start
    return False

for root, _, files in os.walk(TARGET_DIR):
    for filename in files:
        filepath = os.path.join(root, filename)
        filename_without_ext = os.path.splitext(filename)[0]

        with open(filepath, "r", encoding="utf-8") as f:
            lines = f.readlines()

        modified_lines = []
        key_counter = 0  # Нумерация ключей чисто внутри файла

        for line in lines:
            found = list(string_regex.finditer(line))
            new_line = line
            offset = 0

            for match in found:
                original = match.group(1)
                original = original.encode('utf-8').decode('unicode_escape')
                start, end = match.span()

                if is_excluded(line, start):
                    continue

                if ("next_char" in line) or ("case" in line) or ("displayed_text" in line):
                    continue
                
                if original in ["", "\n", "?", "!", "%", "+", "kris", "susie", "ralsei", "error", "yesno"]:
                    continue

                if filename_without_ext in ["gml_GlobalScript_format_text_replacements", "gml_Object_oSOUL_Step_0", "gml_GlobalScript_scr_InvLerp", "gml_GlobalScript_format_text", "gml_Object_oCRT_Create_0"]:
                    continue

                key = f"{filename_without_ext}_{key_counter}"
                key_counter += 1

                localization[key] = original

                replacement = f'get_lang_string("{key}")'
                new_line = (
                    new_line[:start + offset] +
                    replacement +
                    new_line[end + offset:]
                )
                offset += len(replacement) - (end - start)

            modified_lines.append(new_line)

        with open(filepath.replace("orig", "new"), "w", encoding="utf-8") as f:
             f.writelines(modified_lines)

with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
    json.dump(localization, f, ensure_ascii=False, indent=4)
