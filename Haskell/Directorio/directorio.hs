registrarContacto :: (String, Integer) -> [(String, Integer)] -> [(String, Integer)]
registrarContacto (nombre, telefono) listaContactos = [(nombre, telefono)] ++ listaContactos

imprimirDirectorio :: [(String, Integer)] -> IO()
imprimirDirectorio listaContactos = mapM_ (print) listaContactos

buscarPorNombre :: String -> [(String, Integer)] -> [(String, Integer)]
buscarPorNombre nombre listaContactos = filter (\(n, _) -> n == nombre) listaContactos

buscarPorNombreV2 :: String -> [(String, Integer)] -> [(String, Integer)]
buscarPorNombreV2 nombre = filter ((== nombre) . fst)

buscarPorNombreV3 :: String -> [(String, Integer)] -> IO ()
buscarPorNombreV3 nombre listaContactos = 
    mapM_ (\(n, telefono) -> 
        if n == nombre
            then putStrLn $ "Encontrado: " ++ n ++ " con teléfono " ++ show telefono
            else return ()) listaContactos

main :: IO()
main = do
    let contacto = ("Mario", 123456)
    let contacto2 = ("Omar", 256347)
    let listaContactos = registrarContacto contacto2 [contacto]
    imprimirDirectorio listaContactos
    let listaContactosCoincidencia = buscarPorNombre "Mario" listaContactos
    imprimirDirectorio listaContactosCoincidencia
    let listaContactosCoincidencia = buscarPorNombreV2 "Mario" listaContactos
    imprimirDirectorio listaContactosCoincidencia
    let listaContactosCoincidencia = buscarPorNombreV3 "Mario" listaContactos
    listaContactosCoincidencia