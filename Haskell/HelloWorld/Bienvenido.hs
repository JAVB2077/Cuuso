main::IO()
main = do
    putStrLn "Hola,Cual es tu nombre?"
    name <- getLine
    putStrLn("Hola, " ++ name ++ " Biendenido")