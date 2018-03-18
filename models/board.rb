class Board

  attr_accessor :user_id, :context, :word, :word_id, :word_content, :word_symbol

  def initialize(input_options)
    @user_id = input_options["user_id"]
    @context = input_options["context"]
    
    @word = input_options["words"]
  end

  def word_convert(word_hashes)
    @word = input_options["words"]
    output_arr = []
    word_hashes.each do |word_hash|
      output_arr << Word.new(word_hash)
    end
    output_arr
  end



#   def self.convert_hashes(word_hashes)
#     collection = []

#     word_hashes.each do |word_hash|
#       collection << Board.new(word_hash)
#     end

#     collection
#   end

end
