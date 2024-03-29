/*
Implementations of binary search trees in Prolog
Gilberto Echeverria
21/10/2019
*/

% Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).
% Invalid tree
test_tree(2, node(6, node(2, node(5, nil, nil)), node(8, nil, nil))).


%%% Predicate to determine if an expression is a valid tree
% Base case fact
is_tree(nil).
% Recursive calls
is_tree(node(_, LT, RT)) :-
    is_tree(LT),
    is_tree(RT).

%%% Search for an element inside the tree
tree_element(X, node(R, _, _)) :-
    X = R.
tree_element(X, node(R, LT, _)) :-
    X < R,
    tree_element(X, LT).
tree_element(X, node(R, _, RT)) :-
    X > R,
    tree_element(X, RT).

%%% Insert a new element X in the tree. The result is NewTree
% Base case
tree_insert(X, nil, node(X, nil, nil)).
% If the element is already in the tree, do nothing
tree_insert(X, node(R, LT, RT), node(R, LT, RT)) :-
    X = R.
tree_insert(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_insert(X, LT, NLT).
tree_insert(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_insert(X, RT, NRT).

%%% Convert a tree into an ordered list
tree_inorder(nil, []).
tree_inorder(node(R, LT, RT), L) :-
    tree_inorder(LT, LL),
    tree_inorder(RT, RL),
    append(LL, [R|RL], L).

%%% Print a nicely formatted tree
print_tree(nil, 0, _).
print_tree(Tree, Depth, Char).


%%% Delete an element from the tree
tree_delete(_, nil, nil).
% Find the element
tree_delete(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_delete(X, LT, NLT).
tree_delete(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_delete(X, RT, NRT).
% Delete the element found
% Leaf node
tree_delete(X, node(X, nil, nil), nil).
% Only one branch
tree_delete(X, node(X, LT, nil), LT).
tree_delete(X, node(X, nil, RT), RT).
% Two branches
tree_delete(X, node(X, LT, RT), node(Min, LT, NRT)) :-
    tree_min(RT, Min),
    tree_delete(Min, RT, NRT).

% Find the smallest number in a tree
tree_min(nil, nil).
tree_min(node(R, nil, _), R).
tree_min(node(_, LT, _), Min) :-
    tree_min(LT, Min).

%%% tree_hieght: Compute the height of a tree
%%% Two parameters, the tree and the resulting height
% Base case fact
tree_height(nil,0).
% Recursive calls          
%% We receieve a tree and will store its height in Res.
%% First, calculate the height of right tree, then we calculate the height of the left tree 
%% and finally add 1 (the root element) to the biggest tree (out of left or right tree)   
tree_height(node(_,RT,LT),Res) :-  % Root as anonyomus variable to avoid 'singleton variable' warning
    tree_height(RT,RightHeight),
    tree_height(LT,LeftHeight),
    Res is max(RightHeight,LeftHeight) + 1. % Use of max function, which is defined by Prolog here https://www.swi-prolog.org/man/arith.html

%----------------------------------------------------------------------------------------------------%

%%% list_leaves: Generate a list of all the elements at the leafs of the tree (nodes without children). 
%%% Two parameters, the tree and the resulting list
% Base case facts
%% Facts. If a tree is empty, return an empty list.
%%        A leaf is a leaf, only if it has no children. Therefore, leafs are (node(R,nil,nil))
%%        If it's a leaf, then that element should be inserted in the resulting list.
list_leaves(nil,[]).
list_leaves(node(Leaf,nil,nil),[Leaf]).

% Recursive calls
%% We receive a tree and will retrun a ResultingList with all of the leaves
%% First, calculate the leaves in the RightTree and save it in RightList
%% We repeat the past operation on the LeftTree 
%% Finally, we append both lists into ResultingList.
list_leaves(node(_,RightTree,LeftTree),ResultingList) :- % Root as anonyomus variable to avoid 'singleton variable' warning
    list_leaves(RightTree,RightList),
    list_leaves(LeftTree,LeftList),
    append(RightList,LeftList,ResultingList).

%----------------------------------------------------------------------------------------------------%
%%% symmetric_tree: Determine if a tree has the same structure on its left and right branches, inverted. 
%%%  Only parameter is a tree
% Base case facts
symmetric_tree(nil).
symmetric_tree(node(_,nil,nil)).
%% Entry point to mirror_tree 
symmetric_tree(node(_,RightTree,LeftTree)) :-
    mirror_tree(RightTree,LeftTree).

%%% mirror_tree: Used to solve the previous predicate. 
%%% Compare two trees to see if they have a mirrored structure. Two arguments, both trees.
%%% Returns false if trees are not symmetric.
% Base case fact. 
mirror_tree(nil,nil).
% Recursive calls
mirror_tree(node(_,RightTree1,LeftTree1),node(_,RightTree2,LeftTree2)) :-
    mirror_tree(RightTree1,LeftTree2),
    mirror_tree(LeftTree1,RightTree2).
