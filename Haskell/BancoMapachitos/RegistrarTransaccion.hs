module Transaccion (Transaccion (..)) where

data Transaccion = Transaccion
  { cliente :: String,
    monto :: Float,
    tipoTransaccion :: String
  }
  deriving (Show)