-- Author: Taylor Walenczyk
-- Last Edit: 8/31/2017
-- Originally Solved: 9/1/2017
-- Solution Improved: ~
-- Computation time: less than a second

import Data.Char

-- TODO
    -- Compile the program using ghc then put the following line in the command line --> "cat num.txt | ./Solution"

-- puts the num into a string
main = do
    contents <- getContents
    print (runNum contents)


-- parses a string into a length
take13 :: String -> String
take13 y = take 13 y

testProducts :: String -> Int
testProducts (x:[]) = digitToInt x
testProducts (x:xs) = digitToInt x * testProducts xs

-- steps through sequences of 13 and saves the largest product
runNum :: String -> Int
runNum (x:xs)
    | length xs == 13 = testProducts (take13 (x:xs))
    | otherwise =
        if current >= next
            then current
            else next
        where
            current = testProducts (take13 (x:xs))
            next = runNum xs
