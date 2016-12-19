import Hw11

assert False s = error (s ++ " failed!")
assert True s  = print (s ++ " passed!")

ttree1 = (Node 5 (Node 2 (Node 1 Nil Nil) (Node 3 Nil Nil)) (Node 7 Nil (Node 9 Nil Nil)))
ttree2 = (Node 5 (Node 2 (Node 1 Nil Nil) Nil) (Node 7 Nil (Node 9 Nil Nil)))
ttree3 = (Node 5 (Node 7 Nil Nil) (Node 9 Nil Nil))
ttree4 = (Node 7 (Node 6 Nil Nil) (Node 10 (Node 8 Nil Nil) (Node 11 Nil Nil)))

inorder_flatten Nil = []
inorder_flatten (Node v l r) = inorder_flatten l ++ (v : inorder_flatten r)
is_inorder []   = True
is_inorder [x]  = True
is_inorder (x:y:xs) = x < y && is_inorder (y:xs)

sum_all_tree Nil = 0
sum_all_tree (Node v l r) = v + sum_all_tree l + sum_all_tree r

main = do
  assert (nat_add (S O) (S (S O)) == S (S (S O))) "nat_add0"
  assert (nat_add O (S (S O)) == S (S O)) "nat_add1"
  assert (nat_add (nat_of_integer 10) (nat_of_integer 10) == (nat_of_integer 20)) "nat_add2"

  assert (nat_sub (S O) (S (S O)) == None) "nat_sub0"
  assert (nat_sub (S (S O)) (S (S O)) == Some O) "nat_sub1"
  assert (nat_sub (S (S (S (S O)))) (S (S O)) == Some (S (S O))) "nat_sub2"

  assert (nat_mult (S (S O)) (S (S O)) == S (S (S (S O)))) "nat_mult0"
  assert (nat_mult (nat_of_integer 3) (nat_of_integer 3) == (nat_of_integer 9)) "nat_mult1"
  assert (nat_mult (nat_of_integer 100) (nat_of_integer 3) == (nat_of_integer 300)) "nat_mult2"

  assert ((S (S O)) ^ 4 == (nat_of_integer 16)) "instance_num0"
  assert ((S (S O)) * 2 == (nat_of_integer 4)) "instance_num1"

  assert (int_of_nat (nat_of_integer 4) == 4) "int_of_nat0"
  assert (int_of_nat (nat_of_integer 100) == 100) "int_of_nat1"
  assert (int_of_nat (nat_of_integer 0) == 0) "int_of_nat2"

  assert (nat_foldl (+) 0 (S (S (S O))) == nat_of_integer 6) "nat_foldl0"
  assert (nat_foldl (\y x -> int_of_nat x : y) [] (S (S (S O))) == [1,2,3]) "nat_foldl1"

  assert (nat_foldr (+) 0 (S (S (S O))) == nat_of_integer 6) "nat_foldr0"
  assert (nat_foldr (\x y -> y ++ [int_of_nat x]) [] (S (S (S O))) == [1,2,3]) "nat_foldr1"

  assert (nat_fact (nat_of_integer 5) == (nat_of_integer 120)) "nat_fact0"
  assert (nat_fact (nat_of_integer 0) == (nat_of_integer 1)) "nat_fact1"

  assert (is_bst ttree1 == True) "is_bst1"
  assert (is_bst ttree2 == True) "is_bst2"
  assert (is_bst ttree3 == False) "is_bst3"

  --assert ((inorder_flatten (tree_merge ttree1 ttree4)) == [1, 2, 3, 5, 6, 7, 8, 9, 10, 11]) "tree_merge0"
  --assert (tree_merge ttree1 ttree1 == ttree1) "tree_merge1"

  --assert (sum_all_tree ttree1 == tree_fold (+) 0 ttree1) "tree_fold0"
  --assert (sum_all_tree ttree4 == tree_fold (+) 0 ttree4) "tree_fold1"

  --assert (inorder_flatten ttree1 == inorder_list ttree1) "inorder_list0"
  --assert (inorder_flatten ttree2 == inorder_list ttree2) "inorder_list1"
  --assert (inorder_flatten ttree4 == inorder_list ttree4) "inorder_list2"




