module BoardsViews

  def boards_index_view(boards)
    puts "-" * 70
      boards.each do |board|
        boards_index_view(board)
        puts "-" * 70
      end
    end  

  def boards_show_view(board)
    puts
    puts "~" * 70
    puts board.context.upcase
    puts "~" * 70
    puts 
  end

  def boards_id_form
    print "Enter board id: "
    gets.chomp
  end

  def boards_new_form
    client_params = {}

    print "Context: "
    client_params[:context] = gets.chomp
    client_params
  end

  def boards_update_form(board)
    client_params = {}

    print "Context (#{board.context}):"
    client_params[:context] = gets.chomp

    client_params.delete_if { |key, value| value.empty? }
    client_params
  end
end