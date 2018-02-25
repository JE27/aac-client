module WordsController
  def words_index_action
    words_hashes = get_request("/words")
    words = Word.convert_hashes(words_hashes)
    words_index_view(words)
  end

  def words_show_action
    input_id = words_id_form
    word_hash = get_request("/words/#{input_id}")
    word = Word.new(word_hash)

    words_show_view(word)
  end

  def words_create_action
    client_params = words_new_form
    json_data = post_request("/words", client_params)

    if !json_data["errors"]
      word = Word.new(json_data)
      words_show_view(word)
    else
      errors = json_data["errors"]
      words_errors_view(errors)
    end
  end

  def words_update_action
    input_id = words_id_form
    word_hash = get_request("/words/#{input_id}")
    word = Word.new(word_hash)

    client_params = words_update_form(word)
    json_data = patch_request("/words/#{input_id}", client_params)

    if !json_data["errors"]
      word = Word.new(json_data)
      words_show_view(word)
    else
      errors = json_data["errors"]
      words_errors_view(errors)
    end
  end

  def words_destroy_action
    input_id = words_id_form
    json_data = delete_request("/words/#{input_id}")
    puts json_data["message"]
    
  end
  
end