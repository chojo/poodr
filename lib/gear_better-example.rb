class Gear 
  attr_reader :chainring, :cog, :wheel
  # remove argument-order dependencies
  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @rim = args[:rim]
    @wheel = args[:wheel]
  end

  # Gear.new(
  #   chainring: 52,
  #   cog: 11,
  #   wheel: Wheel.new(26, 1.5)).gear_inches

# isolate dependencies
# if it's not always possible to break all unnecessary dependencies then you
# should leave the code better than you found it.
# def initialize(chainring, cog, rim, tire)
#   @chainring = chainring
#   @cog = cog
#   @wheel = Wheel.new(rim, tire)
# end
#


  def gear_inches
    #ratio * wheel.diameter # this is a simple method and it contains Gear's only reference to wheel.diameter. But in a more complex situation where wheel.diameter is embedded deeply inside a complex method increases its vulnerability. Better:
    # ... a few lines of scary math
    ratio * diameter
    # ... more lines of scary math
  end

  def diameter
    wheel.diameter
  end  

  def ratio
    chainring / cog.to_f
  end
end
