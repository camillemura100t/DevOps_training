#!/usr/bin/env python3.8
#fic1 = open("loremipsum.txt", "r")
#print(fic1.read())
#fic1.close()

#On ouvre le fichier en r+ - différences avec w+ = on créé le fichier s'il n'existe pas
fic1 = open("loremipsum.txt", "r+")

#On copie les lignes du fichier dans la variable newlines
newlines = fic1.readlines()

#On se replace au début du fichier pour éviter d'écrire à la suite du fichier car le readlines déplace le curseur à la fin
fic1.seek(0)

#On insère la nouvelle chaine à la ligne 5 et on ajoute un saut de ligne
newlines.insert(4, "Ma nouvelle chaine insérée dans mon fichier texte au milieu du lorem ipsum\n")

#On ré-écrit le fichier
fic1.writelines(newlines)

#On ferme le fichier
fic1.close()

