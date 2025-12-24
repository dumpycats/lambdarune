TEXT = """руки тянутся к закладкам"""

LINE_SPACING = 0
CHAR_SPACING = 0

MAX_LINE_LENGTH = 300










from PIL import Image
import csv, subprocess, os, sys
import io

path = os.path.dirname(__file__)
CSV_FILE = os.path.join(path, "glyphs_fDeterminationMW.csv")
FONT_IMAGE_FILE = os.path.join(path, "fDeterminationMW.png")
OUTPUT_FOLDER = os.path.join(path, "frames")

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

def save(img: Image.Image):
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

    if not wrapped_lines and text:
        wrapped_lines = [""]
        
    lines = wrapped_lines
        
    rendered_lines = [render_line(line.strip(), glyphs, font_img) for line in lines]

    if not rendered_lines:
        return Image.new("RGBA", (1, 1), (0,0,0,0))

    total_height = sum(line.height for line in rendered_lines)
    max_width = max(line.width for line in rendered_lines)

    out = Image.new("RGBA", (max_width, total_height), (0,0,0,0))

    cur_y = 0
    for line in rendered_lines:
        x_offset = (max_width - line.width) // 2
        out.paste(line, (x_offset, cur_y), line)
        cur_y += line.height + LINE_SPACING

    return out


def create_animation_frames(text, glyphs, font_img):
    os.makedirs(OUTPUT_FOLDER, exist_ok=True)
    
    for file in os.listdir(OUTPUT_FOLDER):
        if file.endswith(".png"):
            os.remove(os.path.join(OUTPUT_FOLDER, file))
    
    normalized_text = text.rstrip()
    
    all_chars = []
    lines = normalized_text.splitlines()
    
    for line_idx, line in enumerate(lines):
        if line.strip() == "":
            all_chars.append("\n")
        else:
            words = line.split()
            for word_idx, word in enumerate(words):
                if word_idx > 0:
                    all_chars.append(" ")
                for char in word:
                    all_chars.append(char)
            if line_idx < len(lines) - 1:
                all_chars.append("\n")
    
    frame_num = 0
    current_text = ""
    
    empty_frame = render_text("", glyphs, font_img)
    empty_frame_path = os.path.join(OUTPUT_FOLDER, f"{frame_num:04d}.png")
    empty_frame.save(empty_frame_path)
    frame_num += 1
    
    for char in all_chars:
        current_text += char
        
        frame = render_text(current_text, glyphs, font_img)
        
        frame_path = os.path.join(OUTPUT_FOLDER, f"{frame_num:04d}.png")
        frame.save(frame_path)
        frame_num += 1
    
    print(f"Создано {frame_num} кадров в папке {OUTPUT_FOLDER}")

if __name__ == "__main__":
    import shutil
    
    glyphs = load_glyphs()
    font_img = Image.open(FONT_IMAGE_FILE).convert("RGBA")
    
    result = render_text(TEXT, glyphs, font_img)
    result.save(os.path.join(path, "out.png"))