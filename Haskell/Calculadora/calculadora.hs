module Calculadora(
    sumar,
    restar,
    multiplicar,
    dividir
)where
-- Función para sumar dos números
sumar :: Double -> Double -> IO ()
sumar x y = putStrLn $ "Suma: " ++ show (x + y)

-- Función para restar dos números
restar :: Double -> Double -> IO ()
restar x y = putStrLn $ "Resta: " ++ show (x - y)

-- Función para multiplicar dos números
multiplicar :: Double -> Double -> IO ()
multiplicar x y = putStrLn $ "Multiplicación: " ++ show (x * y)

-- Función para dividir dos números con verificación de división por cero
dividir :: Double -> Double -> IO ()
dividir x y 
    | y /= 0    = putStrLn $ "División: " ++ show (x / y)
    | otherwise = putStrLn "División: No se puede dividir entre cero"

