-- Author: Taylor Walenczyk
-- Last Edit: 9/1/2017
-- Originally Solved: 9/1/2017
-- Solution Improved: ~
-- Computation time: 24

-- get the values for a b c
trianglesSumTo1000 = [ (a, b, c) | a <- [1..500], b <- [1..500], c <- [1..500], a < b, b < c, a + b + c == 1000]

aLessThanB x = fst' x < scd' x

isRight x = (fst' x)^2 + (scd' x)^2 == (trd' x)^2

-- the one
specialRight :: (Integral a) => [(a, a, a)] -> (a, a, a)
specialRight (x:xs)
    | foundProperSum = x
    | otherwise = specialRight xs
    where foundProperSum = fst' x + scd' x + trd' x == 1000

fst' (a,_,_) = a

scd' (_,b,_) = b

trd' (_,_,c) = c
