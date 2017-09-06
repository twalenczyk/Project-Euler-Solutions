-- Author: Taylor Walenczyk
-- Last Edit: 9/2/2017
-- Originally Solved: ~
-- Solution Improved: ~
-- Computation time: ~

import System.IO
import Data.List

-- Solution
main = do
    contents <- readFile "grid.txt"
    putStrLn  contents

parseContents [] = [[]]
parseContents (x:[]) = [[]]
parseContents ('\n':xs) = [parseLine xs] ++ (parseContents rest xs)
    where rest x = dropWhile (/='\n') x
parseContents (x:xs) = [ parseLine (x:xs) ] ++ (parseContents rest (x:xs))
    where rest x = dropWhile (/='\n') x

parseLine x = takeWhile (/='\n') x
