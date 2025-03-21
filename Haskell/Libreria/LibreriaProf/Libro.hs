module Libro
  ( Libro
  , crearLibro
  , mostrarLibro
  ) where

data Libro = Libro
  { titulo :: String
  , autor :: String
  , anio :: Int
  , precio :: Float
  } deriving (Show, Eq)

-- Función para crear un libro
crearLibro :: String -> String -> Int -> Float -> Libro
crearLibro titulo autor año precio = Libro titulo autor año precio

-- Función para mostrar el libro
mostrarLibro :: Libro -> String
mostrarLibro libro = 
  "Título: " ++ titulo libro ++ 
  ", Autor: " ++ autor libro ++ 
  ", Año: " ++ show (anio libro) ++ 
  ", Precio: " ++ show (precio libro)
