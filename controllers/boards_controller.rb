module BoardsController
  def boards_index_action
    boards_hashes = get_request("/boards")
    boards = Board.convert_hashes(boards_hashes)
    boards_index_view(boards)
  end

  def boards_show_action
    input_id = boards_id_form
    board_hash = get_request("/boards/#{input_id}")
    board = Board.new(board_hash)

    boards_show_view(board)
  end

  def boards_create_action
    client_params = boards_new_form
    json_data = post_request("/boards", client_params)

    if !json_data["errors"]
      board = Board.new(json_data)
      boards_show_view(board)
    else
      errors = json_data["errors"]
      boards_errors_view(errors)
    end
  end

  def boards_update_action
    input_id = boards_id_form
    board_hash = get_request("/boards/#{input_id}")
    board = Board.new(board_hash)

    client_params = boards_update_form(board)
    json_data = patch_request("/boards/#{input_id}", client_params)

    if !json_data["errors"]
      board = Board.new(json_data)
      boards_show_view(board)
    else
      errors = json_data["errors"]
      boards_errors_view(errors)
    end
  end

  def boards_destroy_action
    input_id = boards_id_form
    json_data = delete_request("/boards/#{input_id}")
    puts json_data["message"]
    
  end
  
end