import System.IO
import System.Directory ( removeFile, renameFile )
import Data.List

main :: IO ()
main = do
    --Open the file
    handle <- openFile "tasks.txt" ReadMode
    --Open a temp file
    (tempName, tempHandle) <- openTempFile "." "temp"
    --Read the file and save the content in contents
    contents <- hGetContents handle
    --Split contents into list of strings
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    --Show tasks
    putStrLn "These are your tasks:"
    putStr $ unlines numberedTasks
    --Ask the user for the task number to delete
    putStrLn "Which one do you want to delete?"
    numberString <- getLine
    --Deleting tasks
    let number = read numberString
        newTodoItems = delete (todoTasks !! number) todoTasks
    --Write the file
    hPutStr tempHandle $ unlines newTodoItems
    -- Close files
    hClose handle
    hClose tempHandle
    removeFile "tasks.txt"
    renameFile tempName "tasks.txt"