import json

json1 = set(json.load(open("./en/lang.json", "r")).keys())
json2 = set(json.load(open("./ru/lang.json", "r")).keys())

print(json1 - json2)
print(json2 - json1)