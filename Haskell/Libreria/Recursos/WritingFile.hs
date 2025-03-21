import System.IO
import Data.Char

main :: IO ()
main = do
    contents <- readFile "test.txt"
    writeFile "testUpper.txt" (map toUpper contents)