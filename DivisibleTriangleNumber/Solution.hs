-- Author: Taylor Walenczyk
-- Last Edit: 9/2/2017
-- Originally Solved: ~
-- Solution Improved: ~
-- Computation time: ~

-- recursive function for finding the number
findDivisibleTriangleNumber :: (Integral a) => a -> a
findDivisibleTriangleNumber number
    | number > 100000                           = 0
    | length (factors triangleNumber) > 500     = triangleNumber
    | otherwise                                 = findDivisibleTriangleNumber (number + 1)
    where triangleNumber = buildTriangleNumber number

buildTriangleNumber :: (Integral a) => a -> a
buildTriangleNumber x
    | x <= 0        = 0
    | otherwise     = x * (x + 1) `div` 2

-- Takes too long, original solution
-- Gets the list of triangle numbers
buildTriangleList = build 0 [1..]
    where
        build start (x:xs) = (x + start) : build (x + start) xs

-- Gets factors for a number
factors n = factor n [1..n]
    where
        factor n (x:xs)
            | x * 2 > n         = [n]
            | n `mod` x == 0    = x : factor n xs
            | otherwise         = factor n xs

filterByFactorLength x = length(factors x) > 500
