s = "ыьэюяё"

# Читаем CSV
with open("./glyphs_fDeterminationMW_2.csv", "r") as f:
    lines = f.read().splitlines()

header = lines[0]  # Сохраняем заголовок
csv_data = []

# Обрабатываем остальные строки
for line in lines[1:]:
    if line:  # если строка не пустая
        parts = line.split(';')
        csv_data.append(parts)

# Собираем все уникальные символы из s
unique_chars = set()
for line in s.splitlines():
    for char in line:
        unique_chars.add(char)

# Обрабатываем символы: сдвигаем на 2 пикселя по X
for char in unique_chars:
    char_code = str(ord(char))
    for row in csv_data:
        if row[0].strip('"') == char_code:
            row[1] = str(int(row[1]) + 2)
            break

# Записываем результат
with open("glyphs_fDeterminationMW_2.csv", "w") as f:
    f.write(header + '\n')
    for row in csv_data:
        f.write(';'.join(row) + '\n')