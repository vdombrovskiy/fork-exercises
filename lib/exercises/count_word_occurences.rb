module Exercises
  class CountWordOccurences
    prepend SimpleCommand
    include Virtus.model

    attribute :values, Array

    def call
      word_occurences = values.each_with_object(Hash.new(0)) { |word, h| h[word] += 1; }
      word_occurences.map do |k, v|
        v >= 3 ? "#{k} (#{v})" : Array.new(v, k)
      end.flatten
    end
  end
end
