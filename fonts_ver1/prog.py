data = open("/home/yartom/Downloads/lambdarune/fonts_align/glyphs_fDeterminationMW_small.csv", "r", encoding="utf-8").read()

rows = data.splitlines()

m = [rows[0]]  # header

for row in rows[1:]:
    cols = row.split(";")
    print(cols)
    m.append(f"{cols[0]};{int(cols[1]) };{cols[2]};{int(cols[3])};{cols[4]};{int(cols[5]) + 1};{cols[6]}")
    
out_data = open("/home/yartom/Downloads/lambdarune/fonts_align/fDeterminationMW_small.png", "w", encoding="utf-8").write("\n".join(m)),