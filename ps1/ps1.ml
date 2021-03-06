(*** CS 51 Problem Set 1 ***)
(*** January 28, 2012 ***)
(*** YOUR NAME HERE ***)

(* Problem 1 - Fill in types: 
 * Replace each ??? with the appropriate type of the corresponding expression.
 * Be sure to remove the comments from each subproblem and to type check it
 * before submission. *)

(*>* Problem 1a *>*)
(*
let prob1a : ???  = let greet y = "Hello " ^ y in greet "World!" ;;
*)

(*>* Problem 1b *>*)
(*
let prob1b : ??? = [Some 4.0; Some 2.7; None; Some 3.5] ;;
*)

(*>* Problem 1c *>*)
(*
let prob1c : ???  = ((None, Some 42), true) ;;
*)


(* Explain in a comment why the following will not type check, 
   and provide a fix *)

(*>* Problem 1d *>*)
(*
let prob1d : string * int list = [("CS", 50); ("CS", 51)] ;;
*)

(*>* Problem 1e *>*)
(*
let prob1e : bool = 
  let compare(x,y) = x < y in 
  compare (3.9, 4) ;;
*)

(*>* Problem 1f *>*)
(*
let prob1f : (string * string) list = 
  [("January", None); ("February", 1); ("March", None); ("April", None); 
   ("May", None); ("June", 1); ("July", None); ("August", None);
   ("September", 3); ("October", 1); ("November", 2); ("December", 3)] ;;
*)



(* Problem 2 - Fill in expressions to satisfy the following types: 
 *
 * NOTE: for option and list types, you must go at least one layer deep.
 * example problems:
 *   let x : int option = ??? ;;
 *   let y : int list = ??? ;;
 * incorrect answers:
 *   let x : int option = None ;;
 *   let y : int list = [] ;;
 * possible correct answers:
 *   let x : int option = Some 1 ;;
 *   let y : int list = [1] ;;
 *   let y : int list = [1; 2] ;;
 *   let y : int list = 1 :: [] ;;
 *)

(*>* Problem 2a *>*)
(*  
let prob2a : (float * (string * int) option list) list =
  ???
;;
*)

(*>* Problem 2b *>*)
(*
type student = {name: string; year: int option; house: string option};;
let prob2b : (student list option * int) list = 
  ???
;;
*)


(*>* Problem 2c *>*)
(*
let prob2c : (int * int -> int) * (float -> float -> unit) * bool  =
  ???
;;
*)


(* Fill in ??? with something that makes these typecheck: *)
(*>* Problem 2d *>*)
(*
let prob2d =
  let rec foo bar =
    match bar with
    | (a, (b, c)) :: xs -> if a then (b + c + (foo xs)) else foo xs
    | _ -> 0
  in foo ???
;;
*)

(*>* Problem 2e *>*)
(*
let prob2e =
  let v = (32.0, 28.0) in
  let square x = x *. x in
  let squared_norm (w: float * float) : float = ??? in
  let d = sqrt (squared_norm v) in
  int_of_float d
;;
*)



(* Problem 3 - Write the following functions *)
(* For each subproblem, you must implement a given function and corresponding
 * unit tests.  You are provided a high level description as well as a 
 * prototype of the function you must implement. *)

(*>* Problem 3a *>*)

(* reversed lst should return [true] if the integers in the list are in 
 * non-increasing order. The empty list is considered to be reversed. *)

(* Here is its prototype/signature: *)
(* reversed : int list -> bool *)

(* Implement reversed below, and be sure to write tests for it (see 3b for 
 * examples of tests). *)


(*>* Problem 3b *>*)

(* merge xs ys takes two integer lists, each sorted in increasing order,
 and returns a single merged list in sorted order.  For example:
# merge [1;3;5] [2;4;6];;
- : int list = [1; 2; 3; 4; 5; 6]
# merge [1;3;5] [2;4;6;12];;
- : int list = [1; 2; 3; 4; 5; 6; 12]
# merge [1;3;5;700;702] [2;4;6;12];;
- : int list = [1; 2; 3; 4; 5; 6; 12; 700; 702]
*)

(* The type signature for [merge] is as follows: *)
(* merge : int list -> int list -> int list *)

