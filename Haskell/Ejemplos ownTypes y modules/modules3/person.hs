module Person (Person(..)) where

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     } deriving (Show)