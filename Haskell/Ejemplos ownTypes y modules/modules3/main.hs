import Escuela
import Person

main :: IO()
main = do
    let listaPersonas = [Person "Andrés" "Paredes" 3 98]

    let p = Person "Mario" "Paredes" 36 1.68  
    let listaAux = agregarPersona p listaPersonas

    let person2 = Person "Omar" "Paredes" 36 1.68
    let listaAux2 = agregarPersona p listaAux

    imprimirLista listaAux2
    imprimirApellido listaAux2
    print ""