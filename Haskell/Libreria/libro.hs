module Libro (Libro(..)) where

data Libro =Libro { titulo :: String
                , autor :: String
                , anioPublicacion :: Int
                , precio :: Float
                , inventario :: Int
                    } deriving (Show,Eq)
