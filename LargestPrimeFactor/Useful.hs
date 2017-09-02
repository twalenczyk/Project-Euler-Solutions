-- Author: Taylor Walenczyk
-- Last edit: 8/31
module Useful
( primeFactors
) where

-- NOTE Beginning here is the revised solution

-- Source: https://wiki.haskell.org/Euler_problems/1_to_10#Problem_10
-- A function that returns a list of prime numbers
-- (null . tail . primeFactors) effectively produces a predicate to determine whether or not the primes are supposed to be used
primes = 2 : filter (null . tail . primeFactors) [3,5..]

-- A function that finds the prime factors of a given number
primeFactors n = factor n primes
    where
        factor n (p:ps)
            | p*p > n = [n] -- p isn't a factor
            | n `mod` p == 0 = p : factor (n `div` p) (p:ps) -- joins factor p with all of its factors
            | otherwise =  factor n ps -- p isn't a factor, continue with the rest of the list


-- NOTE Below here contains methods used in the original solution

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
