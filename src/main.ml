include Lib

let rec mainloop (game_state: Utils.gameState) =
  Utils.show_prompt ();
  let input = Utils.get_user_input () in 
      match input with
      | "H" | "T" 
      ->  let toss_result = Utils.toss_coin () in
            let new_num_flips = game_state.num_flips + 1 in
              if (input = toss_result)
              then
                let new_num_correct = game_state.num_correct_guesses + 1 in
                  let new_game_state = Utils.{num_flips = new_num_flips; num_correct_guesses = new_num_correct} in
                    Utils.print_game_state_with_flips (Utils.parse_flip_result toss_result) new_game_state;
                    mainloop(new_game_state)
              else
                let new_game_state = Utils.{num_flips = new_num_flips; num_correct_guesses = game_state.num_correct_guesses} in
                  Utils.print_game_state_with_flips (Utils.parse_flip_result toss_result) new_game_state;
                  mainloop(new_game_state)
      | "Q" 
      ->  Utils.print_game_over () ; 
            Utils.print_game_state game_state ;
      | _ 
      ->  Utils.print_game_over () ; 
            Utils.print_game_state game_state ;;

let main () =
  mainloop Utils.{num_flips=0; num_correct_guesses=0}

let _ = main () ;;
