require 'json'

module Exercises
  class FilterPartyParticipants
    prepend SimpleCommand
    include Virtus.model

    attribute :budget, Float

    def call
      remaining_budget = budget
      employees.each_with_object([]) do |employee, list|
        if remaining_budget - budget_for_employee(employee) >= 0
          list << employee
          remaining_budget -= budget_for_employee(employee)
        end
      end
    end

    private

    def employees
      @employees ||= JSON.parse(File.read('lib/files/employees.json'))
    end

    def recipes
      @recipes ||= JSON.parse(File.read('lib/files/recipes.json'))
    end

    def prices
      @prices ||= JSON.parse(File.read('lib/files/prices.json'))
    end

    def drinks_with_price
      @drinks_with_price ||= begin
        recipes.each_with_object({}) do |(drink, recipe), list|
          list[drink.downcase] = recipe.merge(prices) do |_, recipe_price, drink_weight|
            recipe_price * drink_weight
          end.values.sum
        end
      end
    end

    def budget_for_employee(employee)
      employee['drinks'].reduce(0.0) do |budget, drink|
        budget + drinks_with_price[drink.downcase]
      end
    end
  end
end
