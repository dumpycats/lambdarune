csv = open("./glyphs_fDeterminationMW_small.csv", "r").read().splitlines()
data = [line.split(";") for line in csv[1:]]

for row in data:
    if abs(int(row[-2]) - int(row[3])) <= 2:
        row[-2] = int(row[3]) + 2

open("./glyphs_fDeterminationMW_small.csv", "w+").write(csv[0] + "\n" + "\n".join([";".join(map(str, row)) for row in data]))