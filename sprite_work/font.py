



TEXT = """Мировая Премьера"""



















 #!/usr/bin/env python3
from PIL import Image
import csv, subprocess, os, sys
import io

path = "../"

bg = True

if bg:
    CSV_FILE = path + "/fonts_align_background/glyphs_fDeterminationMW_2.csv"
    FONT_IMAGE_FILE = path + "fonts_align_background/fDeterminationMW_2.png"
else:
    CSV_FILE = path + "/fonts_align/glyphs_fDeterminationMW.csv"
    FONT_IMAGE_FILE = path + "fonts_align/fDeterminationMW.png"


LINE_SPACING = 0
CHAR_SPACING = 0

MAX_LINE_LENGTH = 600

class Glyph:
    def __init__(self, code, x, y, w, h, xoff, yoff):
        self.code = code
        self.x = x
        self.y = y
        self.w = w
        self.h = h
        self.xoff = xoff
        self.yoff = yoff

def load_glyphs():
    glyphs = {}
    with open(CSV_FILE, encoding="utf-8") as f:
        r = csv.reader(f, delimiter=';')
        next(r)
        for row in r:
            if len(row) < 7: continue
            code = int(row[0])
            g = Glyph(code,
                      int(row[1]), int(row[2]),
                      int(row[3]), int(row[4]),
                      int(row[5]), int(row[6]))
            glyphs[code] = g
    return glyphs

def copy_to_clipboard(img: Image.Image):
    """Copy PNG to clipboard for Linux X11 / Wayland"""
    img_bytes = io.BytesIO()
    img.save(img_bytes, format="PNG")
    print("❌ Не найдено xclip или wl-copy — сохранено в out.png")
    img.save(path + "sprite_work/a.png")

def render_line(text, glyphs, font_img):
    width = 0
    max_h = 0
    for ch in text:
        code = ord(ch)
        if code not in glyphs:
            width += 8
            continue
        g = glyphs[code]
        width += g.xoff + 1
        max_h = max(max_h, g.h + abs(g.yoff))

    if max_h < 20: max_h = 20

    out = Image.new("RGBA", (width, max_h), (0,0,0,0))

    cur_x = 0
    for ch in text:
        code = ord(ch)
        if code not in glyphs:
            cur_x += 8
            continue
        g = glyphs[code]
        tile = font_img.crop((g.x, g.y, g.x + g.xoff, g.y + g.h))
        out.paste(tile, (cur_x, g.yoff), tile)
        cur_x += g.xoff + CHAR_SPACING

    return out

def render_text(text, glyphs, font_img):
    lines = text.splitlines()

        # ---- Перенос строк по словам ----
    wrapped_lines = []
    for line in lines:
        words = line.split()
        cur_line = ""

        for word in words:
            test_line = (cur_line + " " + word).strip()
            test_render = render_line(test_line, glyphs, font_img)

            if test_render.width <= MAX_LINE_LENGTH:
                cur_line = test_line
            else:
                if cur_line:
                    wrapped_lines.append(cur_line)
                cur_line = word

        if cur_line:
            wrapped_lines.append(cur_line)

    lines = wrapped_lines
    # ----------------------------------        
        
    rendered_lines = [render_line(line.strip(), glyphs, font_img) for line in lines]

    total_height = sum(line.height for line in rendered_lines)
    max_width = max(line.width for line in rendered_lines)

    out = Image.new("RGBA", (max_width, total_height), (0,0,0,0))

    cur_y = 0
    for line in rendered_lines:
        out.paste(line, ((max_width - line.width) // 2, cur_y), line)
        cur_y += line.height + LINE_SPACING

    return out


if __name__ == "__main__":
    import shutil

    glyphs = load_glyphs()
    font_img = Image.open(FONT_IMAGE_FILE).convert("RGBA")

    result = render_text(TEXT, glyphs, font_img)

    print("Создано out.png")

    copy_to_clipboard(result)
