data Persona = Persona { nombre :: String
                     , apellido :: String
                     , edad :: Int
                     , altura :: Float
                     } deriving (Show, Eq)

listaPersonas :: [Persona]
listaPersonas = [Persona "Mario" "Paredes" 36 168]

imprimirListaPersonas :: [Persona] -> IO()
imprimirListaPersonas personas = mapM_ (print) personas

agregarPersona :: Persona -> [Persona] -> [Persona]
agregarPersona persona personas = personas ++ [persona]

eliminarPersona :: Persona -> [Persona] -> [Persona]
eliminarPersona persona personas = filter(\per -> per /= persona) personas









imprimirListaPersonasNombres :: [Persona] -> IO()
imprimirListaPersonasNombres (x:xs)
    | xs == [] = print(nombre x)
    | otherwise = do
        print(nombre x)
        imprimirListaPersonasNombres xs

ordenarPorEdad :: [Persona] -> [Persona]
ordenarPorEdad [] = []
ordenarPorEdad (x:xs) = ordenarPorEdad menores ++ [x] ++ ordenarPorEdad mayores
  where
    menores = filter (\e -> edad e <= edad x) xs
    mayores = filter (\e -> edad e > edad x) xs

main :: IO ()
main = do
    print "Lista original"
    imprimirListaPersonas listaPersonas
    let persona1 = Persona "Oscar" "Paredes" 62 168
    let persona2 = Persona "Andrés" "Paredes" 3 98
    print "Lista personas 2"
    let listaPersonas2 = agregarPersona persona1 listaPersonas
    imprimirListaPersonas listaPersonas2
    print "Lista personas 3"
    let listaPersonas3 = listaPersonas2 ++ [persona2]
    imprimirListaPersonas listaPersonas3
    print "Lista personas 4"
    let listaPersonas4 = eliminarPersona persona1 listaPersonas3
    imprimirListaPersonas listaPersonas4
    imprimirListaPersonasNombres listaPersonas4
    print "Lista personas ordenada por edad"
    let listaPersonasOrdenadaEdad = ordenarPorEdad listaPersonas4
    imprimirListaPersonas listaPersonasOrdenadaEdad