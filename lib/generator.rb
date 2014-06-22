module Markov
  class Generator
    require "strscan"
    attr_accessor :corpus, :look_ahead, :words
    attr_reader :probability_table

    def initialize(corpus, look_ahead, words_to_make)
      @probability_table = {}
      @corpus, @look_ahead, @words = corpus, look_ahead, words_to_make
      generate_table
      populate_table
    end

    def generate_text
      result = String.new
      word_hash = @probability_table.to_a.sample(1).to_h

      word = word_hash.keys[0]
      result << word

      @words.times do
        break if word_hash[word].nil?
        rand_word = word_from_weighted_hash(word_hash[word])
        result << rand_word
        new_hash = @probability_table[rand_word]
        word_hash = {rand_word => new_hash}
        word = word_hash.keys[0]
      end
      result
    end

    private
    def generate_table
      @corpus.scan(/.{#{@look_ahead}}/).each do |word|
        @probability_table[word] = {} unless @probability_table.has_key? word
      end 
    end

    def populate_table
      corpus_index = 0
      string_scanner = StringScanner.new(@corpus)
      while (corpus_index < @corpus.length - @look_ahead)
        puts "#{corpus_index}/#{@corpus.length}"
        first_word = string_scanner.scan(/.{#{@look_ahead}}/)
        follower = string_scanner.scan(/.{#{@look_ahead}}/)
        if @probability_table[first_word].has_key? follower
          @probability_table[first_word][follower] += 1
        else
          @probability_table[first_word][follower] = 1
        end
        corpus_index += @look_ahead
        string_scanner.unscan unless follower.nil?
      end
    end

    def word_from_weighted_hash(hash)
      result = ""
      sum = hash.each_value.inject(0) { |value, sum| sum += value }
      random_weight = rand(1..sum)
      loop do
        pair = hash.to_a.sample(1).to_h
        val = pair.values[0]
        if val > random_weight
          result = pair.keys[0]
          break 
        else
          random_weight -= val
        end
      end
      result
    end

  end
end