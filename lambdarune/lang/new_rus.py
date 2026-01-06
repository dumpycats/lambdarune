import json

orig_en = json.load(open("./lambdarune/lang/en/lang.json", "r", encoding="utf-8"))
orig_ru = json.load(open("./lambdarune/lang/ru/lang.json", "r", encoding="utf-8"))

new_en = json.load(open("./code/lambda_lang_en.json", "r", encoding="utf-8"))
new_ru = {}

translation_map = {}
for key in orig_en.keys():
    if key in orig_ru:
        translation_map[orig_en[key]] = orig_ru[key]

for key, val in new_en.items():
    if val in new_ru.values():
        print(val)
    if val in translation_map:
        new_ru[key] = translation_map[val]
    else:
        new_ru[key] = orig_ru.get(key, "")

json.dump(new_ru, open("./lambdarune/lang/ru/lang_.json", "w+", encoding="utf-8"), 
          ensure_ascii=False, indent=4)

print(f"Создано {len(new_ru)} записей")
print(f"Переведено: {sum(1 for v in new_ru.values() if v)}")
print(f"Не переведено: {sum(1 for v in new_ru.values() if not v)}")