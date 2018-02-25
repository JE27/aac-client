module WordsViews

  def words_index_view(words)
    puts "-" * 70
      words.each do |word|
        words_index_view(word)
        puts "-" * 70
      end
    end  

  def words_show_view(word)
    puts
    puts "~" * 70
    puts word.content.upcase
    puts "~" * 70
    puts word.part_of_speech
    puts 
    puts word.symbol
  end

  def words_id_form
    print "Enter word id: "
    gets.chomp
  end

  def words_new_form
    client_params = {}

    print "Content: "
    client_params[:content] = gets.chomp
    print "Part of Speech: "
    client_params[:part_of_speech] = gets.chomp
    print "Image URL: "
    client_params[:symbol] = gets.chomp
    client_params
    
  end

  def words_update_form(word)
    client_params = {}

    print "Content (#{word.content}): "
    client_params[:content] = gets.chomp
    print "Part of Speech (#{word.part_of_speech}): "
    client_params[:part_of_speech] = gets.chomp
    print "Image URL (#{word.symbol}): "
    client_params[:symbol] = gets.chomp

    client_params.delete_if { |key, value| value.empty? }
    client_params
  end
end