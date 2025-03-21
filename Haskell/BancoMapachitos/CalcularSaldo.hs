module CalcularSaldo (calcularSaldo,simularTransacciones,parseTipoTransaccion) where

import Transaccion

-- Función para calcular el saldo basado en una transacción
calcularSaldo :: Double -> Monto -> TipoTransaccion -> Double
calcularSaldo saldo monto Deposito = saldo + monto
calcularSaldo saldo monto Retiro
    | saldo >= monto = saldo - monto
    | otherwise = saldo  -- No permite sobregiros

-- Función para simular una serie de transacciones
simularTransacciones :: Double -> [Transaccion] -> (Double, [Transaccion])
simularTransacciones saldoInicial transacciones =
    let saldoFinal = foldl' (\saldo (_, monto, tipo) -> calcularSaldo saldo monto tipo) saldoInicial transacciones
    in (saldoFinal, transacciones)

-- Función para convertir una cadena de texto a TipoTransaccion
parseTipoTransaccion :: String -> TipoTransaccion
parseTipoTransaccion "depósito" = Deposito
parseTipoTransaccion "retiro" = Retiro
parseTipoTransaccion _ = error "Tipo de transacción no válido"