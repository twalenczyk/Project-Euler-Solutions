-- Author: Taylor Walenczyk
-- Last Edit: 8/31/2017
-- Originally Solved: 8/31/2017
-- Solution Improved: ~
-- Computation time: 24s

import System.IO

main = do
    putStrLn "Welcome! This will compute the 10001st prime number for you. Hold on tight!"
    putStrLn "..."
    print (last (take 10001(filter isPrime [2..])))

-- Determines whether or not a number is prime
isPrime :: (Integral a) => a -> Bool
isPrime x
    | x < 1 = False
    | x == 1 = True
    | x == 2 = True
    | otherwise = testPrime x (getCeilingSquareRoot x)

-- Gets the square root of an integral and applies the ceiling function
getCeilingSquareRoot :: (Integral a) => a -> a
getCeilingSquareRoot x = ceiling (sqrt (fromIntegral x))

-- Uses a number to recursively test whether or not a number is prime
testPrime :: (Integral a) => a -> a -> Bool
testPrime _ 1 = True
testPrime x y = if x `mod` y == 0
                    then False
                    else testPrime x (y-1)
