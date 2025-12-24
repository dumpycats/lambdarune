
# Папка, где лежат все спрайты
BASE_DIR = r""

# Куда
OUTPUT_DIR = r""


# Путь к JSON файлу с информацией о спрайтах, тебе это не надо
JSON_PATH = r""







 
import os
from PIL import Image
import json
import sys


if not os.path.exists(OUTPUT_DIR):
    os.makedirs(OUTPUT_DIR)

sprites_info = {}

for sprite_name in os.listdir(BASE_DIR):
    sprite_path = os.path.join(BASE_DIR, sprite_name)
    if not os.path.isdir(sprite_path):
        continue

    print(f"\n🔍 Обработка спрайта: {sprite_name}")
    frame_files = sorted(
        [f for f in os.listdir(sprite_path) if f.lower().endswith((".png", ".jpg"))]
    )

    if not frame_files:
        print(f"⚠️  В папке '{sprite_name}' не найдено кадров (.png или .jpg)")
        continue

    actual_frames = []
    for f in frame_files:
        try:
            num = int(os.path.splitext(f)[0].split("_")[-1])
            actual_frames.append(num)
        except ValueError:
            print(f"⚠️  Пропускаю файл без номера кадра: {f}")

    if not actual_frames:
        print(f"⚠️  Не удалось определить номера кадров в '{sprite_name}' — пропускаю.")
        continue

    expected_frames = list(range(min(actual_frames), max(actual_frames) + 1))
    missing = sorted(set(expected_frames) - set(actual_frames))
    if missing:
        print(f"❌ В спрайте '{sprite_name}' отсутствуют кадры: {missing}")
        input("Добавь недостающие кадры и нажми Enter для продолжения...")
        sys.exit(1)

    frames = []
    for f in sorted(frame_files, key=lambda x: int(os.path.splitext(x)[0].split("_")[-1])):
        path = os.path.join(sprite_path, f)
        try:
            frames.append(Image.open(path))
        except Exception as e:
            print(f"⚠️  Не удалось открыть {f}: {e}")

    if not frames:
        print(f"⚠️  Нет загруженных кадров для '{sprite_name}', пропускаю.")
        continue

    widths, heights = zip(*(img.size for img in frames))
    total_width = sum(widths)
    max_height = max(heights)

    new_img = Image.new("RGBA", (total_width, max_height))
    x_offset = 0
    for img in frames:
        new_img.paste(img, (x_offset, 0))
        x_offset += img.width

    output_path = os.path.join(OUTPUT_DIR, f"{sprite_name}.png")
    new_img.save(output_path)
    print(f"✅ Экспортировано: {output_path}")

    sprites_info[sprite_name] = {"frames": str(len(frames))}

#with open(JSON_PATH, "w", encoding="utf-8") as f:
#    json.dump(sprites_info, f, indent=4, ensure_ascii=False)

#print(f"\n✅ JSON сохранён в {JSON_PATH}")
