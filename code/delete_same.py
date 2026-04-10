import os

folder1 = list(os.listdir('./new'))

for file in folder1:
    if file in os.listdir('./orig'):
        content = open('./orig/' + file, 'r').read()
        if content == open('./new/' + file, 'r').read():
            os.remove('./new/' + file)
