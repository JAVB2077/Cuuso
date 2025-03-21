module Escuela (agregarPersona, imprimirLista, imprimirApellido) where

import  Person

agregarPersona :: Person -> [Person] -> [Person]
agregarPersona persona listaPersonas = listaPersonas ++ [persona]

imprimirLista :: [Person] -> IO()
imprimirLista [] = return()
imprimirLista (x:xs) = do
    print x
    imprimirLista xs

imprimirApellido :: [Person] -> IO()
imprimirApellido [] = return()
imprimirApellido (x:xs) = do
    print (lastName x)
    imprimirApellido xs