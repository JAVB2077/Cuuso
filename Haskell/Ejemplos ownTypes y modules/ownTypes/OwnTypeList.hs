data Persona = Persona { nombre :: String
                     , apellido :: String
                     , edad :: Int
                     , altura :: Float
                     } deriving (Show, Eq)

listaPersonas :: [Persona]
listaPersonas = [Persona "Mario" "Paredes" 36 168]

imprimirListaPersonas :: [Persona] -> IO()
imprimirListaPersonas personas = mapM_ (print) personas

eliminarPersona :: Persona -> [Persona] -> [Persona]
eliminarPersona persona personas = filter(\per -> per /= persona) personas

main :: IO ()
main = do
    print "Lista original"
    imprimirListaPersonas listaPersonas
    let persona1 = Persona "Oscar" "Paredes" 62 168
    let persona2 = Persona "Andrés" "Paredes" 3 98
    print "Lista personas 2"
    let listaPersonas2 = listaPersonas ++ [persona1]
    imprimirListaPersonas listaPersonas2
    print "Lista personas 3"
    let listaPersonas3 = listaPersonas2 ++ [persona2]
    imprimirListaPersonas listaPersonas3
    print "Lista personas 4"
    let listaPersonas4 = eliminarPersona persona1 listaPersonas3
    imprimirListaPersonas listaPersonas4