import Libro
import Inventario
import Reporte

module Main where

main :: IO ()
main = do

 let inventario = []
 
  let libro1 = crearLibro "El Principito" "Antoine de Saint-Exupéry" 1943 15.99
  let libro2 = crearLibro "Cien Años de Soledad" "Gabriel García Márquez" 1967 22.50
  let libro3 = crearLibro "1984" "George Orwell" 1949 12.99

  -- Agregar libros al inventario con una cantidad inicial
  let inventarioConLibros = agregarLibro libro1 10 (agregarLibro libro2 5 (agregarLibro libro3 3 inventario))

  -- Listar el inventario
  putStrLn "Inventario de libros:"
  listarInventario inventarioConLibros

  -- Buscar un libro por título
  putStrLn "\nBuscando el libro 'Nuevo Libro' por título:"
  let resultadosTitulo = buscarLibroPorTitulo inventarioConNuevoLibro "Nuevo Libro"
  listarInventario resultadosTitulo

  putStrLn "\nBuscando el libro 'Nuevo Libro' por Autor:"
  let resultadosAutor = buscarLibroPorAutor inventarioConNuevoLibro "Nuevo Libro"
  listarInventario resultadosAutor

  -- Eliminar un libro del inventario por título y autor
  putStrLn "\nEliminando el libro 'Nuevo Libro' del autor 'Autor Nuevo':"
  inventarioActualizado <- eliminarLibro "inventario.txt" inventarioConNuevoLibro "Nuevo Libro" "Autor Nuevo"
  putStrLn "\nInventario actualizado:"
  listarInventario inventarioActualizado
