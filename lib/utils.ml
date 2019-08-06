type gameState = {
  num_flips : int ;
  num_correct_guesses: int ;
}

let show_prompt () = print_endline "(h)eads, (t)ails, or (q)uit: "

let get_user_input () = (String.capitalize_ascii (read_line ()))

let parse_flip_result flip = match flip with
  | "H" -> "Heads"
  | "T" -> "Tails"
  | _ -> "Invalid input"

let print_game_state (game_state : gameState) = 
  print_endline (String.concat (String.concat  (string_of_int game_state.num_flips) ["#Flips: ";", #Correct: "]) [""; string_of_int game_state.num_correct_guesses])
    
let print_game_state_with_flips (printable_result : string)  (game_state : gameState) = 
  print_endline (String.concat "Flip was " ["";printable_result]);
  print_game_state game_state

let print_game_over () = print_endline ("=== GAME OVER ===")

let toss_coin () =
  Random.self_init ();
  let r = Random.int 2 in
    match r with
    | 0 -> "H"
    | 1 -> "T"
    | _ -> "X"
