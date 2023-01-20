begin_version
3
end_version
begin_metric
0
end_metric
8
begin_variable
var0
-1
2
Atom fullypeeled(food_item)
NegatedAtom fullypeeled(food_item)
end_variable
begin_variable
var1
-1
3
Atom handempty()
Atom holding(food_item)
Atom holding(food_peeler)
end_variable
begin_variable
var2
-1
2
Atom isbetween(food_item, moving_jaw, stationary_jaw)
NegatedAtom isbetween(food_item, moving_jaw, stationary_jaw)
end_variable
begin_variable
var3
-1
2
Atom islocked(vice_handle)
NegatedAtom islocked(vice_handle)
end_variable
begin_variable
var4
-1
3
Atom jawsarerightdistance(moving_jaw, stationary_jaw)
Atom jawsaretooclose(moving_jaw, stationary_jaw)
Atom jawsaretoofar(moving_jaw, stationary_jaw)
end_variable
begin_variable
var5
-1
2
Atom ontable(food_item)
NegatedAtom ontable(food_item)
end_variable
begin_variable
var6
-1
2
Atom ontable(food_peeler)
NegatedAtom ontable(food_peeler)
end_variable
begin_variable
var7
-1
2
Atom toppeeled(food_item)
NegatedAtom toppeeled(food_item)
end_variable
6
begin_mutex_group
3
1 0
1 1
1 2
end_mutex_group
begin_mutex_group
2
1 1
5 0
end_mutex_group
begin_mutex_group
2
1 2
6 0
end_mutex_group
begin_mutex_group
3
4 0
4 1
4 2
end_mutex_group
begin_mutex_group
3
4 0
4 1
4 2
end_mutex_group
begin_mutex_group
3
4 0
4 1
4 2
end_mutex_group
begin_state
1
0
1
0
1
0
0
1
end_state
begin_goal
2
0 0
5 0
end_goal
18
begin_operator
lock vice_handle
1
1 0
1
0 3 1 0
0
end_operator
begin_operator
movefromjaws food_item moving_jaw stationary_jaw
1
1 1
1
0 2 0 1
0
end_operator
begin_operator
movetojaws1 food_item moving_jaw stationary_jaw
3
1 1
4 0
5 1
1
0 2 1 0
0
end_operator
begin_operator
movetojaws2 food_item moving_jaw stationary_jaw
3
1 1
4 2
5 1
1
0 2 1 0
0
end_operator
begin_operator
peel_DETDUP_0 food_item food_peeler moving_jaw stationary_jaw vice_handle
5
0 1
1 2
2 0
3 0
4 0
1
0 7 1 0
0
end_operator
begin_operator
peel_DETDUP_1 food_item food_peeler moving_jaw stationary_jaw vice_handle
4
1 2
2 0
3 0
4 0
2
0 0 1 0
0 7 1 0
0
end_operator
begin_operator
pickup food_item
0
2
0 1 0 1
0 5 0 1
0
end_operator
begin_operator
pickup food_peeler
0
2
0 1 0 2
0 6 0 1
0
end_operator
begin_operator
putdown food_item
0
2
0 1 1 0
0 5 1 0
0
end_operator
begin_operator
putdown food_peeler
0
2
0 1 2 0
0 6 1 0
0
end_operator
begin_operator
rotate_DETDUP_01 food_item vice_handle moving_jaw stationary_jaw
2
1 0
3 1
2
0 4 0 2
0 7 0 1
0
end_operator
begin_operator
rotate_DETDUP_02 food_item vice_handle moving_jaw stationary_jaw
3
1 0
3 1
4 2
1
0 7 0 1
0
end_operator
begin_operator
rotate_DETDUP_11 food_item vice_handle moving_jaw stationary_jaw
3
1 0
3 1
4 0
1
0 7 0 1
0
end_operator
begin_operator
rotate_DETDUP_12 food_item vice_handle moving_jaw stationary_jaw
2
1 0
3 1
2
0 4 2 0
0 7 0 1
0
end_operator
begin_operator
slideinmovingjaw vice_handle food_item moving_jaw stationary_jaw
2
2 0
3 1
1
0 4 2 0
0
end_operator
begin_operator
slideoutmovingjaw1 vice_handle food_item moving_jaw stationary_jaw
1
3 1
1
0 4 1 2
0
end_operator
begin_operator
slideoutmovingjaw2 vice_handle food_item moving_jaw stationary_jaw
1
3 1
1
0 4 0 2
0
end_operator
begin_operator
unlock vice_handle
1
1 0
1
0 3 0 1
0
end_operator
0
