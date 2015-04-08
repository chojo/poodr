module Lepreshawn
  class Drawing
    NUMBERS = 6

    def draw
      NUMBERS.times.reduce([]) do |arr, i|
        arr << single_draw
      end
    end

#    private

    def single_draw
      rand(1..49) # including 49
    end
  end
end
