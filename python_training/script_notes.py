#!/usr/bin/env python3.8
fic1 = open( 'notes.txt', 'r' )
linesfic1 = fic1.readlines()
liste_float = []
fic1.close()

for lines in linesfic1:
    liste_float.append(float(lines))

#print(liste_float)

print('Moyenne : ')
print(sum(liste_float)/len(liste_float))