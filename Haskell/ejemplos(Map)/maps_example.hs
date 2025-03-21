import Control.Monad (when)

verificarNumeros :: [Int] -> IO [Bool]
verificarNumeros nums = mapM esPar nums
  where
    esPar n = do
        let resultado = even n
        when resultado (putStrLn $ show n ++ " es par")  -- Solo imprime si es par
        return resultado
        
verificarNumeros_ :: [Int] -> IO ()
verificarNumeros_ nums = mapM_ esPar nums
  where
    esPar n = when (even n) (putStrLn $ show n ++ " es par") -- Solo imprime si es par

main :: IO ()
main = do
    resultados <- verificarNumeros [1,2,3,4,5,6]
    print resultados  -- Mostrará la lista de booleanos
    
    verificarNumeros_ [1,2,3,4,5,6]