/*
 Programming Languages
 Prolog Homework. Working with Trees in Prolog.
 Assignment #7
 Developed by Salomón Charabati
 11-11-2019
*/


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

