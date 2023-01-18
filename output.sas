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
Atom between(food_item, moving_jaw, stationary_jaw)
NegatedAtom between(food_item, moving_jaw, stationary_jaw)
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
Atom locked(vice_handle)
NegatedAtom locked(vice_handle)
end_variable
begin_variable
var3
-1
2
Atom ontable(food_item)
NegatedAtom ontable(food_item)
end_variable
begin_variable
var4
-1
2
Atom ontable(food_peeler)
NegatedAtom ontable(food_peeler)
end_variable
begin_variable
var5
-1
2
Atom peeled(food_item)
NegatedAtom peeled(food_item)
end_variable
begin_variable
var6
-1
3
Atom rightdistance(moving_jaw, stationary_jaw)
Atom tooclose(moving_jaw, stationary_jaw)
Atom toofar(moving_jaw, stationary_jaw)
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
3 0
end_mutex_group
begin_mutex_group
2
1 2
4 0
end_mutex_group
begin_mutex_group
3
6 0
6 1
6 2
end_mutex_group
begin_mutex_group
3
6 0
6 1
6 2
end_mutex_group
begin_mutex_group
3
6 0
6 1
6 2
end_mutex_group
begin_state
1
0
0
0
0
1
1
1
end_state
begin_goal
2
3 0
5 0
end_goal
16
begin_operator
lock vice_handle
1
1 0
1
0 2 1 0
0
end_operator
begin_operator
moveaway food_item moving_jaw stationary_jaw
1
1 1
1
0 0 0 1
0
end_operator
begin_operator
movetoward1 food_item moving_jaw stationary_jaw
3
1 1
3 1
6 0
1
0 0 1 0
0
end_operator
begin_operator
movetoward2 food_item moving_jaw stationary_jaw
3
1 1
3 1
6 2
1
0 0 1 0
0
end_operator
begin_operator
peeling_DETDUP_0 food_item food_peeler moving_jaw stationary_jaw vice_handle
5
0 0
1 2
2 0
5 1
6 0
1
0 7 1 0
0
end_operator
begin_operator
peeling_DETDUP_1 food_item food_peeler moving_jaw stationary_jaw vice_handle
4
0 0
1 2
2 0
6 0
2
0 5 1 0
0 7 1 0
0
end_operator
begin_operator
pickup food_item
0
2
0 1 0 1
0 3 0 1
0
end_operator
begin_operator
pickup food_peeler
0
2
0 1 0 2
0 4 0 1
0
end_operator
begin_operator
putdown food_item
0
2
0 1 1 0
0 3 1 0
0
end_operator
begin_operator
putdown food_peeler
0
2
0 1 2 0
0 4 1 0
0
end_operator
begin_operator
rotate1 food_item vice_handle moving_jaw stationary_jaw
2
1 0
2 1
2
0 6 0 2
0 7 0 1
0
end_operator
begin_operator
rotate2 food_item vice_handle moving_jaw stationary_jaw
3
1 0
2 1
6 2
1
0 7 0 1
0
end_operator
begin_operator
slidein vice_handle food_item moving_jaw stationary_jaw
2
0 0
2 1
1
0 6 2 0
0
end_operator
begin_operator
slideout1 vice_handle food_item moving_jaw stationary_jaw
1
2 1
1
0 6 1 2
0
end_operator
begin_operator
slideout2 vice_handle food_item moving_jaw stationary_jaw
1
2 1
1
0 6 0 2
0
end_operator
begin_operator
unlock vice_handle
1
1 0
1
0 2 0 1
0
end_operator
0
