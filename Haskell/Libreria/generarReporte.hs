module Reporte (librosMenor5Stock,libroMasCaro,libroMasBarato,promedioPrecios) where
import Libro
import Data.List (maximumBy, minimumBy)
import Data.Function (on)

-- Función para encontrar libros con menos de 5 unidades en stock
librosMenor5Stock :: [Libro] -> [Libro]
librosMenor5Stock = filter (\libro -> inventario libro < 5)

-- Función para encontrar el libro más caro
libroMasCaro :: [Libro] -> Libro
libroMasCaro [] = error "No hay libros en el inventario"
libroMasCaro libros = maximumBy (compare `on` precio) libros

-- Función para encontrar el libro más barato
libroMasBarato :: [Libro] -> Libro
libroMasBarato [] = error "No hay libros en el inventario"
libroMasBarato libros = minimumBy (compare `on` precio) libros

-- Función para calcular el promedio de precios
promedioPrecios :: [Libro] -> Float
promedioPrecios [] = 0
promedioPrecios libros = suma / fromIntegral (length libros)
  where
    suma = sum $ map precio libros