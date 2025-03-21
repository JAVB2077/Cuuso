numeroATexto :: Int -> String
numeroATexto n = case n of
    1 -> "Uno"
    2 -> "Dos"
    3 -> "Tres"
    _ -> "Desconocido"

procesarNumeros :: [Int] -> IO [String]
procesarNumeros nums = mapM (\n -> do
    putStrLn $ "Procesando: " ++ show n
    return (numeroATexto n)
    ) nums

procesarNumeros_ :: [Int] -> IO ()
procesarNumeros_ nums = mapM_ (\n -> do
    putStrLn $ "Procesando: " ++ show n
    putStrLn $ "Texto: " ++ numeroATexto n
    ) nums

main :: IO ()
main = do
    putStrLn "Ejecutando procesarNumeros:"
    resultado <- procesarNumeros [1,2,3]
    print resultado  -- Imprime la lista de resultados
    
    putStrLn "\nEjecutando mostrarNumeros:"
    procesarNumeros_ [1,2,3]