data Person = Person String String Int Float

getFirstName :: Person -> String
getFirstName (Person firstname _ _ _) = firstname

lastName :: Person -> String
lastName (Person _ lastname _ _) = lastname

age :: Person -> Int
age (Person _ _ age _) = age


main :: IO ()
main = do
    let p = Person "Mario" "Paredes" 36 1.68
    print p --Error: No instance for (Show Person) arising from a use of `print'
    print (getFirstName p)