#!/usr/bin/env python3.8

#conversion euros en dollars

devise = input('Dans quel devise allez vous entrer le montant : E ou $ ? ')
montant = input('Quel montant souhaitez vous convertir ? ')

taux = 1.2

if devise == 'E' :
    conversion = float(montant) / taux
elif devise == '$' :
    conversion = float(montant) * taux
else:
    conversion = 'Erreur dans le choix de la devise'

print(conversion)