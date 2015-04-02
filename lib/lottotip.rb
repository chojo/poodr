class Lottotip
  NUMBERS = 6
  
  def draw
    NUMBERS.times.reduce([]) do |arr, i| 
      arr << single_draw
    end
  end
  
  private
  
  def single_draw
    rand(0...49)
  end
end
