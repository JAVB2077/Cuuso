import Calculadora

main :: IO ()
main = do
    putStrLn "Primer número"
    sN1 <- getLine
    let iN1 = read sN1 :: Integer
    putStrLn "Segundo número"
    sN2 <- getLine
    let iN2 = read sN2 :: Integer
    print (sumar iN1 iN2)
    print (restar iN1 iN2)
    print (multiplicar iN1 iN2)
    let dN1 = read sN1 :: Double
    let dN2 = read sN2 :: Double
    print (dividir dN1 dN2)