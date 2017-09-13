-- Author: Taylor Walenczyk
-- Last Edit: 9/2/2017
-- Originally Solved: ~
-- Solution Improved: ~
-- Computation time: ~

-- NOTE Phase three solution
-- Uses a mathematical approach to finding a number with over 500 factors
-- If you have a number with factors n1 and n2
-- And n2 is one greater than n1, or vice versa
-- Then the number has all of the factors of n1 and n2
-- So, if you calculate a triangle index with over 500 factors, you can get a triangle number with the same property by applying i(i + 1)/2
-- Source: http://code.jasonbhill.com/sage/project-euler-problem-12/

main = do
    putStrLn("Welcome! Hopefully this will get a highly divisible triangle number.")
    print (buildTriangleNumber( getDivisibleTriangleNumber 1 1 500))

-- Finds the triangle number with the factor limit using n as a starting point
getDivisibleTriangleNumber :: Int -> Int -> Int -> Int
getDivisibleTriangleNumber number factorsN factorLimit
    | (factorsN + fn1) > factorLimit          = number
    | otherwise                               = getDivisibleTriangleNumber (number + 1) fn1 factorLimit
        where
            fn1                               = factors (number + 1)

-- NOTE Phase two solution is also two slow
-- recursive function for finding the number
-- faster than the original problem, becaause it's more intuitive
-- findDivisibleTriangleNumber :: (Integral a) => a -> a
-- findDivisibleTriangleNumber number
--     | number > 100000                           = 0
--     | length (factors triangleNumber) > 500     = triangleNumber
--     | otherwise                                 = findDivisibleTriangleNumber (number + 1)
--         where triangleNumber = buildTriangleNumber number

buildTriangleNumber :: (Integral a) => a -> a
buildTriangleNumber x
    | x <= 0        = 0
    | otherwise     = (x * (x + 1)) `div` 2

-- NOTE Takes too long, original solution
-- Gets the list of triangle numbers
buildTriangleList = build 0 [1..]
    where
        build start (x:xs) = (x + start) : build (x + start) xs

-- Gets factors for a number
factors :: (Integral a) => a -> a
factors n = factor n [1..n]
    where
        factor n (x:xs)
            | x * 2 > n         = 1
            | n `mod` x == 0    = 1 + (factor n xs)
            | otherwise         = factor n xs

filterByFactorLength x = length(factors x) > 500
