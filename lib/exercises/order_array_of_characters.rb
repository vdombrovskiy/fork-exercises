module Exercises
  class OrderArrayOfCharachters
    prepend SimpleCommand
    include Virtus.model

    attribute :characters, Array
    attribute :template, String

    def call; end
  end
end
