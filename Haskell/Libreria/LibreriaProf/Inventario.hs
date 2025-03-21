import Libro
import System.IO
import System.Directory (removeFile, renameFile)
import Data.List (delete)

module Inventario
  ( Inventario
  , agregarLibro
  , buscarPorTitulo
  , eliminarLibro
  ) where

data Inventario = Inventario
  { libros :: [(Libro, Integer)]
  } deriving (Show, Eq)


-- Agregar libro
agregarLibro :: Libro -> Integer -> Inventario -> Inventario
agregarLibro libro cantidad inventario = (libro, cantidad) : inventario

-- Buscar libros por título
buscarLibroPorTitulo :: Inventario -> String -> Inventario
buscarLibroPorTitulo inventario tituloBuscado = filter (\(libro, _) -> titulo libro == tituloBuscado) inventario
--Buscar libros por autor
buscarAutorPorAutor :: Inventario -> String -> Inventario
buscarAutorPorAutor inventario autorBuscado = filter (\(libro, _) -> autor libro == autorBuscado) inventario

--Eliminar libro
eliminarLibro :: Inventario -> String -> String -> Inventario
eliminarLibro inventario tituloBuscado autorBuscado = filter (\(libro, _) -> titulo libro /= tituloBuscado || autor libro /= autorBuscado) inventario
