import Registro
import Person

main :: IO()
main = do 
    let  p = Person "Mario" "Paredes" 36 68
    --putStrLn (firstName P)
    let listaAux = agregarPersona p listaPersonas
    
    let  person2 = Person "Mario" "Paredes" 36 18
    --putStrLn (firstName P)
    let listaAux2 = agregarPersona person2 listaAux
    
    let  person3 = Person "Mario" "Paredes" 36 16
    --putStrLn (firstName P)
    let listaAux3 = agregarPersona person3 listaAux2
 
    imprimirLista listaAux3
    imprimirLastName listaAux3