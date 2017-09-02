-- Author: Taylor Walenczyk
-- Last Edit: 8/29/2017
-- Original Solved: 8/29/2017
-- Solution Improved: 8/29/2017

import Useful
import System.IO
import Control.Monad

main = do
    putStrLn "What number would you like to factorize?"
    number <- getLine
    putStrLn ("You said: " ++ number)
    print (last (Useful.primeFactors (read number :: Integer)))
