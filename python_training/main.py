#!/usr/bin/env python3.8

import f_pair_impair
import f_mini_maxi

choix_user = input('Entrer N pour une valeur numérique ou C pour entrer deux chaines de caractères : ')

if choix_user == 'N':
    valeur_user1 = int(input('Entrer une valeur numérique : '))
    if f_pair_impair.pair(valeur_user1):
        print("La fonction pair retourne True pour la valeur %d" %valeur_user1)
    elif f_pair_impair.impair(valeur_user1):
        print("La fonction impair retourne True pour la valeur %d" %valeur_user1)
#    else:
#        print("Error")
elif choix_user == 'C':
    valeur_user2 = str(input('Ecrire une phrase : '))
    valeur_user3 = str(input('Ecrire une deuxième phrase : '))
    print('Valeur la plus petite : ')
    print(f_mini_maxi.mini(valeur_user2,valeur_user3))
    print('Valeur la plus grande : ')
    print(f_mini_maxi.maxi(valeur_user2,valeur_user3))
else:
    print('Merci d\'arrêter d\'être bête et de taper N ou C')
