include Lib

let rec mainloop (game_state: Utils.gameState) =
  Utils.show_prompt ();                  (* Prompt the user for input *)
  let input = Utils.get_user_input () in (* Put input value into input *)
    match input with
    | "H" 
    | "T"
    ->  let toss_result = Utils.toss_coin () in
          if (input = toss_result)
            then
              let new_game_state = (Utils.update_game_state game_state true) in
                Utils.print_game_state_with_flips (Utils.parse_flip_result @@ toss_result) new_game_state;
                new_game_state |> mainloop
            else
              let new_game_state = (Utils.update_game_state game_state false) in
                Utils.print_game_state_with_flips (Utils.parse_flip_result @@ toss_result) new_game_state;
                new_game_state |> mainloop
    | "Q" 
    ->  Utils.print_game_over () ; 
          game_state |> Utils.print_game_state
    | _ 
    ->  print_endline "Invalid input" ; 
          game_state |> mainloop

let main () =
  mainloop Utils.{num_flips=0; num_correct_guesses=0}

let _ = main () ;;