class Gear 
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

# Gear expects a 'Duck' that knows 'diameter'
# Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches

# isolate dependencies
# if it's not always possible to break all unnecessary dependencies then you
# should leave the code better than you found it.
# def initialize(chainring, cog, rim, tire)
#   @chainring = chainring
#   @cog = cog
#   @wheel = Wheel.new(rim, tire)
# end
#
