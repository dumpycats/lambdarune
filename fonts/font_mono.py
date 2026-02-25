csv = open("./glyphs_fDeterminationMW.csv", "r").read().splitlines()
data = [line.split(";") for line in csv[1:]]

for row in data:
    row[-2] = max(int(row[-2]), 16)

open("./glyphs_fDeterminationMW.csv", "w").write(csv[0] + "\n" + "\n".join([";".join(map(str, row)) for row in data]))