# create exe: pyinstaller --onefile main.py

import class_loto
#loto = class_loto.loto()
loto = class_loto.loto(60, 20, 5, 2)

loto.start()
while(True):
    r = str(input("Rejouer ? [y/n]\n"))
    if r == 'y' or r == 'Y':
        loto.start()
    else:
        exit()
