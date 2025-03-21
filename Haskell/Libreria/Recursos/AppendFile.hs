import System.IO

main :: IO ()
main = do
    todoItem <- getLine
    appendFile "testAppend.txt" (todoItem ++ "\n")