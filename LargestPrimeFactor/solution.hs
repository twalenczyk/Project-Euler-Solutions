-- Author: Taylor Walenczyk
-- Last Edit: 8/29/2017
-- Original Solved: 8/29/2017
-- Solution Improved: ~

import Useful
import System.IO
import Control.Monad

main = do
    putStrLn "What number would you like to factorize?"
    number <- getLine
    putStrLn ("You said: " ++ number)
    let x = Useful.getPrimesLessThan (read number :: Int)
    let y = Useful.factorizeWith (read number :: Int) x
    print y
