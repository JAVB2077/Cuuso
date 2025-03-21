import Calculadora

main :: IO()
main = do 
    putStrLn "Ingrese el primer número: "
    num1Str <- getLine
    putStrLn "Ingrese el segundo número: "
    num2Str <- getLine
    
    let num1 = read num1Str :: Double
        num2 = read num2Str :: Double
    
    putStrLn "Resultados:"
    sumar num1 num2
    restar num1 num2
    multiplicar num1 num2
    dividir num1 num2
