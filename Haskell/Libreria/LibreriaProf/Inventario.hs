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
eliminarLibro :: FilePath -> Inventario -> String -> String -> IO Inventario
eliminarLibro archivo (Inventario libros) tituloBuscado autorBuscado = do
  let nuevoInventario = filter (\(libro, _) -> titulo libro /= tituloBuscado || autor libro /= autorBuscado) libros
  -- Guardar el nuevo inventario en un archivo temporal
  (tempName, tempHandle) <- openTempFile "." "temp"
  hPutStr tempHandle $ unlines (map (\(libro, cantidad) -> titulo libro ++ "," ++ autor libro ++ "," ++ show (año libro) ++ "," ++ show (precio libro) ++ "," ++ show cantidad) nuevoInventario)
  hClose tempHandle
  -- Reemplazar el archivo original con el temporal
  removeFile archivo
  renameFile tempName archivo
  putStrLn "Libro eliminado."
  return (Inventario nuevoInventario)
