class Word

  attr_accessor :content, :part_ofspeech, :symbol

  def initialize(input_options)
    @content = input_options["content"]
    @part_ofspeech = input_options["part_ofspeech"]
    @symbol = input_options["symbol"]
  end

  def self.convert_hashes(word_hashes)
    collection = []

    word_hashes.each do |word_hash|
      collection << Word.new(word_hash)
    end

    collection
  end

end
