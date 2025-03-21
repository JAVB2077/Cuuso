--Ricardo Eliseo Montiel Damian
import Libro
import System.IO
import System.Directory (eliminarArchivo, renombrarArchivo)
import Data.List (delete)

module Inventario (cargarInventario, guardarInvertario, agregarLibro,eliminarLibro, buscarLibro, buscarLibroPorTitulo, 
                   buscarLibroPorAutor, listaInventario, actulizarPrecioLibro, ordenarInventario, exportarInforme) where

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
buscarLibroPorAutor :: Inventario -> String -> Inventario
buscarLibroPorAutor inventario autorBuscado = filter (\(libro, _) -> autor libro == autorBuscado) inventario

  --Eliminar libro
eliminarLibro :: FilePath -> Inventario -> String -> String -> IO Inventario
eliminarLibro archivo (Inventario listaLibros) tituloBuscado autorBuscado = do
    let nuevoInventario = filter (\(libro, _) -> titulo libro /= tituloBuscado || autor libro /= autorBuscado) listaLibros
    -- Guardar el nuevo inventario en un archivo temporal
    (nombreTemp, manejadorTemp) <- openTempFile "." "temp"
    hPutStr manejadorTemp $ unlines (map (\(libro, cantidad) -> titulo libro ++ "," ++ autor libro ++ "," ++ show (año libro) 
                        ++ "," ++ show (precio libro) ++ "," ++ show cantidad) nuevoInventario)
    hClose manejadorTemp
    -- Reemplazar el archivo original con el temporal
    eliminarArchivo archivo
    renombrarArchivo nombreTemp archivo
    putStrLn "Libro eliminado."
    return (Inventario nuevoInventario)
