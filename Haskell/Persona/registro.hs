module Registro (listaPersonas,agregarPersona,imprimirLista,imprimirLastName) where
import Person

listaPersonas ::[Person]
listaPersonas = [Person "Andres" "Paredes" 3 98]

agregarPersona :: Person -> [Person] -> [Person]
agregarPersona persona listaPersonas = listaPersonas ++ [persona]

imprimirLista :: [Person] -> IO()
imprimirLista [] = return()
imprimirLista (x:xs) = do
    print x
    imprimirLista xs

imprimirLastName :: [Person] -> IO()
imprimirLastName [] = return()
imprimirLastName(x:xs) = do 
        print (firstName x)
        imprimirLista xs