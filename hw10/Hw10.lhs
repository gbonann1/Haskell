> module Hw10
>     where

Define factorial. Let Haskell infer the type of factorial.

> factorial n = if n == 0 then 1 else n * factorial (n - 1) 

	

> factorialG n 
>	| n <= 0 = 1
>	| otherwise = n * factorialG (n - 1)

> fact1 :: Int -> Int
> fact1 n = if n == 0 then 1 else n * fact1 (n - 1)

> factP :: Integer -> Integer
> factP 0 = 1
> factP n = n * factP(n -1)

:t fact1	fact1 :: Int -> Int
:t fact1 5 	fact1 5 :: Int
:t (*)		(*) :: Num a => a -> a -> a
:t (==) 	(==) :: Eq a => a -> a -> Bool
:t null		null :: [a] -> Bool
:t 5		5 :: Num a => a
:t 5.1		5.1 :: Fractional a => a
:t 5::Int	5::Int :: Int
:t factorial	factorial :: (Eq a, Num a) => a -> a
:t factorial 5	factorial 5 :: (Eq a, Num a) => a
:t (-)		(-) :: Num a => a -> a -> a
:t (2-) 	(2-) :: Num a => a -> a
:t (-) 2	(-) 2 :: Num a => a -> a
:t error	error :: [Char] -> a

Hw10> factorial (-2) the program gets stuck because there is no case for -2

Hw10> factorial -2 gives an error message
 
  
Add your code to this file.  You will need to remove the spaces before ">" for the types to become part of your code.

Problem 1:

Write a function "sumAll" that takes a list of numbers and returns their sum.  This must be a recursive solution.

Problem 1 Answer:

> sumALL :: Num a => [a] -> a
> sumALL [] = 0
> sumALL (x:xs) = x + sumALL xs




Problem 2:

Write a function "binOpALL op lst" that takes a binary operator and a list of numbers and returns the result of appling the 'op' to the values in list.   To make things easy use the prefix notation for the operators.   For example: (*) 3 2 would evaluator to 6.

Problem 2 Answer:

> binOpALL :: Num a => (a -> a -> a) -> a -> [a] -> a
> binOpALL op start [] = start
> binOpALL op start (x:xs) = op x (binOpALL op start xs)



Problem 3:
Write a recursive function "insertAt v p lst" that inserts a value v at position p in list lst. 
If p is greater than the length of lst, simply insert it at the end.

Remember, Haskell is "pure", so you may not modify ls. Instead, you should recurse and build a new list from ls with v inserted. 

Problem 3 Answer:

> insertAt :: (Eq a, Num a) => b -> a -> [b] -> [b]
> insertAt v 0 (x:xs) = [v] ++ (x:xs)
> insertAt v p [] = [v]
> insertAt v p (x:xs) = [x] ++ insertAt v (p - 1) xs


Problem 4:  Write a function "insert99At p lst" using a partial evaluation of insertAt defined in
problem 3.


Problem 4 Answer:

> insertAt99 :: (Eq a, Num a, Num b) => a -> [b] -> [b]
> insertAt99 a (x:xs) = insertAt 99 a (x:xs)




Problem 5. Thompson 10.3
Define a function composeList which composes a list of functions into a single function. Assume the list of functions is not empty.  Define composeList using primitive recursion.
  
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21


Problem 5 Answer:

> composeList (x:xs) a = x (composeList xs a)
> composeList [] a = a


Problem 6: (from http://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence )
"In mathematics, the Thue-Morse sequence, or Prouhet-Thue-Morse sequence, is a 
binary sequence that begins:

  0 01 0110 01101001 0110100110010110 01101001100101101001011001101001 ...

(if your sequence starts with one..)
    1 10 1001 10010110 1001011001101001...."

...
"Characterization using bitwise negation

The Thue–Morse sequence in the form given above, as a sequence of bits, 
can be defined recursively using the operation of bitwise negation. So, the 
first element is 0. Then once the first 2n elements have been specified, 
forming a string s, then the next 2n elements must form the bitwise negation of 
s. Now we have defined the first 2n+1 elements, and we recurse.

Spelling out the first few steps in detail:

    * We start with 0.
    * The bitwise negation of 0 is 1.
    * Combining these, the first 2 elements are 01.
    * The bitwise negation of 01 is 10.
    * Combining these, the first 4 elements are 0110.
    * The bitwise negation of 0110 is 1001.
    * Combining these, the first 8 elements are 01101001.
    * And so on.
So
    * T0 = 0.
    * T1 = 01."
    
Define a primitive recursive function 'thue' given the nth thue element returns
the next thue element.  The elements will be represented as a list of 0s and 1s.
e.g.
   HW10> thue [0,1,1,0]
   [0,1,1,0,1,0,0,1]


Problem 6 Answer:

> mynegate [] = []
> mynegate (x:xs)
>	| x == 1 = 0: mynegate xs
>	| x == 0 = 1: mynegate xs

	> thue :: (Eq a, Num a, Num a1) => [a] -> [a1]

> thue (x:xs) =  (x:xs) ++ mynegate(x:xs)

Problem 7:
Define a function replicate' which given a list of numbers returns a 
list with each number duplicated its value.   Use primitive recursion in your
definition. You may use a nested helper definition. eg.
     
     HW10> replicate' [2, 4, 1]
     [2,2,4,4,4,4,1]

Problem 7 Answer:

> helper :: (Num i, Ord i) => i -> a -> [a]  
> helper n x  
>    | n <= 0    = []  
>    | otherwise = x:helper (n-1) x 

> replicate' :: (Num a, Ord a) => [a] -> [a]
> replicate' [] = []
> replicate' (x:xs) = (helper x x) ++ (replicate' xs)


Problem 8: 
Implement Newton's method for calculating the square root of N. Your definition should use primitive recursive style.  See (http://bingweb.binghamton.edu/~head/CS471/HW/Haskell1F16.html) webpage for definition of Newton method for the approximation of roots. 
 Your definition should include a user defined (input) "guess" value and a user defined "nearEnough" value.  
"nearEnough" is use to determine when the guess is close enough to the square root.  (guess*guess = number) 
You should use locally defined helper functions to make your code more readable. You may use guards or "if expression"

e.g. 
   Haskell1> newtonAppr 144 1 0.1             
   12.000545730742438 
   Haskell1> newtonAppr 144 1 0.0001
   12.0000000124087
   Haskell1> newtonAppr 144 1 0.000000000000001
   12.0
   Haskell1> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   Haskell1> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15

Problem 8 Answer:
Note you may have a slightly different type depending on your solution.


> newtonAppr :: (Fractional a, Ord a) => a -> a -> a -> a
> newtonAppr number guess nearEnough  = if (nearEnough > abs (number - guess * guess)) then guess else newtonAppr number (((number / guess) + guess) / 2) nearEnough

Problem 8:
A Define sumHarmonic using a simple recursive style:

The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4

Problem 8 Answer:
Note you may have a slightly different type depending on your solution.

> sumH :: (Eq a, Fractional a) => a -> a
> sumH 0 = 0
> sumH 1 = 1
> sumH n = 1/n + sumH(n-1)


