require "leprechaun/version"

module Leprechaun
  class Drawing
    NUMBERS = 6

    def draw
      NUMBERS.times.reduce([]) do |arr, i|
        arr << single_draw
      end
    end

    def single_draw
      rand(0...49)
    end
  end
end
