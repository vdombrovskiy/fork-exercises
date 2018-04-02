module Exercises
  class SplitTextIntoChunks
    prepend SimpleCommand
    include Virtus.model

    attribute :text, String
    attribute :length, Integer

    def call
      text.scan(/.{1,5}\b|.{1,5}/).map(&:strip).join('\n')
    end
  end
end
