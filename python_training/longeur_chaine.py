#!/usr/bin/env python3.8

var1 = str(input("Saisir une première chaîne : "))
var2 = str(input("Saisir une deuxième chaîne : "))

if len(var1) > len(var2):
    print(var1)
else:
    print(var2)
