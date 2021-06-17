#!/usr/bin/env python3.8

liste_produit = ['chaussure', 'pain', 42, 'chocolat']
taux_tva = 19.6
taux_tva_bas = 5.5
liste_prix = {}
for produit in liste_produit:
    if produit == 'pain':
        liste_prix[produit] = taux_tva_bas * 10
        continue
    elif type(produit) != str:
        print(type(produit))
        print('erreur dans la liste des produits')
        break
        liste_prix[produit] = taux_tva * 10
        print(liste_prix)