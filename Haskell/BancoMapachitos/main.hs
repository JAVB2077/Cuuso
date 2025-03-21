import CalcularSaldo
import Transaccion

main :: IO ()
main = do
    let saldoInicial = 1000
        transaccionesSimuladas = [ ("Juan", 500, Deposito)
                                 , ("Juan", 200, Retiro)
                                 , ("Juan", 1500, Retiro) -- No debería afectar el saldo
                                 , ("Juan", 300, Deposito)
                                 ]
        (saldoFinal, historial) = simularTransacciones saldoInicial transaccionesSimuladas

    putStrLn $ "Saldo final del cliente: " ++ show saldoFinal
    putStrLn "Historial de transacciones:"
    mapM_ print historial