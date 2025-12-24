data = open("/home/yartom/Downloads/lambdarune/fonts_align/glyphs_fDeterminationMW.csv", "r", encoding="utf-8").read()

rows = data.splitlines()

m = [rows[0]]  # header

for row in rows[1:]:
    cols = row.split(";")
    print(cols)
    m.append(f"{cols[0]};{int(cols[1])};{int(cols[2])};{int(cols[3])};{cols[4]};{max(int(cols[5]), 16)};{cols[6]}")
    
out_data = open("/home/yartom/Downloads/lambdarune/fonts_align/glyphs_fDeterminationMW.csv", "w", encoding="utf-8").write("\n".join(m)),