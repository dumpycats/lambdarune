#Скрипт чтобы чекнуть соответствие лангов

import json

json1 = set(json.load(open("./en/lang.json", "r")).keys())
json2 = set(json.load(open("./ru/lang.json", "r")).keys())

if len(json1 - json2) == len(json2 - json1) == 0:
    print("Ланги соответствуют")
else:
    print(json1 - json2)
    print(json2 - json1)