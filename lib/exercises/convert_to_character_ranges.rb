require 'virtus'
require 'simple_command'

module Exercises
  class ConvertToCharacterRanges
    prepend SimpleCommand
    include Virtus.model

    attribute :text, String

    def call
      intervals = text.scan(/\d+|[A-Za-z]+/)
      intervals.map do |interval|
        make_ranges(interval)
      end.join
    end

    private

    def make_ranges(interval)
      interval = interval.split('')
      consecutive_intervals(interval).map do |range|
        range.length > 2 ? "#{range.first}-#{range.last}" : range.join
      end.join
    end

    def consecutive_intervals(interval)
      prev = interval.first
      interval.slice_before do |el|
        el = el.ord
        prev2 = prev.ord
        prev = el
        (prev2 < el && prev2 + 1 != el) || (prev2 > el && prev2 - 1 != el)
      end
    end
  end
end
