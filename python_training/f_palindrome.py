#!/usr/bin/env python3.8

def check_palindrome(v): 
    # [x:y:z] = [x = début : y = fin : z = pas/position => sens de lecture - vide pour sens normal de 1 en 1
    # ou -1 pour inverse de 1 en 1
    # ou 2 pour de 2 en 2] etc ...
    reverse = v[::-1]
    if v == reverse: 
        return True
    return False

var = input("Entrez une valeur: ")
if check_palindrome(var):
    print("L'entrée est un palindrome")
else:
    print("L'entrée n'est pas un palindrome")