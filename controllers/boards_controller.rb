module BoardsController
  def boards_index_action
    boards_hashes = get_request("/boards")
    boards = Board.convert_hashes(boards_hashes)
    boards_index_view(boards)
  end

end