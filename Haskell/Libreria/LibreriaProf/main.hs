import Libro
import Inventario
import Reportes

module Main where

main :: IO ()
main = do
  -- Cargar el inventario desde un archivo
  inventario <- cargarInventario "inventario.txt"

  -- Listar el inventario
  putStrLn "Inventario de libros:"
  listarInventario inventario

  -- Agregar un nuevo libro
  let nuevoLibro = crearLibro "Nuevo Libro" "Autor Nuevo" 2023 29.99
  let inventarioConNuevoLibro = agregarLibro nuevoLibro 5 inventario
  guardarInventario "inventario.txt" inventarioConNuevoLibro
  putStrLn "\nLibro agregado:"
  listarInventario inventarioConNuevoLibro

  -- Buscar un libro por título
  putStrLn "\nBuscando el libro 'Nuevo Libro' por título:"
  let resultadosTitulo = buscarPorTitulo inventarioConNuevoLibro "Nuevo Libro"
  listarInventario resultadosTitulo

  -- Eliminar un libro del inventario por título y autor
  putStrLn "\nEliminando el libro 'Nuevo Libro' del autor 'Autor Nuevo':"
  inventarioActualizado <- eliminarLibro "inventario.txt" inventarioConNuevoLibro "Nuevo Libro" "Autor Nuevo"
  putStrLn "\nInventario actualizado:"
  listarInventario inventarioActualizado
