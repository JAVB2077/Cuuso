data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     } deriving (Show)

listaPersonas :: [Person]
listaPersonas = [Person "Andrés" "Paredes" 3 98]

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
    print (firstName x)
    imprimirApellido xs

main :: IO()
main = do
    let p = Person "Mario" "Paredes" 36 1.68
    putStrLn (firstName p)    
    let listaAux = agregarPersona p listaPersonas

    let person2 = Person "Omar" "Paredes" 36 1.68
    let listaAux2 = agregarPersona p listaAux

    imprimirLista listaAux2
    imprimirApellido listaAux2
    print ""
    