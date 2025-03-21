import System.IO

main :: IO ()
main = do
    --opción 1
    handle <- openFile "test.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
    --opción 2
    print()
    withFile "test.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)