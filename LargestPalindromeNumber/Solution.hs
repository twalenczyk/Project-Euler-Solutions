-- Author: Taylor Walenczyk
-- Last Edit: 8/29/2017
-- Originally Solved: 8/31/2017
-- Solution Improved: ~

-- Could be improved by applying isPalindrome to products using a filter then taking the head of the list it returns

-- Recursive function that tests whether or not a string is a palindrome
isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome (x:[]) = True
isPalindrome (x:xs) = if x == last xs
                            then isPalindrome (init xs)
                            else False

convertIntToString :: (Show a, Integral a) => a -> String
convertIntToString x = show x

productsOfAllThreeDigitNums = [a * b | a <- [999, 998..100], b <- [999, 998..100]]

findLargestPalindrome :: [Integer] -> Integer
findLargestPalindrome (x:xs) = if isPalindrome (convertIntToString x)
                                    then x
                                    else findLargestPalindrome xs

-- sorts larger to smaller
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallersort = quicksort [a | a <- xs, a <= x]
        largersort = quicksort [a | a <- xs, a > x]
    in largersort ++ [x] ++ smallersort
