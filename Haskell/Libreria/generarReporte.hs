module Reporte (librosMenor5Stock, libroMasCaro, libroMasBarato, promedioPrecios) where
import Libro
-- Importamos funciones de Data.List para trabajar con listas
import Data.List (maximumBy, minimumBy)
-- Importamos Data.Function para simplificar comparaciones basadas en un criterio
import Data.Function (on)

-- Función para encontrar libros con menos de 5 unidades en stock
-- Toma una lista de libros y devuelve una lista de libros cuyo inventario es menor a 5
librosMenor5Stock :: [Libro] -> [Libro]
librosMenor5Stock = filter (\libro -> inventario libro < 5)
-- `filter` aplica una función booleana a cada elemento de la lista y devuelve solo los que cumplen la condición
-- `\libro -> inventario libro < 5` es una función lambda que verifica si el inventario de un libro es menor a 5

-- Función para encontrar el libro más caro
-- Toma una lista de libros y devuelve el libro con el precio más alto
libroMasCaro :: [Libro] -> Libro
libroMasCaro [] = error "No hay libros en el inventario"
-- Si la lista está vacía, lanza un error indicando que no hay libros
libroMasCaro libros = maximumBy (compare `on` precio) libros
-- `maximumBy` encuentra el elemento máximo de una lista según un criterio
-- `(compare `on` precio)` compara los libros basándose en su precio

-- Función para encontrar el libro más barato
-- Toma una lista de libros y devuelve el libro con el precio más bajo
libroMasBarato :: [Libro] -> Libro
libroMasBarato [] = error "No hay libros en el inventario"
-- Si la lista está vacía, lanza un error indicando que no hay libros
libroMasBarato libros = minimumBy (compare `on` precio) libros
-- `minimumBy` encuentra el elemento mínimo de una lista según un criterio
-- `(compare `on` precio)` compara los libros basándose en su precio

-- Función para calcular el promedio de precios de una lista de libros
-- Toma una lista de libros y devuelve el promedio de sus precios como un número de punto flotante
promedioPrecios :: [Libro] -> Float
promedioPrecios [] = 0
-- Si la lista está vacía, el promedio es 0
promedioPrecios libros = suma / fromIntegral (length libros)
-- Calcula el promedio dividiendo la suma de los precios entre la cantidad de libros
  where
    suma = sum $ map precio libros
    -- `map precio libros` aplica la función `precio` a cada libro de la lista, obteniendo una lista de precios
    -- `sum` suma todos los elementos de esa lista
    -- `fromIntegral` convierte la cantidad de libros (un entero) a un número de punto flotante para realizar la división