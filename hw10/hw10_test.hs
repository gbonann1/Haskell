import Hw10

assert False s = error (s ++ " failed!")
assert True s  = print (s ++ " passed!")

main = do
  assert (sumALL [] == 0) "sum_all0"
  assert (sumALL [1,2,3] == 6) "sum_all1"

  assert (binOpALL (+) 0 [] == 0) "binOpALL0"
  assert (binOpALL (+) 0 [1,2,3] == 6) "binOpALL1"
  assert (binOpALL (-) 0 [1,2,3] == 2) "binOpALL2"
  assert (binOpALL (*) 1 [2,2,2] == 8) "binOpALL3"

  assert (insertAt 10 0 [1,2,3] == [10,1,2,3]) "insertAt0"
  assert (insertAt 'a' 1 "abc" == "aabc") "insertAt1"
  assert (insertAt 'a' 4 "abc" == "abca") "insertAt2"

  assert (insertAt99 0 [1,2,3] == [99,1,2,3]) "insert99At"
  assert (insertAt99 1 [1,2,3] == [1,99,2,3]) "insert99At"
  assert (insertAt99 4 [1,2,3] == [1,2,3,99]) "insert99At"

  assert (composeList [] 2 == 2) "composeList0"
  assert (composeList [ (*) 2, (*) 2]  2 == 8) "composeList1"
  assert (composeList [ (-) 3 , (*) 2, (+)5 ] 7 == -21) "composeList2"

  assert (thue [0] == [0,1]) "thue0"
  assert (thue [0,1] == [0,1,1,0]) "thue1"
  assert (thue [0,1,1,0] == [0,1,1,0,1,0,0,1]) "thue2"

  assert (replicate' [] == []) "replicate'0"
  assert (replicate' [0,2] == [2,2]) "replicate'1"
  assert (replicate' [1,2] == [1,2,2]) "replicate'2"
  assert (replicate' [2,4,1] == [2,2,4,4,4,4,1]) "replicate'3"

  assert (newtonAppr 144 1 0.1 == 12.000545730742438) "newtonAppr0"
  assert (newtonAppr 144 1 0.000000000000001 == 12.0) "newtonAppr1"

  assert (sumH 1 == 1.0) "sumH0"
  assert (sumH 3 == 1.8333333333333333) "sumH1"
