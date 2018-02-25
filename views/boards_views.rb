module BoardsViews

  def boards_index_view(boards)
    puts "-" * 70
      boards.each do |board|
        boards_index_view(board)
        puts "-" * 70
      end
    end  
end