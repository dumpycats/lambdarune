# ЛЯМБДАРУН

> Локализация игры LambdaRune на русский язык. Создана командой DumpyCats.

В этом репозитории вы можете найти ресурсы и инструменты, нужные для патча игры.

## Скачать

Скачать перевод можно в наших соцсетях:
- TG [t.me/TheDumpyCats](https://t.me/TheDumpyCats)
- VK [vk.com/club233732755](https://vk.com/club233732755)

## Папки

```
lambdarune/
├── lambdarune-orig/    # Оригинальный билд (без data.win!)
├── lambdarune/         # Модифицированная сборка
│   └── lang/           # Файлы локализации
├── code/               # Модифицированный код игры
├── fonts/              # Русские шрифты
├── sprite_import/      # Большие спрайты для отдельного импорта
├── tools/              # Наши внутренник утилиты
│   ├── text_sprite_generator/ # Создание текста оригинальным шрифтом
│   └── sprite_gluer.html # "Склейка" изображений спрайтов
└── NAMES.txt           # Глоссарий перевода
```

## Ручная сборка

Для сборки проекта вам необходимо скачать [оригинальный](https://gamejolt.com/games/lambdarune/960010) билд игры.

Открываем файл data.win в [UndertaleModTool](https://github.com/UnderminersTeam/UndertaleModTool). Там нужно выполнить импорты ассетов в строгой последовательности: (скрипты для этого находятся в Scripts/Resource Importers/)

1. ImportGraphics.csx - папка lambdarune/sprite_import
2. ImportGML.csx - папка lambdarune/code/import
3. ImportGML.csx - папка lambdarune/code/new
4. ImportFonts.csx - папка lambdarune/fonts

В папку игры (рядом с LAMBDARUNE.exe) необходимо положить папку lambdarune/lang (как в папке /lang/lang)



*здесь был нбд*
