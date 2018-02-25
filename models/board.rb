class Board

  attr_accessor :user_id, :context

  def initialize(input_options)
    @user_id = input_options["user_id"]
    @context = input_options["context"]
    
  end

  def self.convert_hashes(board_hashes)
    collection = []

    board_hashes.each do |board_hash|
      collection << Board.new(board_hash)
    end

    collection
  end

end