(*
(* sample tests *)
assert ((merge [1;2;3] [4;5;6;7]) = [1;2;3;4;5;6;7]) ;;
assert ((merge [4;5;6;7] [1;2;3]) = [1;2;3;4;5;6;7]) ;;
assert ((merge [4;5;6;7] [1;2;3]) = [1;2;3;4;5;6;7]) ;;
assert ((merge [2;2;2;2] [1;2;3]) = [1;2;2;2;2;2;3]) ;;
assert ((merge [1;2] [1;2]) = [1;1;2;2]) ;;
assert ((merge [-1;2;3;100] [-1;5;1001]) = [-1;-1;2;3;5;100;1001]) ;;
assert ((merge [] []) = []) ;;
assert ((merge [1] []) = [1]) ;;
assert ((merge [] [-1]) = [-1]) ;;
assert ((merge [1] [-1]) = [-1;1]) ;;
*)


(*>* Problem 3c *>*)
(* unzip should be a function which, given a list of pairs, returns a
   pair of lists, the first of which contains each first element of
   each pair, and the second of which contains each second element.
   The returned lists should have the elements in the order that they
   appeared in the input.  So, for instance, 
   unzip [(1,2);(3,4);(5,6)] = ([1;3;5],[2;4;6]) 
*)

(* The type signature for unzip is as follows: *)
(* unzip : (int * int) list -> int list * int list) *)


(*>* Problem 3d *>*)

(* variance lst should be a function that returns None if lst has fewer than 2
floats, and Some of the variance of the floats in lst otherwise.  Recall that
the variance of a sequence of numbers is 1/(n-1) * sum (x_i-m)^2, where
 a^2 means a squared, and m is the arithmetic mean of the list (sum of list /
length of list).  For example,
 - variance [1.0; 2.0; 3.0; 4.0; 5.0] = Some 2.5
 - variance [1.0] = None

Remember to use the floating point version of the arithmetic operators when
operating on floats (+. *., etc).  The "float" function can cast an int to a
float. 
*)

(* variance : float list -> float option *)


(*>* Problem 3e *>*)

(* few_divisors n m should return true if n has fewer than m divisors, 
 * (including 1 and n) and false otherwise:
few_divisors 17 3;;
- : bool = true
# few_divisors 4 3;;
- : bool = false
# few_divisors 4 4;;
- : bool = true
 *) 
(* The type signature for few_divisors is: *)
(* few_divisors : int -> int -> bool *)


(*>* Problem 3f *>*)

(* concat_list sep lst should take a list of strings and return one big
   string with all the string elements of lst concatenated together, but
   separated by the string sep.  Here are some example tests:
concat_list ", " ["Greg"; "Anna"; "David"] ;;
- : string = "Greg, Anna, David"
concat_list "..." ["Moo"; "Baaa"; "Quack"] ;;
- : string = "Moo...Baaa...Quack"
concat_list ", " [] ;;
- : string = "" ;;
concat_list ", " ["Moo"] ;;
- : string = "Moo"
*)
(* The type signature for concat_list is: *)
(* concat_list : string -> string list -> string *)

(*>* Problem 3g *>*)

(* One way to compress a list of characters is to use run-length encoding.  
  The basic idea is that whenever we have repeated characters in a list
  such as ['a';'a';'a';'a';'a';'b';'b';'b';'c';'d';'d';'d';'d'] we can 
  (sometimes) represent the same information more compactly as a list 
  of pairs like [(5,'a');(3,'b');(1,'c');(4,'d')].  Here, the numbers 
  represent how many times the character is repeated.  For example, 
  the first character in the string is 'a' and it is repeated 5 times, 
  followed by 3 occurrences of the character 'b', followed by one 'c', 
  and finally 4 copies of 'd'.

  Write a function to_run_length that converts a list of characters into 
  the run-length encoding, and then write a function from_run_length
  that converts back.  Writing both functions will make it easier to
  test that you've gotten them right.
*)
(* The type signatures for to_run_length and from_run_length are: *)
(* to_run_length : char list -> (int * char) list *)
(* from_run_length : (int * char) list -> char list *)

(*>* Problem 4 *>*)

(* Challenge!

  permutations lst should return a list containing every
  permutation of lst.  For example, one correct answer to 
  permutations [1;	2; 3] is 
  [[1; 2; 3]; [2; 1; 3]; [2; 3; 1]; [1; 3; 2];	[3; 1; 2]; [3; 2; 1]].  
   
  It doesn't matter what order the permutations appear in the returned list.
  Note that if the input list is of length n then the answer should be of
  length n!.

  Hint:
  One way to do this is to write an auxiliary function,
  interleave : int -> int list -> int list list,
  that yields all interleavings of its first argument into its second:
  interleave 1 [2;3] = [ [1;2;3]; [2;1;3]; [2;3;1] ].
  You may also find occasion for the library functions
  List.map and List.concat.
*)

(* The type signature for permuations is: *)
(* permutations : int list -> int list list *)


