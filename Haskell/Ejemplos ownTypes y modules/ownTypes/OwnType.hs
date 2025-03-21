data Person = Person String String Int Float deriving (Show)

firstName :: Person -> String
firstName (Person firstname _ _ _) = firstname

lastName :: Person -> String
lastName (Person _ lastname _ _) = lastname

main :: IO ()
main = do
    let p = Person "Mario" "Paredes" 36 168
    print p
    print (firstName p)