> module Hw12
>    where

Homework Assignment 12
Programming Languages
CS471, FALL 2016
Binghamton University 

Instructions

This section deals with general submission instructions. First, grab this assignment's Hw12.lhs. You will be able to code in and run the file in ghci directly. NOTE: Do not rename the file, it must be named Hw12.lhs. I recommend reading this assignment directly from the source file. 
 
BEFORE MOVING ON: Use spaces when writing Haskell, as you cannot intermix spaces and tabs. Its fine to use the tab key, just make sure it emits spaces. If you are seeing weird parsing errors, this is most likely the reason.
 
I have provided a small test harness that you may use to test your code. Grab <a href="hw11_test.hs">hw12_test.hs</a> and its associated <a href="Makefile">Makefile</a>. Each function that you must write has some associated tests, commented out by default. As you answer the quests, uncomment the tests for each function, and run <code>make test</code>. If everything is correct, you should see "TEST passed!" for each test, otherwise an error will be thrown. 

In addition, I have provided the type signatures for each function you must write (again, initially commented with spaces). Remove spaces before ">" each as you write your code. They are there to help reduce confusion about what is expected; the tests provide simple documentation as well.

NOTE: I HIGHLY recommend you write your Haskell code and reload into ghci to run some expressions like I did in class BEFORE testing using the tester. It's equally important for you to interact and experiment with the code you write. 

Submission

For this assignment you must submit only the source file. There is no need to tar anything as all coding should be done directly in Hw11.lhs


Problem 1: (Thompson 10.13)
Find functions X and Y so that the following definition
 
 s8 = map X . filter Y 

has the same effect as 

> p8 = filter (>0) . map (+1)

Note that X and Y are just placeholders above. You should define your own working version 
of s8 below using the template definition above.

Problem 1 Answer:  

> s8 = map (+1) . filter (> -1)


Problem 2: 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions, write functions f1 and f2 so the following evaluation is valid: 
(hint: a lambda expressions could be useful).

f1 (f2 (*) [1,2,3,4]) 5 ~> [5,10,15,20]

Simply define f1 and f2 below. If done correctly, it should the tester should pass.

Problem 2 Answer:  

> f1 f arg = f arg
> f2 f list = (\arg -> map (\elem -> f arg elem) list)


Problem 3:
In a previous homework you defined a function `composeList` which composes a list of 
functions into a single function.

Now, write a function `composeListHof` that solves the problem using a higher-order function.
The definition should use a 'fold' and it should be only be one line AND use no explicit 
arguments (use partial evaluation).   

Problem 3 Answer:  

> composeListHof :: [b -> b] -> b -> b
> composeListHof = foldr (.) id


Problem 4: (from http://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence )
In homework 10 problem 6 you wrote a primitive recursive function to produce the next
element in the Thue-Morse sequence, (also know as Prouhet-Thue-Morse sequence)

One possible solution is 

> thue (s:sx) = (mod s  2 ) : (mod (s +1)  2): thue sx
> thue [ ] = [ ]

Write a function thueMap that solves thue using `map` instead of explicit recursion. 

Problem 4 Answer:

> mynegate x
>	| x == 1 = 0
>	| x == 0 = 1

> thueMap :: (Eq a, Num a) => [a] -> [a]
> thueMap x = x ++ map mynegate x


Problem 5:

Using your definition of thue or thueMap, write `thueMapSeq` which generates an infinite list
of thue elements. You will have to use `take` to grab some of the elements from the list
(after you have written the function)

take 4 thueMapSeq = [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1]]

You may view the circular list example from class at 
(http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html)
 
Problem 5 Answer:  

	> thueMapSeq :: [[Integer]]

> thueMapSeq = [0]: [thueMap x | x <- thueMapSeq]

		
 
[a | a<-[2..(div x 2)], (mod x a) == 0]


Problem 6:
Using higher-order functions, define flattenT that takes a list of tuples (2-pair value) and 
returns a list with all values from the tuple "flattened". For exampe...

flattenT [(1,2), (3,4), (11,21),(-5,45)] = [1,2,3,4,11,21,-5,45]

Problem 6 Answer:  

> flattenT :: [(a, a)] -> [a]
> flattenT x = foldr (\(a,b) c -> a:b:c) [] x


Problem 7: 
Using higher-order functions, write a function `flattenR` that does the same thing as
`flattenT` but returns the list in reverse order. You must use higher-order functions, and
can not simply call reverse on the result of flattenT.

Problem 7 Answer:  

> flattenR :: [(a, a)] -> [a]
> flattenR x = foldr (\(a,b) c -> b:a:c) [] x

Problem 8:

Write a function `allTrue` that takes a list of expressions that evaluate to Bools and 
returns `True` if all the expressions evaluated to `True`. You should use a fold, and
take no explicit paramters.

Problem 8 Answer:

> allTrue :: [Bool] -> Bool
> allTrue = foldr (&&) True



Problem 9:

Write a function `noneTrue` that takes a list of expressions that evaluate to Bools and 
returns `True` if NONE of the expressions evaluate to `True`. You should use a fold, and
takes no explicit paramters. You may use the (.) operator.  

Problem 9 Answer:

> noneTrue :: [Bool] -> Bool
> noneTrue x = not (foldr (||) False x)

Problem 10: 

Using the following function `f` is an example

> f = \xs -> [ x + 5 | x <- xs, x > -1 ]

Write a new function, `myf` that functions the same as f but either

(1) Uses explicit recursion and pattern-matching, without guards
(2) Uses explicit recursion with guards but without pattern-matching

Problem 10 Answer:  

> myf :: (Num a, Ord a) => [a] -> [a]
> myf =  map (+5) . filter (>(-1))


Problem 11
Write a function `merge` that takes two sorted lists of integers and merges them together.
Your merge function should preserve the sorted property on the new list. In addition, it
should only contain unique elements. For example, 

merge [1,8,9,100] [3,7,9,99,100] = [1,3,7,8,9,99,100]

Problem 11 Answer: 

> merge :: Ord a => [a] -> [a] -> [a]
> merge x [] = x
> merge [] x = x
> merge (x:xs) (y:ys)
>	| x < y = x:merge xs (y:ys) 
>	| x > y = y:merge (x:xs) ys
>	| x == y = x:merge xs ys


Problem 12:  (Thompson 17.23 )
Write a function `hamming` that generates the list of hamming numbers. A hamming number
is a number whose only factors are prime numbers 2, 3, and 5.  You may consider using any combinition of the following techiques to express your solution: list comprehension notation, 
and/or explicit recursion, and/or local definitions. 

For example,

take 15 hamming = [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]

In addition, you may use `factors` but it will be very slow.

> factors :: Integer -> [Integer]
> factors x = 1:[a | a<-[2..(div x 2)], (mod x a) == 0] ++ [x]

(Hint: Apply the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)) 

Problem 12 Answer:  

> hamming :: [Integer]
> hamming = 1:[e|e <- [1..], (mod e 2 == 0 || mod e 3 == 0 || mod e 5 == 0) && not (mod e 7 == 0) && not (mod e 11 == 0)]



