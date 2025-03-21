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
agregarLibro libro cantidad (Inventario libros) = Inventario ((libro, cantidad) : libros)
-- Guardar todos los libros en el inventario
listarInventario :: Inventario -> IO ()
listarInventario (Inventario libros) = mapM_ (\(libro, cantidad) -> putStrLn (mostrarLibro libro ++ ", Cantidad: " ++ show cantidad)) libros


-- Buscar libros por título
buscarLibroPorTitulo :: Inventario -> String -> Inventario
buscarLibroPorTitulo (Inventario libros) tituloBuscado =
  Inventario (filter (\(libro, _) -> titulo libro == tituloBuscado) libros)
--Buscar por autor
buscarLibroPorAutor :: Inventario -> String -> Inventario
buscarLibroPorAutor inventario autorBuscado =
  filter (\(libro, _) -> autor libro == autorBuscado) inventario
  
-- Eliminar un libro por título y autor
eliminarLibro :: FilePath -> Inventario -> String -> String -> IO Inventario
eliminarLibro archivo (Inventario libros) tituloBuscado autorBuscado = do
  -- Filtrar los libros que no coinciden con el título y autor
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
