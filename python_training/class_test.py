#!/usr/bin/env python3.8

class Game:
    #Doc class Game
    gamename = ""
    editor = ""
    releaseYear = ""
    description = ""
    category = ["Familial", "Gestion", "Figurine", "Expert", "Apéro"]
    duration = ""
    numberofplayers = ""
    fichier = "gamelist.txt"

    def GameList (self):
        fic1 = open(self.fichier, "r")
        print(fic1.read())
        fic1.close()

    def GameAdd (self):
        ### A réécrire en jouant avec les attributs
        fic2 = open("gamelist.txt", "w+")
        fic2.read()
        fic2.writelines(str(input("Merci de saisir un jeu, son éditeur, son année de sortie, etc... : ")))
        #On reset le curseur au début et on vérifie
        fic2.seek(0)
        print(fic2.read())
        fic2.close()

    def GameShow (self):
        ### A réécrire en jouant avec les attributs###
        gameid = int(input("Quel jeu voulez-vous afficher? 0, 1 ou 2?"))
        fic3 = open("gamelist.txt", "r")
        #On va chercher la ligne du jeu en question
        fic3.seek(gameid)
        print(fic3.readline())
        fic3.close

    def GameDelete (self):
        print("en cours de dev")

Game1 = Game()
Game1.GameList()



