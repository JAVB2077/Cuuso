module Metodos (cargarInventario,guardarInvertario,agregarLibro,eliminarLibro,buscarLibro,eliminarLibro,buscarLibro,listaInventario,actulizarPrecioLibro,ordenarInventario,exportarInforme) where
import Libro
agregarLibro :: (String, String, Int, Float, Int) -> [(String, String, Int, Float, Int)] -> [(String, String, Int, Float, Int)]
--agregarLibro libro listaLibros = libro : listaLibros
agregarLibro (titulo, autor, anioPublicacion, precio, inventario) listaLibros = [(titulo, autor, anioPublicacion, precio, inventario)] ++ listaLibros

imprimirDirectorio :: [(String, String, Int, Float, Int)] -> IO()
imprimirDirectorio listaLibro = mapM_ (print) listaLibro


buscarPorTitulo :: String -> [(String, String, Int, Float, Int)] -> [(String, String, Int, Float, Int)]
buscarPorTitulo titulo listaLibros = filter (\(t, _, _, _, _) -> t == titulo) listaLibros

buscarPorAutor :: String -> [(String, String, Int, Float, Int)] -> [(String, String, Int, Float, Int)]
buscarPorAutor autor listaLibros = filter (\(_, a, _, _, _) -> a == autor) listaLibros
