-- Author: Taylor Walenczyk
-- Last edit: 8/29

-- Gets all primes less than a give number
getPrimesLessThan :: (Integral a) =>  a -> [a]
getPrimesLessThan x = [ x2 | x2 <- [1..(x-1)], isPrime x2]

-- Factorizes a number using a list of primes
factorizeWith :: (Integral a) => a -> [a] -> [a]
factorizeWith x y = [ x2 | x2 <- y, x `mod` x2 == 0]

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
