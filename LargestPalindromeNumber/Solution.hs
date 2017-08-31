-- Author: Taylor Walenczyk
-- Last Edit: 8/29/2017
-- Original Solved: 8/29/2017
-- Solution Improved: ~

-- Recursive function that tests whether or not a string is a palindrome
isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome (x:[]) = True
isPalindrome (x:xs) = if x == last xs
                            then isPalindrome (init xs)
                            else False

convertIntToString :: (Show a, Integral a) => a -> String
convertIntToString x = show x

productsOfAllThreeDigitNums = [ a * b | a <- [999, 998..100], b <- [999, 998..100]]

findLargestPalindrome :: [Integer] -> Integer
findLargestPalindrome (x:xs) = if isPalindrome (convertIntToString x)
                                    then x
                                    else findLargestPalindrome xs
