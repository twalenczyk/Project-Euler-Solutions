-- Author: Taylor Walenczyk
-- Last Edit: 9/1/2017
-- Originally Solved: 9/2/2017
-- Solution Improved: ~
-- Computation time: ~

import System.IO
import Prelude

-- TODO
    -- Get a list of primes
    -- sum them

-- Funciton to run for solution
main = do
    putStrLn "Hello! This is the solutions to the problem."
    putStrLn "You wonder, what is the sum of all the primes less than two million? Simple! It is:"
    print (sum (takeWhile (<2000000) primes))


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
