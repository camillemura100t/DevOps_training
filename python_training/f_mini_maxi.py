#!/usr/bin/env python3.8
#=> module

# Fonction qui renvoie le mini

def mini(valeur1, valeur2):
    if len(valeur1) < len(valeur2) : 
        return valeur1
    else :
        return valeur2

# Fonction qui renvoie le maxi

def maxi(valeur1, valeur2):
    if len(valeur1) > len(valeur2) : 
        return valeur1
    else :
        return valeur2

#valeur1 = str(input('Ecrire une phrase : '))
#valeur2 = str(input('Ecrire une deuxième phrase : '))

#print('Valeur la plus petite : ')
#print(mini(valeur1,valeur2))
#print('Valeur la plus grande : ')
#print(maxi(valeur1,valeur2))